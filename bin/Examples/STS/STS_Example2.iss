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
ExtractTemporaryFile('botva2.dll')
ExtractTemporaryFile('StatusPanel.png');
ExtractTemporaryFile('StatusPanel2.png');

WizardForm.Width:= 790;
WizardForm.InnerNotebook.Hide;
WizardForm.OuterNotebook.Hide;

MyFont:= TFont.Create
MyFont.Size:=8;
                                                                                                                                // | ��������� ������� ���������� �������
STS_Init(ExpandConstant('{tmp}\StatusPanel.png'), ExpandConstant('{tmp}\StatusPanel.png'), 0, 20, WizardForm.Width, 20, MyFont, False)
//���� �� ��������� ������� ���������� �������, �� ������ ��������� ��������
//������� ����� �������������� � ������, ������ �� ������� �� �����������
//����� ������ ����� ����������� ���������� ������� ������
             //Pagename                       PageID
STS_AddStage(CustomMessage('STSWelcomePage'), wpWelcome);  //��������� ������ � ��������� �������� � ������
STS_AddStage(CustomMessage('STSDirEditPage'), wpSelectDir);
STS_AddStage(CustomMessage('STSReadyPage'), wpReady);
STS_AddStage(CustomMessage('STSInstallingPage'), wpInstalling);
STS_AddStage(CustomMessage('STSFinishedPage'), wpFinished);
STS_SetColor(clGray, clWhite)
STS_CreatePanel();
end;

procedure CurPageChanged(CurPageID: Integer);
begin
STS_UpdateStages(CurPageID)
end;

procedure DeinitializeSetup();
begin
gdipShutdown
end;