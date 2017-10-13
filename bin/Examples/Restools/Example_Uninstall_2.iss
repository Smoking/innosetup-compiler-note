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

#define MyAppId "{{68A4E708-F2BC-4C45-B34D-7BB9AEB6AE93}"

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

[Dirs]
Name: "{pf}\InnoSetup Installation Information"; Attribs: hidden

[Files]
Source: "MyProg.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "MyProg1.chm"; DestDir: "{app}"; DestName: "MyProg.chm"; Flags: ignoreversion
Source: "Readme1.txt"; DestDir: "{app}"; DestName: "Readme.txt"; Flags: ignoreversion
Source: "{win}\help\*"; DestDir: "{app}\help"; Flags: external recursesubdirs ignoreversion
Source: "{srcexe}"; DestDir: "{pf}\InnoSetup Installation Information\{#MyAppId}"; DestName: "MySetup.exe"; Flags: external ignoreversion

[Icons]
Name: "{group}\My Program"; Filename: "{app}\MyProg.exe"
Name: "{group}\My Program Documentation"; Filename: "{app}\MyProg.chm";
Name: "{group}\My Program Readme"; Filename: "{app}\Readme.txt";
Name: "{group}\Modify or Remove My Program"; Filename: "{pf}\InnoSetup Installation Information\{#MyAppId}\MySetup.exe";

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
var
  File, Dir: String;
begin
  if CurPageID = UninstallPage.ID then
  begin
    WizardForm.BackButton.Visible := False;
    WizardForm.NextButton.Visible := False;
    WizardForm.CancelButton.Enabled := False;
    
    if PerformPreviousUninstall(UninstallProgressBar) then
    begin
      Dir := ExpandConstant('{pf}\InnoSetup Installation Information\{#MyAppId}');
      File := Dir+'\MySetup.exe';
      if FileExists(File) and (not DeleteFile(File)) then
        RestartReplace(File, '');
      if DirExists(Dir) and (not RemoveDir(Dir)) then
        RestartReplace(Dir, '');
    end;
    
    WizardForm.CancelButton.Caption := 'Finish';
    WizardForm.CancelButton.Enabled := True;
    UninstallProgressBar.Visible := False;
    WizardForm.PageDescriptionLabel.Caption := 'Finish';
    Uninstalled := True;
  end else
  if CurPageID = wpFinished then
  begin
    RenameFile(OrgUninstallData, NewUninstallData);
  end;
end;

procedure CancelButtonClick(CurPageID: Integer; var Cancel, Confirm: Boolean);
begin
  Confirm := not Uninstalled;
end;
                          
procedure RegisterPreviousData(PreviousDataKey: Integer);
var
  OrgUninstallExe: String;
  PathKeyName: String;
begin
  OrgUninstallExe := RemoveQuotes(GetSetupPreviousData('UninstallString', ''));
  DeleteFile(OrgUninstallExe);

  SetSetupPreviousData(PreviousDataKey, 'UninstallString', AddQuotes(ExpandConstant('{pf}\InnoSetup Installation Information\{#MyAppId}\MySetup.exe')));
  SetSetupPreviousData(PreviousDataKey, 'QuietUninstallString', AddQuotes(ExpandConstant('{pf}\InnoSetup Installation Information\{#MyAppId}\MySetup.exe'))+' /SILENT');
  SetSetupPreviousData(PreviousDataKey, 'DisplayIcon', ExpandConstant('{pf}\InnoSetup Installation Information\{#MyAppId}\MySetup.exe'));

  OrgUninstallData := GetSetupPreviousData('UninstallDataFile', '');
  NewUninstallData := ExpandConstant('{pf}\InnoSetup Installation Information\{#MyAppId}\')+ExtractFileName(OrgUninstallData);
  // �����ֵ�Ķ����ǳ���Ҫ, ��Ϊ PerformPreviousUninstall �������Զ����ü�ֵ����ж��.
  SetSetupPreviousData(PreviousDataKey, 'UninstallDataFile', NewUninstallData);

  PathKeyName := ExpandConstant('Software\Microsoft\Windows\CurrentVersion\Uninstall\{#MyAppId}_is1');
  RegWriteDWordValue(HKLM, PathKeyName, 'NoModify', 0);
  RegWriteDWordValue(HKLM, PathKeyName, 'NoRepair', 0);
end;

