; -- test.iss --
; restools
; http://restools.hanzify.org

#include "trayiconctrl.ish"

#ifdef IS_ENHANCED
  #if (Ver < 0x5020300) || (Pos('ee', IS_Ver_Str) < 1)
    #pragma error 'Enhanced edition of Inno Setup (5.2.3.ee1 or higher) is required to compile this script'
    // http://restools.hanzify.org/article.asp?id=89
  #endif
#else
  #error Enhanced edition of Inno Setup (restools) is required to compile this script
#endif

[Setup]
AppName=MyApp
AppVerName=MyApp Ver 1.0
DefaultDirName={pf}\MyApp
DefaultGroupName=MyApp
Compression=lzma
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: "icons\face.ico"; Flags: dontcopy

[code]
function LoadImage(hInst: UINT; ImageName: String; ImageType: UINT; X, Y: Integer; Flags: UINT): THandle;
external 'LoadImage{#A}@user32.dll stdcall';

const
  WM_USER = $400;
 	WM_ICON_NOTIFY = WM_USER + 22; // �Լ�����һ�� TrayIcon ����Ϣ��־�Ժ���������Ϣ����
  IMAGE_ICON = 1;
  LR_LOADFROMFILE = $10;

var
  MySetupForm: TSetupForm;
  Ico: UINT;

procedure InitializeWizard();
begin
  PDir('trayiconctrl.dll');
  ExtractTemporaryFile('face.ico');
  
  MySetupForm := CreateCustomForm();
  MySetupForm.BorderStyle := bsSizeable;
  MySetupForm.Caption := 'Test My SetupForm';
  MySetupForm.SetBounds(0,0,400,300);
  MySetupForm.Center;
  
  Ico := LoadImage(0, ExpandConstant('{tmp}\face.ico'), IMAGE_ICON, 16, 16, LR_LOADFROMFILE);
  InitTrayIconCtrl(MySetupForm.Handle, MySetupForm.Handle,
             WM_ICON_NOTIFY,   // �Զ����Լ�����Ϣ ID, ������������Ϣ
             'MyApp Ver 1.0',  // Tooltip ����� TrayIcon ͼ�����ƶ���ʱ����ʾ����ʾ
             Ico,              // ����Ĭ��ʹ�ð�װ����ͼ��
             True,             // ������ʾ, ���õ��� ShowTrayIcon
             False,            // ����ʾ��װ�������������ť
             '',               // ����������ͼ��˵�
             -1,               // û��Ĭ�ϲ˵���
             nil,              // û�в˵�����¼�
             nil,              // û�в˵������¼�
             nil               // û���Զ�������ͼ���¼�
             );

  // ��ʾ������������ʾ
  ShowBalloon('Setup is starting...', 'MyApp ver 1.0', 0, 10, False);
  
  MySetupForm.ShowModal;
  MySetupForm.Free;
  
  UninitTrayIconCtrl();
  
  WizardForm.BorderStyle := bsNone;
  WizardForm.Height := 0;
  Application.Terminate;
end;

