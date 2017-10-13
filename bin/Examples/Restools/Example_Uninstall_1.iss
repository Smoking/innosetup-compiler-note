; �ű�: restools ( http://restools.hanzify.org )

; PerformPreviousUninstall
; һֱ����, �ܶ��˶�ϣ�����Զ���ж�ش��ڵĽ���, ����һ��ж�س�������������Զ��岿��,
; ������ָ�����Ҫ�Զ��������, ����ж�غ����̽��밲װ, �޸� �ȵȵĹ����Զ���.
; �����ڹٷ��汾�޷���������������, ��������˼��, ����ֻ���ڰ�װ���򲿷�ʵ��ж�ع��ܲ�����ʵ��.
; �ɴ˽����� PerformPreviousUninstall ����, ֻҪ�ܺú������������, һ����װ�����ܹ�ʵ��ж�ز��ֵĹ���.
; �Ӷ�ʵ����ʵ�������ϵ��Զ���ж�س���.

#ifndef IS_ENHANCED
  #error Enhanced edition of Inno Setup (restools) is required to compile this script
#endif

#define MyAppId "{{C6B1C937-16B6-4221-8E4D-C763F7EE78A1}"

[Setup]
AppId={#MyAppId}
AppName=My Application
AppVersion=1.5
DefaultDirName={pf}\My Application
DefaultGroupName=My Application
UninstallDisplayIcon={app}\MyProg.exe
SolidCompression=yes
Compression=lzma/ultra
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: "MyProg.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "MyProg1.chm"; DestDir: "{app}"; DestName: "MyProg.chm"; Flags: ignoreversion
Source: "Readme1.txt"; DestDir: "{app}"; DestName: "Readme.txt"; Flags: ignoreversion
Source: "{win}\help\*"; DestDir: "{app}\help"; Flags: external recursesubdirs ignoreversion

[Icons]
Name: "{group}\My Program"; Filename: "{app}\MyProg.exe"
Name: "{group}\My Program Documentation"; Filename: "{app}\MyProg.chm";
Name: "{group}\My Program Readme"; Filename: "{app}\Readme.txt";
Name: "{group}\Modify or Remove My Program"; Filename: "{uninstallexe}";

[code]
var
  CanModifyRemove, Uninstalled: Boolean;
  OrgUninstallData, NewUninstallData: String;
  SetupOptions, UninstallPage: TWizardPage;
  UninstallProgressBar: TNewProgressBar;
  ModifyChk, RemoveChk: TNewRadioButton;

procedure InitializeWizard();
begin
  SetupOptions := CreateCustomPage(wpWelcome, 'Uninstall My Application Program Maintenance', 'Modify or remove the program.');
  UninstallPage := CreateCustomPage(SetupOptions.ID, 'Uninstall Status', 'Uninstalling......');

  UninstallProgressBar := TNewProgressBar.Create(WizardForm);
  with UninstallProgressBar do
  begin
    Parent := UninstallPage.Surface;
    SetBounds(0, ScaleY(42), UninstallPage.SurfaceWidth, ScaleY(21));
  end;

  ModifyChk := TNewRadioButton.Create(WizardForm);
  with ModifyChk do
  begin
    Parent := SetupOptions.Surface;
    SetBounds(ScaleX(32), ScaleY(64), ScaleX(113), ScaleY(17));
    Caption := 'Modify';
    Checked := True;
  end;

  RemoveChk := TNewRadioButton.Create(WizardForm);
  with RemoveChk do
  begin
    Parent := SetupOptions.Surface;
    SetBounds(ScaleX(32), ScaleY(104), ScaleX(113), ScaleY(17));
    Caption := 'Remove';
  end;

  CanModifyRemove := False;
  Uninstalled := False;
end;


function ShouldSkipPage(PageID: Integer): Boolean;
var
  UninstallDataFile: String;
begin
  if PageID = wpWelcome then
  begin
    if Uninstalled then
      Result := False
    else begin
      UninstallDataFile := RemoveQuotes(GetSetupPreviousData('UninstallDataFile', ''));
      CanModifyRemove := UninstallDataFile<>'';
      Result := CanModifyRemove;
    end;
  end else
  if PageID = SetupOptions.ID then
  begin
    Result := Uninstalled or (not CanModifyRemove);
  end else
  if PageID = UninstallPage.ID then
  begin
    Result := Uninstalled or (not RemoveChk.Checked);
  end;
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  if CurPageID = UninstallPage.ID then
  begin
    WizardForm.BackButton.Visible := False;
    WizardForm.NextButton.Visible := False;
    WizardForm.CancelButton.Enabled := False;
    
    PerformPreviousUninstall(UninstallProgressBar);

    WizardForm.CancelButton.Caption := 'Finish';
    WizardForm.CancelButton.Enabled := True;
    UninstallProgressBar.Visible := False;
    WizardForm.PageDescriptionLabel.Caption := 'Finish';
    Uninstalled := True;
  end;
end;

procedure CancelButtonClick(CurPageID: Integer; var Cancel, Confirm: Boolean);
begin
  Confirm := not Uninstalled;
end;
                          
procedure RegisterPreviousData(PreviousDataKey: Integer);
var
  PathKeyName: String;
begin
  PathKeyName := ExpandConstant('Software\Microsoft\Windows\CurrentVersion\Uninstall\{#MyAppId}_is1');
  RegWriteDWordValue(HKLM, PathKeyName, 'NoModify', 0);
  RegWriteDWordValue(HKLM, PathKeyName, 'NoRepair', 0);
end;

function InitializeUninstall(): Boolean;
begin
  MsgBox('Please run SETUP to modify/uninstall the program.', mbInformation, MB_OK);
  Result := False;
end;

