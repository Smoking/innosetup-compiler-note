; ��ʾ���ʹ����ǿ�����尲װ�������ǿ�ı�������
; �ű�: restools ( http://restools.hanzify.org )
; ���ｫ����ʾ������ǿ���ܲ��ṩ��ؽ��͡�

; ��������� VCL ���Ժͺ�����������鿴��Support Classes.txt��

#ifndef IS_ENHANCED
  #error Enhanced edition of Inno Setup (restools) is required to compile this script
#endif

[Setup]
AppName=My Application
AppVersion=1.5
DefaultDirName={pf}\My Application
SolidCompression=yes
Compression=lzma/ultra	
PrivilegesRequired=none
OutputDir=userdocs:Inno Setup Examples Output

[code]

function SetTimer(hWnd: longword; nIDEvent, uElapse: longword; lpTimerFunc: longword): longword;
     external 'SetTimer@user32.dll stdcall';
// WinAPI ����, ʱ��ѭ������, ���������Ҫ�ص�����, ������ʵ�ֹ���

procedure MyTimerProc(h:Longword; msg: Longword; idevent: Longword; dwTime: Longword);
begin
  WizardForm.WelcomePage.Color:=random($FFFFFF);
end;

procedure MyTimerProc2(h:Longword; msg: Longword; idevent: Longword; dwTime: Longword);
begin
  WizardForm.WelcomeLabel1.Font.Color:=random($FFFFFF);
  WizardForm.WelcomeLabel2.Font.Color:=random($FFFFFF);
  WizardForm.Color:=random($FFFFFF);
end;

procedure InitializeWizard();
begin
  SetTimer(0, 101, 1000, CallbackAddr('MyTimerProc'));
  SetTimer(0, 102, 700, CallbackAddr('MyTimerProc2'));
  // CallbackAddr �������ָ���ĺ���������ܹ��� WinAPI ���õĻص�����������ʹ���൱���㡣
end;

