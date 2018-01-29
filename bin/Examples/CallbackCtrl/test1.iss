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
 TTimerProc=procedure(h:longword; msg:longword; idevent:longword; dwTime:longword);

function WrapTimerProc(callback:TTimerProc; paramcount:integer):longword; {# CallbackCtrl_External };

function SetTimer(hWnd: longword; nIDEvent, uElapse: longword; lpTimerFunc: longword): longword;
  external 'SetTimer@user32.dll stdcall';

procedure mytimerproc1(h:longword; msg:longword; idevent:longword; dwTime:longword);
begin
  WizardForm.WelcomePage.Color:=random($FFFFFF);
  WizardForm.WelcomeLabel2.Font.Color:=random($FFFFFF);
end;

procedure mytimerproc2(h:longword; msg:longword; idevent:longword; dwTime:longword);
begin
  WizardForm.WelcomeLabel1.Font.Color:=random($FFFFFF);
  WizardForm.Color:=random($FFFFFF);
end;

procedure InitializeWizard();
var
  timercallback: Longword;
begin
  PDir('{# CallbackCtrl_Dll }');

  timercallback := WrapTimerProc(@mytimerproc1,4);
  settimer(0,0,1000,timercallback); 
  
  timercallback := WrapTimerProc(@mytimerproc2,4);
  settimer(0,0,700,timercallback);
end;

