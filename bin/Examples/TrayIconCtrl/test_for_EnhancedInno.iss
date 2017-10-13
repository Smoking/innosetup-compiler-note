; -- test_for_EnhancedInno.iss --
; restools
; http://restools.hanzify.org

#ifdef IS_ENHANCED
  #if (Ver < 0x5020300) || (Pos('ee', IS_Ver_Str) < 1)
    #pragma error 'Enhanced edition of Inno Setup (5.2.3.ee1 or higher) is required to compile this script'
    // http://restools.hanzify.org/article.asp?id=89
  #endif
#else
  #error Enhanced edition of Inno Setup (restools) is required to compile this script
#endif

#include "trayiconctrl.ish"

[Setup]
AppName=MyApp
AppVerName=MyApp Ver 1.0
DefaultDirName={pf}\MyApp
DefaultGroupName=MyApp
Compression=lzma
;WindowVisible=yes
OutputDir=userdocs:Inno Setup Examples Output

[code]
function GetCursorPos(var lpPoint: TPoint): BOOL; external 'GetCursorPos@user32.dll stdcall';
function IsWindowEnabled(hWnd: HWND): BOOL; external 'IsWindowEnabled@user32.dll stdcall';

const
  WM_USER = $400;
 	WM_ICON_NOTIFY = WM_USER + 22; // �Լ�����һ�� TrayIcon ����Ϣ��־�Ժ���������Ϣ����
  WM_RBUTTONUP = $205;
var
  PupMnu: TPopupMenu;

procedure MenuOnClick(Sender: TObject);
begin
  case TMenuItem(Sender).HelpContext of
  101: ToggleWizardVisible;
  102: MainForm.ShowAboutBox;
  103: WizardForm.Close;
  end;
  WizardForm.BringToFront;
end;

procedure PMenuOnPopup(Sender: TObject);
begin
  // �����ǲ˵�����ǰ�Ĵ���, ���µ������ǵ� WziardForm ������������ʱ��, ���� "About" �� "Exit" �Ĳ˵�
  PupMnu.Items.Items[2].Enabled := not WizardFormInTray;
  PupMnu.Items.Items[4].Enabled := not WizardFormInTray;
end;

function LOWORD(DW: LongWord): LongWord;
begin
  Result := DW and $FFFF;
end;

function MyTrayIconMsgCallBack(wParam, lParam: LongWord): Boolean;
var
  lpPoint: TPoint;
begin
  Result := False;
  if LOWORD(lParam) = WM_RBUTTONUP then // �������ʾ �Ҽ����ͼ�꽫�ᵯ���˵�
    if IsWindowEnabled(WizardForm.Handle) then // ��һ���Ч������� WizardForm ��ʾ�˶Ի����,Ϊ�˷�ֹ������ʾ�Ի���,���Խ�ֹ���Ҽ��˵�
    begin
      GetCursorPos(lpPoint);
      PupMnu.Popup(lpPoint.x, lpPoint.y);
      Result := True; // �Ѿ���ɶԸ���Ϣ�Ĵ������� True �������������ڲ�����
    end;
end;

procedure InitializeWizard();
begin
  PDir('trayiconctrl.dll');
  PupMnu := NewPopupMenu(WizardForm, 'MyPopupMenu', paLeft, True, [
      NewItem('&Show/Hide WizardForm', 0, False, True, @MenuOnClick, 101, 'piShowHideWizardForm'),
      NewLine,
      NewItem('&About...', 0, False, True, @MenuOnClick, 102, 'piAbort'),
      NewLine,
      NewItem('E&xit', 0, False, True, @MenuOnClick, 103, 'piExit')
  ]);
  PupMnu.OnPopup := @PMenuOnPopup;

  InitTrayIconCtrl(MainForm.Handle, WizardForm.Handle,
			 WM_ICON_NOTIFY,        // �Զ����Լ�����Ϣ ID, ������������Ϣ
			 'MyApp Ver 1.0',       // Tooltip ����� TrayIcon ͼ�����ƶ���ʱ����ʾ����ʾ
			 0,                     // ����Ĭ��ʹ�ð�װ����ͼ��
       True,                  // ������ʾ, ���õ��� ShowTrayIcon
			 False,                 // ����ʾ��װ�������������ť
			 '',                    // ����������ͼ��˵�
			 -1,                    // û��Ĭ�ϲ˵���
			 nil,                   // û�в˵�����¼�
			 nil,                   // û�в˵������¼�
			 @MyTrayIconMsgCallBack // �Զ�������ͼ���¼�
			 );

  // ��ʾ������������ʾ
  ShowBalloon('Setup is starting...', 'MyApp ver 1.0', 0, 10, False);

end;

procedure DeinitializeSetup();
begin
  MainForm.Hide;
  WizardForm.Hide;
  UninitTrayIconCtrl();
end;








