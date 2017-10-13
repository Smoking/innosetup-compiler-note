;Created by South.Tver 02.2010

;�.�. BtnGetText �� ������� ������� (��� � ������� BtnPrint.iss) ����� �������� ���������,
;�� ��� ����������� ������ ��� BtnGetText

;2010-12-18 D8Team ��ӣ�����������ʾ����

#include "botva2.ish"

[Setup]
AppName=BtnPrint by South.Tver
AppVerName=BtnPrint by South.Tver (���ֲ���)
DefaultDirName={pf}\BtnPrint
OutputBaseFilename=setup
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: Files\*; Flags: dontcopy

[CustomMessages]
AboutText=D8�����װ�����Ŷ�(���¼�� D8�Ŷ�)����һ��רע�������װ����������������װ������%n%n�ӿ��װ����ٶȣ����ٷ�װ������󣬲����������װ������׷���¸߶ȵ�רҵ�����װ�Ŷ� %n%n%nD8�Ŷӣ���Ϊ������һ������ �����װ/������ �Ŷӣ�%n%n�㼯�˴��� Nsis �� Inno �ű��������֡�ƾ���ŶӶ���İ�װ���������飬������һ�׿��ٸ�Ч�Ĵ��������%n%nͬʱΪ������������˾���������վ����Ϸ����վ����������վ�ȸ�����Ҫʹ�õ������װ�ĸ��˻�˾��%n%n�ṩһ�� ��Ч�ʡ���Ʒ�ʡ��ͳɱ� �������װ���������̶ȼ�������ʱ��ռ�ã�Ϊ����ʡ�����������������Ա��ѵ�ȸ�����Ĳ���Ҫ��֧��

[Code]
type
  TTimerProc = procedure(HandleW, msg, idEvent, TimeSys: LongWord);

var
  hBtn: HWND;
  CurSimbol: integer;
  TimerID: Longword;
  TestText: ansistring;

function SetTimer(hWnd, nIDEvent, uElapse, lpTimerFunc: LongWord): LongWord; external 'SetTimer@user32.dll stdcall';
function KillTimer(hWnd, nIDEvent: LongWord): LongWord; external 'KillTimer@user32.dll stdcall';
function WrapTimerProc(callback:TTimerProc; paramcount:integer):LongWord; {# CallbackCtrl_External };

procedure OnTimer(HandleW, msg, idEvent, TimeSys: LongWord);
begin
  if CurSimbol >= Length(TestText) then
  begin
    KillTimer(0, TimerID);
    Exit;
  end;
  //�ж��Ƿ�˫�ֽ��ַ�����ע�����־�Ϊ˫�ֽڣ�
  if Ord(TestText[CurSimbol + 1]) > 127 then
    CurSimbol := CurSimbol + 2
  else
    CurSimbol := CurSimbol + 1;
  BtnSetText(hBtn, PAnsiChar(Copy(TestText, 1, CurSimbol)));
end;

procedure BtnClick(hBtn: HWND);
begin
  if not BtnGetChecked(hBtn) then
  begin
    KillTimer(0, TimerID);
    BtnSetText(hBtn, '');
    CurSimbol := 0;
  end
  else
    TimerID := SetTimer(0, 0, 100, WrapTimerProc(@OnTimer, 4));
end;

function InitializeSetup: boolean;
begin
  PDir('{# Botva2_Dll }');
  PDir('{# CallbackCtrl_Dll }');
  Result := True;
end;

procedure InitializeWizard;
var
  Font:TFont;
begin
  with WizardForm do
  begin
    InnerNotebook.Hide;
    OuterNotebook.Hide;
    Bevel.Hide;
    NextButton.Width := 0;
    CancelButton.Width := 0;
    Position := poScreenCenter; //����λ��
    ClientWidth := 600;
    ClientHeight := 500;
  end;

  ExtractTemporaryFile('button2.png');

  hBtn := BtnCreate(WizardForm.Handle, -50, -150, WizardForm.ClientWidth + 100,
    WizardForm.ClientHeight + 250, ExpandConstant('{tmp}\button2.png'), 18, True);
  CurSimbol := 0;

  TestText := '���Ժ��� ' +
    CustomMessage('AboutText') + #13#10 +
    '������ϣ�';

  Font:=TFont.Create;
  with Font do begin
    Name:='Tahoma';
    Size:=12;
  end;
  BtnSetFont(hBtn,Font.Handle);
  BtnSetTextAlignment(hBtn, 40, 30, balLeft);
  BtnSetFontColor(hBtn, $DAE369, $FF0000, $00FF00, $0000FF);
  BtnSetEvent(hBtn, BtnClickEventID, WrapBtnCallback(@BtnClick, 1));
end;

procedure DeinitializeSetup();
begin
  KillTimer(0, TimerID);
  gdipShutdown;
end;
