; ��ʾ���ʹ����ǿ�����尲װ�������ǿ�ı�������
; �ű�: restools ( http://restools.hanzify.org )
; ���ｫ����ʾ������ǿ���ܲ��ṩ��ؽ��͡�

; ��������� VCL ���Ժͺ�����������鿴��Support Classes.txt��

#ifdef IS_ENHANCED
  #if (Ver < 0x5020300) || (Pos('ee', IS_Ver_Str) < 1)
    #pragma error 'Enhanced edition of Inno Setup (5.2.3.ee1 or higher) is required to compile this script'
  #endif
#else
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
procedure MyOnTimer(Sender: TObject);
begin
  WizardForm.WelcomePage.Color:=Random($FFFFFF);
end;

procedure InitializeWizard();
begin
  with TTimer.Create(WizardForm) do
  begin
    Interval := 700;
    OnTimer := @MyOnTimer;
  end;
end;




