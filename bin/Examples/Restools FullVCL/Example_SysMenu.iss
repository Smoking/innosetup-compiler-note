; ��ʾ���ʹ����ǿ�����尲װ�������ǿ�ı�������
; �ű�: restools ( http://restools.hanzify.org )
; ���ｫ����ʾ������ǿ���ܲ��ṩ��ؽ��͡�

; ��������� VCL ���Ժͺ�����������鿴��Support Classes.txt��

#ifdef IS_ENHANCED
  #if (Ver < 0x5020300) || (Pos('ee', IS_Ver_Str) < 1)
    #pragma error 'Enhanced edition of Inno Setup (5.2.3.ee1 or higher) is required to compile this script'
  #endif
#else
  #error Enhanced edition of Inno Setup (restools) is required to compile this script
#endif

#ifdef UNICODE
  #define A "W"
#else
  #define A "A"
#endif

[Setup]
AppName=My Application
AppVersion=1.5
DefaultDirName={pf}\My Application
SolidCompression=yes
Compression=lzma/ultra	
PrivilegesRequired=none
OutputDir=userdocs:Inno Setup Examples Output

[code]
function AppendMenu(hMenu: HMENU; uFlags, uIDNewItem: UINT; lpNewItem: String): BOOL;
external 'AppendMenu{#A}@user32.dll stdcall';

function GetSystemMenu(hWnd: HWND; bRevert: BOOL): HMENU;
external 'GetSystemMenu@user32.dll stdcall';

const
  WM_SYSCOMMAND = $0112;
  
var
  Menu: TMenuItem;

procedure MenuOnClick(Sender: TObject);
begin
  MsgBox('My AppInfo!', mbInformation, MB_OK);
end;

procedure AppOnMessage(var Msg: TMsg; var Handled: Boolean);
begin
  // ��װ�������е���Ϣ��������������¼��д�����
  // ֻҪ����Ϥ Windows ��Ϣ������ô�ʹ�������Դ���װ�����е�һ���¼�������
  if Msg.message = WM_SYSCOMMAND then
    if Msg.wParam = Menu.Handle then
      Menu.Click;
end;

procedure InitializeWizard();
var
  SysMenu: HMENU;
begin
  // ����һ���˵��
  Menu := TMenuItem.Create(WizardForm);
  Menu.OnClick := @MenuOnClick;

  // ����ڰ�װ������������Ҽ����������ϵͳ�˵�����Ӳ˵��
  SysMenu := GetSystemMenu(Wizardform.Handle, False);
  AppendMenu(SysMenu, 0, 0, '');  // ��һ����
  AppendMenu(SysMenu, 0, Menu.Handle, 'About My App'); // ��һ�˵���
  
  // ������������İ�װ����ť���Ҽ����������ϵͳ�˵�����Ӳ˵��
  SysMenu := GetSystemMenu(Application.Handle, False);
  AppendMenu(SysMenu, 0, 0, '');  // ��һ����
  AppendMenu(SysMenu, 0, Menu.Handle, 'About My App'); // ��һ�˵���
  
  // ��װ�������е���Ϣ��������������¼��д�����
  // Ҳ����˵����¼��������������Ѿ�����õĿؼ��¼�������һЩ�����¼�Ҳ���������ﴦ��
  // �����˲�������Ҫ����¼�������
  Application.onMessage := @AppOnMessage;
end;








