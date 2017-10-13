; -- test.iss --
; restools
; http://restools.hanzify.org
; ʱ��ִ٣����д����뵽�ҵ� BLOG ��ѯ
; CallbackCtrl.dll Ϊһ������ Inno Setup �� 4 KB �Ļص�( Callback )���������
; �� InnoCallback ���������ȫһ������������������ VC ���ֹ��ܣ����Խ���ֻ�� 4 KB ��������ɻص������Ĵ���
; ͬ���Ĺ��ܣ������ں����� Inno Setup ��ǿ����ֱ���ṩ�ص�������֧�֣�
; Ҳ����˵�����κβ���Ϳ����ڽű��д���ص�������
; ������ֻ���ṩ����Щʹ����ͨ�汾 Inno Setup ���û�ʹ�á�

; Inno Setup plugin - CallbackCtrl ( 4 KB )
; Copyright (C) restools 2009-2010
; Version 1.1
; ������ĳЩ Windows ƽ̨(����: Windows XP SP3)���ֲ����������е����⡣

#include "CallbackCtrl.Ish"

[Setup]
AppName=My Application
AppVerName=My Application Ver 1.5
DefaultDirName={pf}\My Application
SolidCompression=yes
Compression=lzma/ultra	
OutputDir=userdocs:Inno Setup Examples Output

[code]
type
 TEnumWinFunc = function(hwnd: HWND; lParam: Longword): Boolean;

var
  ListBox: TListBox;

function EnumWindows(lpEnumFunc: Longword; lParam: Longword): Boolean; external 'EnumWindows@user32.dll stdcall';
// ö�ٵ�ǰ���д��ڣ���Ҫ���ûص�������

function GetWindowText(hWnd: HWND; lpString: String; nMaxCount: Integer): Integer;
external 'GetWindowText{#A}@user32.dll stdcall';

function WrapTimerProc(callback: TEnumWinFunc; ParamCount: Integer): longword; {# CallbackCtrl_External };

function IsWindowVisible(hWnd: HWND): Boolean; external 'IsWindowVisible@user32.dll stdcall';

function EnumWindowsProc(
    hwnd: HWND;	    // handle to parent window
    lParam: Longword  	// application-defined value
    ): Boolean;
var
  s: String;
begin
  Result := True; // ������ֵ��ʾ����ö�٣�Ҳ���Ǽ��������������ֱ�����д��ڱ�ö��һ�顣
  // �����о������б���Ŀ��Ӵ��ڵı��⡣
  if IsWindowVisible(hwnd) then
  begin
    s := StringOfChar(' ', 256);
    GetWindowText(hwnd, s, 256);
    s := Trim(s);
    if s <> '' then
      if ListBox.Items.IndexOf(s) = -1 then
        ListBox.Items.Append(S);
  end;
end;

procedure InitializeWizard();
var
  EnumWincallback: Longword;
begin
  PDir('{# CallbackCtrl_Dll }');

  WizardForm.Caption := 'Visible window title';
  WizardForm.OuterNotebook.Hide;
  ListBox := TListBox.Create(WizardForm);
  ListBox.Parent := WizardForm;
  ListBox.SetBounds(5, 5, WizardForm.ClientWidth - 10, WizardForm.Bevel.Top - 10);
  
  EnumWincallback := WrapTimerProc(@EnumWindowsProc,2);
  EnumWindows(EnumWincallback, 0);
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  WizardForm.NextButton.Hide;
  WizardForm.CancelButton.Caption := 'Close';
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  Result := False;
end;
