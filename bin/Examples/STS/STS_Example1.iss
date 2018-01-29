#include "STS.ish"

[Setup]
AppName=MyApp
AppVerName=MyApp
DefaultDirName={pf}\MyApp
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: StatusPanel.png; DestDir: {tmp}; Flags: dontcopy;
Source: StatusPanel2.png; DestDir: {tmp}; Flags: dontcopy;

[code]
procedure InitializeWizard();
var MyFont: TFont;
begin
  if not FileExists(ExpandConstant('{tmp}\botva2.dll')) then ExtractTemporaryFile('botva2.dll');
  ExtractTemporaryFile('StatusPanel.png');
  ExtractTemporaryFile('StatusPanel2.png');

  WizardForm.Width:= 790;
  WizardForm.InnerNotebook.Hide;
  WizardForm.OuterNotebook.Hide;

  MyFont:= TFont.Create   //����� ������� ����� ������������� � ������
  MyFont.Size:=8;
  //                       �������� ����          .                �������� ���. �������   . left. top. width       .height. font. SortPages - ������� ���������� ������� � ������ �� �� ID
  STS_Init(ExpandConstant('{tmp}\StatusPanel.png'), ExpandConstant('{tmp}\StatusPanel.png'), 0, 20, WizardForm.Width, 20, MyFont, True)
  STS_DefaultPages(); //�� ������� ��������� 6 ������� � ������
  //WelcomePage, SelectDirPage, SelectProgramGroupPage, ReadyPage, InstallingPage, FinishedPage,
  //���� ��� �� ����� ��������� �������� � ������, �� ����� ������� ��
  //STS_RemoveStage(CustomMessage('STSGroupEditPage'),wpSelectProgramGroup);
  STS_SetColor(clGray, clWhite) //������������� ���� ��� ������� � ��������� ������� � ������
  STS_CreatePanel();  //������� ������
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  STS_UpdateStages(CurPageID)
end;

procedure DeinitializeSetup();
begin
  gdipShutdown
end;