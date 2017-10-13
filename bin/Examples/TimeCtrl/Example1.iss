; -- Example1.iss --
; restools
; http://restools.yeah.net
; �˲��ͬ������ʹ���� NSIS �İ�װ�����С�
; ��ֻ��������ʾһ��û��ʲô��ʵ�ֲ��˵ģ�ֻ��ֵ��ֵ�õ����⣬Ϊ����ôһ��С���ܶ�ȥ��һ������鷳�Ĳ�����Ҿ���̫���˷�ʱ���ˡ�
; ��ʵֻҪ�� Windows �У��Ϳ�������κεĶ�����ֻ���������������������������װ���򣬻���������ҡ������һ����ҵĲ�����������װ���򻹸��ӣ����������Լ���д��װ��������ɶȻ����ô�
; ʱ��ִ٣����Ա�̿��ܻ��е��������д���������

[Setup]
AppName=�ҵĳ���
AppVerName=�ҵĳ��� �汾 1.5
DefaultDirName={pf}\�ҵĳ���
DefaultGroupName=�ҵĳ���
UninstallDisplayIcon={app}\MyProg.exe
LicenseFile=license.txt
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: "compiler:\Examples\MyProg.exe"; DestDir: "{app}"
Source: "compiler:\Examples\Readme.txt"; DestDir: "{app}"; Flags: isreadme
Source: "{#PluginDir}\timectrl.dll"; Flags: dontcopy

[Icons]
Name: "{group}\�ҵĳ���"; Filename: "{app}\MyProg.exe"

[code]
function starttimer(WizardFormHandle: HWND; ButtonHandle: HWND; ButtonCaption: PAnsiChar; RTime: UINT): BOOL; external 'starttimer@files:timectrl.dll stdcall';
//WizardFormHandle �򵼴��ھ��
//ButtonHandle ��һ����ť���
//ButtonCaption ����������Ϻ�Ҫ�ڰ�ť����ʾ������
//RTime ʣ��ʱ��
function stoptimer(): BOOL; external 'stoptimer@files:timectrl.dll stdcall';

function IsWindowEnabled(hWnd: HWND): BOOL; external 'IsWindowEnabled@user32.dll stdcall';


procedure InitializeWizard();
begin
  WizardForm.LICENSEACCEPTEDRADIO.Hide;
  WizardForm.LICENSENOTACCEPTEDRADIO.Hide;
  WizardForm.LICENSEACCEPTEDRADIO.Checked := True;
  WizardForm.LICENSEMEMO.Height := 170;
  with TLabel.Create(WizardForm) do
  begin
    Parent := WizardForm.LicensePage;
    Top := WizardForm.LicenseMemo.Top + WizardForm.LicenseMemo.Height + ScaleY(10);
    Left := 2;
    Caption := '�����������ͬ�⡱������һҳ�棬����ʾ��ͬ������Э�顣';
  end;
end;

procedure DeinitializeSetup();
begin
  stoptimer();
end;

procedure CurPageChanged(CurPageID: Integer);
begin
//һ��Ҫ�����ȿ�Э��20�룬��ʹ���ػ�ӭҳ�棬����������ֹͣ���ٽ���Э��������������
  if CurPageID = wpLicense then
      starttimer(WizardForm.Handle,WizardForm.NEXTBUTTON.Handle,'��ͬ��(&I)',20)
  else
  if (CurPageID = wpWelcome) or (CurPageID = wpSelectDir) then
  begin
    stoptimer();
    WizardForm.NEXTBUTTON.Caption := '��һ��(&N) >';
  end;
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  case CurPageID of
    wpLicense: Result := IsWindowEnabled(WizardForm.NextButton.Handle)
    else
      Result := True;
  end
end;