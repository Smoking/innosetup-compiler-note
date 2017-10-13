; �ű��� Inno Setup �ű��� ���ɣ�
; �йش��� Inno Setup �ű��ļ�����ϸ��������İ����ĵ���

#include "WaterLib.ish"

[Setup]
; ע: AppId��ֵΪ������ʶ��Ӧ�ó���
; ��ҪΪ������װ����ʹ����ͬ��AppIdֵ��
; (�����µ�GUID����� ����|��IDE������GUID��)
AppId={{CCE7261A-7B8C-4CCA-A4A6-B8048C5BEA9D}
AppName=�ҵĳ���
AppVerName=�ҵĳ��� 1.5
AppPublisher=�ҵĹ�˾
AppPublisherURL=http://www.example.com/
AppSupportURL=http://www.example.com/
AppUpdatesURL=http://www.example.com/
DefaultDirName={pf}\�ҵĳ���
DefaultGroupName=�ҵĳ���
OutputDir=userdocs:Inno Setup Examples Output
OutputBaseFilename=setup
Compression=lzma
SolidCompression=true
WizardImageFile=compiler:WizModernImage-Is.bmp

[Tasks]
Name: desktopicon; Description: {cm:CreateDesktopIcon}; GroupDescription: {cm:AdditionalIcons}; Flags: unchecked

[Files]
Source: compiler:Examples\MyProg.exe; DestDir: {app}; Flags: ignoreversion
;�������ʹ�ñ�����ǿ�汾INNO,��ʹ�ö�ʱ�ص����
#ifndef ISVersion
Source: {#PluginDir}\InnoCallback.dll; DestDir: {tmp}; Flags: dontcopy noencryption
#endif

[Code]
#ifndef ISVersion
type
 TTimerProc=procedure(h:longword; msg:longword; idevent:longword; dwTime:longword);

function WrapTimerProc(callback:TTimerProc; paramcount:integer):longword;
  external 'wrapcallback@files:innocallback.dll stdcall';

function SetTimer(hWnd: longword; nIDEvent, uElapse: longword; lpTimerFunc: longword): longword;
  external 'SetTimer@user32.dll stdcall';
#endif

Const
  DrawTextDemo = '�ı���ˮ���е���ʾ';
  DrawTextMoveDemo = '��̬�ƶ���ʾ';
var
  MoveB_X, MoveT_Y: Integer;
  DT_X, DT_Y: Integer;
  DB_X, DB_Y: Integer;
  DrawBitmapDemo: TBitmap;
  DrawMoveBtn: Array[1..4] Of TButton;

  WaterHandle:Integer;

#ifdef ISVersion
  Timer: TTimer;
#endif

//�ֶ��ƶ�����
Procedure DrawMoveBtnClick(Sender: TObject);
Begin
  Case TButton(Sender).Tag of
    1:
    Begin
      DT_X := DT_X - 1;
      DB_X := DB_X - 1;
    End;
    2:
    Begin
      DT_Y := DT_Y - 1;
      DB_Y := DB_Y - 1;
    End;
    3:
    Begin
      DT_Y := DT_Y + 1;
      DB_Y := DB_Y + 1;
    End;
    4:
    Begin
      DT_X := DT_X + 1;
      DB_X := DB_X + 1;
    End;
  End;
  //�ƶ��ı�
  WaterDrawText(WaterHandle, 0, DT_X, DT_Y, DrawTextDemo);
  //�ƶ�ͼƬ
  WaterDrawBitmap(WaterHandle, 0, DB_X, DB_Y, DrawBitmapDemo.Handle, True, clDefault);
End;

#ifdef ISVersion
procedure Timer_OnTimer(Sender: TObject);
Begin
  MoveT_Y := MoveT_Y + 1;
  If MoveT_Y >= WizardForm.WizardBitmapImage.Height then MoveT_Y := 0;
  WaterDrawText(WaterHandle, 1, 50, MoveT_Y, DrawTextMoveDemo);

  MoveB_X := MoveB_X + 1;
  If MoveB_X >= WizardForm.WizardBitmapImage.Width then MoveB_X := 0 - DrawBitmapDemo.Width;
  WaterDrawBitmap(WaterHandle, 1, MoveB_X, 80, DrawBitmapDemo.Handle, True, clDefault);
End;
#else
procedure MyTimerProc(H: LongWord; MSG: LongWord; idEvent:LongWord; dwTime:LongWord);
begin
  MoveT_Y := MoveT_Y + 1;
  If MoveT_Y >= WizardForm.WizardBitmapImage.Height then MoveT_Y := 0;
  WaterDrawText(WaterHandle, 1, 50, MoveT_Y, DrawTextMoveDemo);

  MoveB_X := MoveB_X + 1;
  If MoveB_X >= WizardForm.WizardBitmapImage.Width then MoveB_X := 0 - DrawBitmapDemo.Width;
  WaterDrawBitmap(WaterHandle, 1, MoveB_X, 80, DrawBitmapDemo.Handle, True, clDefault);
end;
#endif

procedure InitializeWizard();
var
  F: AnsiString;
  #ifndef ISVersion
  TimerCallBack: LongWord;
  #endif
begin
  PDir('WaterLib.dll');
  WaterSupportAuthor(True);
  //֧�ֱ�����Ʒ, ���鿪����ʶ��ʾ.
  //ֻ�п����ù��ܺ�, �ſ���ʹ��WaterDraw****���API�Ĺ���

  F:= ExpandConstant('{tmp}\WizardImage.bmp');
  WizardForm.WizardBitmapImage.Bitmap.SaveToFile(F);
  WaterHandle := WaterInit(WizardForm.WelcomePage.Handle, 2, 2);
  WaterSetBounds(WaterHandle, WizardForm.WizardBitmapImage.Left, WizardForm.WizardBitmapImage.Top, WizardForm.WizardBitmapImage.Width, WizardForm.WizardBitmapImage.Height);
  WaterSetFile(WaterHandle, AnsiString(F));
  WaterSetActive(WaterHandle, True);
  DeleteFile(F);

  //������̬��ʾ�ı���λͼ�Ķ�ʱ��
  #ifdef ISVersion
  Timer := TTimer.Create(WizardForm);
  Timer.OnTimer := @Timer_OnTimer;
  Timer.Interval := 100;
  Timer.Enabled := True;
  #else
  TimerCallBack := WrapTimerProc(@MyTimerProc, 4);
  SetTimer(0, 0, 100, TimerCallBack);
  #endif

  //�����ֶ������ƶ���ť
  DrawMoveBtn[1] := TButton.Create(WizardForm);
  With DrawMoveBtn[1] Do
  Begin
    Tag := 1;
    Caption := '����';
    Parent := WizardForm;
    Width := 30;
    Left := WizardForm.WizardBitmapImage.Width + 10;
    Top := WizardForm.WizardBitmapImage.Height div 2;
    OnClick := @DrawMoveBtnClick;
  End;

  DrawMoveBtn[2] := TButton.Create(WizardForm);
  With DrawMoveBtn[2] Do
  Begin
    Tag := 2;
    Caption := '����';
    Parent := WizardForm;
    Width := 30;
    Left := WizardForm.WizardBitmapImage.Width + 40;
    Top := WizardForm.WizardBitmapImage.Height div 2 - 25;
    OnClick := @DrawMoveBtnClick;
  End;

  DrawMoveBtn[3] := TButton.Create(WizardForm);
  With DrawMoveBtn[3] Do
  Begin
    Tag := 3;
    Caption := '����';
    Parent := WizardForm;
    Width := 30;
    Left := WizardForm.WizardBitmapImage.Width + 40;
    Top := WizardForm.WizardBitmapImage.Height div 2 + 25;
    OnClick := @DrawMoveBtnClick;
  End;

  DrawMoveBtn[4] := TButton.Create(WizardForm);
  With DrawMoveBtn[4] Do
  Begin
    Tag :=4;
    Caption := '����';
    Parent := WizardForm;
    Width := 30;
    Left := WizardForm.WizardBitmapImage.Width + 70;
    Top := WizardForm.WizardBitmapImage.Height div 2;
    OnClick := @DrawMoveBtnClick;
  End;

  //��̬��ʾ���ı�
  DT_X := 20;
  DT_Y := 50;
  WaterDrawTextBrush(WaterHandle, 0, clBlack, bsClear);
  WaterDrawTextFont(WaterHandle, 0, '����', 9, clRed, 134);
  WaterDrawText(WaterHandle, 0, DT_X, DT_Y, DrawTextDemo);

  //��̬��ʾ��λͼ
  DB_X := 50;
  DB_Y := 160;
  DrawBitmapDemo:= TBitmap.Create;
  DrawBitmapDemo.LoadFromFile(ExpandConstant('{commonappdata}\Microsoft\User Account Pictures\guest.bmp'));
  WaterDrawBitmap(WaterHandle, 0, DB_X, DB_Y, DrawBitmapDemo.Handle, True, clDefault);

  //�����ƶ����ı�
  MoveT_Y := 0;
  WaterDrawTextBrush(WaterHandle, 1, clBlack, bsClear);
  WaterDrawTextFont(WaterHandle, 1, '����', 12, clYellow, 134);
  WaterDrawText(WaterHandle, 1, 50, MoveT_Y, DrawTextMoveDemo);

  //�����ƶ���λͼ
  MoveB_X := 0;
  WaterDrawBitmap(WaterHandle, 1, MoveB_X, 80, DrawBitmapDemo.Handle, True, clDefault);
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  Case CurPageID of
    wpWelcome : WaterSetParentWindow(WaterHandle, WizardForm.WelcomePage.Handle);  //��ˮ���ƶ�����һ�������
    wpFinished: WaterSetParentWindow(WaterHandle, WizardForm.FinishedPage.Handle); //��ˮ���ƶ�����һ�������
  end;
end;

//�ͷ�����ˮ������
procedure DeinitializeSetup();
begin
  WaterAllFree;
end;
