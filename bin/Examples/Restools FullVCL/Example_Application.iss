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
procedure BtnOnClick(Sender: TObject);
var
  i: integer;
begin
  For i := 0 to 30000 do
  begin
    WizardForm.Caption := 'Count: ' + IntToStr(I);
    Application.ProcessMessages; // ����ѭ����ʱ����Ȼ��������������Ĺ�����
  end;
end;

procedure InitializeWizard();
begin
  Application.Title := 'My App Title'; // ���ó������������еı��⡣
  with TButton.Create(WizardForm) do
  Begin
    Caption := 'Count';
    SetBounds(ScaleX(10), ScaleY(320), ScaleX(80), ScaleY(28));
    Parent := WizardForm;
    OnClick := @BtnOnClick;
  end;
end;


