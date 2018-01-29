;Пример использования PNG-изображения.

[Setup]
AppName=Test
AppVerName=Test
DefaultDirName={pf}\Test
OutputDir=.

[Languages]
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"

[Files]
Source: "Spalsh.png"; DestDir: {tmp}; Flags: ignoreversion dontcopy nocompression
Source: "isgsg.dll"; DestDir: {tmp}; Flags: ignoreversion dontcopy nocompression

[Code]
procedure ShowSplashScreen(p1:HWND;p2:string;p3,p4,p5,p6,p7:integer;p8:boolean;p9:Cardinal;p10:integer); external 'ShowSplashScreen@files:isgsg.dll stdcall delayload';

procedure InitializeWizard;
begin
  ExtractTemporaryFile('Spalsh.png');
  ShowSplashScreen(WizardForm.Handle,ExpandConstant('{tmp}')+'\Spalsh.png',1000,3000,1000,0,255,False,$FFFFFF,10);
end;
