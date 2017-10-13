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

  MyFont:= TFont.Create   //Шрифт который будет использоватся в панели
  MyFont.Size:=8;
  //                       Картинка фона          .                картинка тек. статуса   . left. top. width       .height. font. SortPages - функция сортировки страниц в панели по их ID
  STS_Init(ExpandConstant('{tmp}\StatusPanel.png'), ExpandConstant('{tmp}\StatusPanel.png'), 0, 20, WizardForm.Width, 20, MyFont, True)
  STS_DefaultPages(); //По дефолту добавляет 6 страниц в панель
  //WelcomePage, SelectDirPage, SelectProgramGroupPage, ReadyPage, InstallingPage, FinishedPage,
  //Если ван не нужны некоторые страницы в панели, то можно удалить их
  //STS_RemoveStage(CustomMessage('STSGroupEditPage'),wpSelectProgramGroup);
  STS_SetColor(clGray, clWhite) //Устанавливает цвет для текущей и остальных страниц в панели
  STS_CreatePanel();  //Создает панель
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  STS_UpdateStages(CurPageID)
end;

procedure DeinitializeSetup();
begin
  gdipShutdown
end;