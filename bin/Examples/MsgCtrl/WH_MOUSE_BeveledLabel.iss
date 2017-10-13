; -- WH_MOUSE.iss --
; restools
; http://restools.hanzify.org
; WinMsgCtrl.dll Ϊһ������ Inno Setup �� 6 KB �� Windows ��Ϣ��ȡ�����
; ������������ʾ��δ���װ����� Windows Message��

; ���������ʾ���� Mouse Message ��ʹ��.

; Ver 1.2 ������ĳЩ Windows ƽ̨��(���� Windows XP SP3)�����������е����⡣

; �����õĵ����ڵ���״̬�¿��ܸо��е�ٻ�����ֱ���������ɵİ�װ����鿴Ч����

#include "MsgCtrl.ish"

[Setup]
AppName=MyApp
AppVerName=MyApp Ver 1.0
DefaultDirName={pf}\MyApp
DefaultGroupName=MyApp
Compression=lzma
OutputDir=userdocs:Inno Setup Examples Output

[Messages]
BeveledLabel=BrandingTexts

[code]
const
  WH_MOUSE = 7;

type
  TMouseHookStruct = record
    pt: TPoint;
    hwnd: HWND;
    wHitTestCode: UINT;
    dwExtraInfo: DWORD;
  end;

// �ص�����������ʽ����
//TMessageProc = procedure(nCode: LongWord; wParam: LongWord; lParam: LongWord);
  TMessageProc = procedure(nCode: LongWord; wParam: LongWord; lParam: TMouseHookStruct);

  {# MsgCtrl_SetWinHookEx }

function GetWindowRect(hWnd: HWND; var lpRect: TRect): BOOL;
external 'GetWindowRect@user32.dll stdcall';

var
  HandleMark: Boolean;

function MyPtInRect(const lprc: TRect; pt: TPoint): Boolean;
begin
  Result := (pt.x >= lprc.Left) and (pt.x <= lprc.Right) and (pt.y >= lprc.Top) and (pt.y <= lprc.Bottom);
end;

procedure MyMessageProc(nCode: LongWord; wParam: LongWord; lParam: TMouseHookStruct);
var
  MPpt: TPoint;
  ItemRect: TRect;
begin
  if HandleMark then exit;
  if nCode >= 0 then
  try
    HandleMark := True;
    MPpt := lParam.pt;
    GetWindowRect(WizardForm.BeveledLabel.Handle, ItemRect);
    ItemRect.Right := ItemRect.Left + WizardForm.Bevel.Width;

		if (lParam.hwnd = WizardForm.BeveledLabel.Handle) or MyPtInRect(ItemRect, MPpt) then
    begin
      WizardForm.BeveledLabel.Font.Style := [fsUnderline];
    end
    else
    begin
      WizardForm.BeveledLabel.Font.Style := [];
    end;
  finally
    HandleMark := False;
  end;
end;

procedure BeveledLabelClick(Sender: TObject);
begin
  MsgBox('kk', mbInformation, MB_OK);
end;

procedure InitializeWizard();
begin
  PDir('winmsgctrl.dll');
  HandleMark := False;
  SetWinHookEx(WH_MOUSE, @MyMessageProc);
  WizardForm.BeveledLabel.Enabled := True;
  WizardForm.BeveledLabel.Cursor := crHand;
  WizardForm.BeveledLabel.Font.Color := clGreen;
  WizardForm.BeveledLabel.OnClick := @BeveledLabelClick;
end;

procedure DeinitializeSetup();
begin
  UnhookWinHookEx();
end;

