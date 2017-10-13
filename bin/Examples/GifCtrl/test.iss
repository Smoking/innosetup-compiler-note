; -- test.iss --
; restools
; http://restools.hanzify.org
; gifctrl.dll Ϊһ������ Inno Setup �� 13 KB �� gif ��ʾ�����ͬ��������ʾ BMP �� JPEG��

; V2 ��ǿ����������ͬʱ��ʾ 16 �� GIF ͼƬ��

#include "GifCtrl.ish"

[Setup]
AppName=�ҵĳ���
AppVerName=�ҵĳ��� �汾 1.5
DefaultDirName={pf}\�ҵĳ���
DefaultGroupName=�ҵĳ���
UninstallDisplayIcon={app}\MyProg.exe
Compression=lzma
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: "compiler:\Examples\MyProg.exe"; DestDir: "{app}"
Source: "compiler:\Examples\Readme.txt"; DestDir: "{app}"; Flags: isreadme
Source: nsisinstall.gif; Flags: dontcopy
Source: 0023.gif; Flags: dontcopy

[Icons]
Name: "{group}\�ҵĳ���"; Filename: "{app}\MyProg.exe"

[code]
var
  GifPanel: TPanel;
  GIFHWND1, GIFHWND2: HWND;

function InitializeSetup(): Boolean;
begin
  PDir('GifCtrl.dll');

  GIFHWND1 := 0;
  GIFHWND2 := 0;
  Result := True;
end;

procedure DeinitializeSetup();
begin
  FreeAllGifWnd();
end;

procedure LblOnClick(Sender: TObject);
var
  ErrorCode: Integer;
begin
  ShellExec('open', 'http://restools.hanzify.org', '', '', SW_SHOWNORMAL, ewNoWait, ErrorCode);
end;

procedure InitializeWizard();
var
  GifFileName: String;
  Lbl: TNewStaticText;
begin
  ExtractTemporaryFile('nsisinstall.gif');
  ExtractTemporaryFile('0023.gif');

  GIFHWND1 := NewGifbWnd(WizardForm.InstallingPage.Handle, 0, WizardForm.PROGRESSGAUGE.Top + WizardForm.PROGRESSGAUGE.Height + SCaleY(5),
       WizardForm.InstallingPage.Width, WizardForm.InstallingPage.Height - (WizardForm.PROGRESSGAUGE.Top
       + WizardForm.PROGRESSGAUGE.Height + SCaleY(5)));
  GifWndLoadFromFile(GIFHWND1, HALIGN_CENTER, VALIGN_BOTTOM, CLR_INVALID, FIT_WIDTH, ExpandConstant('{tmp}\nsisinstall.gif'));

  // ����һ����վ Logo ����
  GIFHWND2 := NewGifbWnd(WizardForm.Handle, ScaleX(30), WizardForm.Bevel.Top + ScaleY(8), 88, 31);
  GifWndLoadFromFile(GIFHWND2, HALIGN_CENTER, VALIGN_CENTER, CLR_INVALID, FIT_NONE, ExpandConstant('{tmp}\0023.gif'));
  Lbl := TNewStaticText.Create(WizardForm);
  Lbl.Parent := WizardForm;
  Lbl.AutoSize := False;
  Lbl.SetBounds(ScaleX(30), WizardForm.Bevel.Top + ScaleY(8), 88, 31);
  Lbl.OnClick := @LblOnClick;
  Lbl.Cursor := crHand;
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  if CurPageID = wpInstalling then
  begin
    MsgBox('��ͣһ�£�����Ч����', mbInformation, MB_OK);
  end;
end;



