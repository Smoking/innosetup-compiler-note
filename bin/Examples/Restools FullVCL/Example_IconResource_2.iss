; ��ʾ���ʹ��Setup���� IconResource.
; �ű�: restools ( http://restools.hanzify.org )

; �ò�����Ҫ����װ������� Icon ��Դ, ��������Ҫ����Ϊж�س�����������ͼ����Դ.
; ��Ϊж�س����ǲ���ѹ���ļ���. ���������ж�س���Ҳ��һ���������ļ�, ֻ������Դ��ʽΪж�س����ṩ�����ͼ����Դ.

#ifdef IS_ENHANCED
  #if (Ver < 0x5020300) || (Pos('ee', IS_Ver_Str) < 1)
    #pragma error 'Enhanced edition of Inno Setup (5.2.3.ee1 or higher) is required to compile this script'
  #endif
#else
  #error Enhanced edition of Inno Setup (restools) is required to compile this script
#endif

[Setup]
AppName=My Program
AppVersion=1.5
DefaultDirName={pf}\My Program
DefaultGroupName=My Program
UninstallDisplayIcon={app}\MyProg.exe
SolidCompression=yes
Compression=lzma/ultra
OutputDir=userdocs:Inno Setup Examples Output
IconResource=MyIcon1:"..\Example\2000.ico"|MyIcon2:"..\Example\2001.ico"|MyIcon3:"..\Example\2002.ico"
; IconResource ��ʽ:
;  IcoResName1:IconFileName1|IcoResName2:IconFileName2|IcoResName3:IconFileName3|......
; ע��: Icon ��Դд�밲װ�����, ���Զ���ͼ����Դ����ǰ�����ǰ׺ "_IS_"
; ������ʹ�� LoadIcon �ȵ� API ��ʱ��Ҳ��Ҫ��ͼ����Դ����ǰ����� "_IS_"
; ����: LoadIcon(HInstance, '_IS_MYICON1');

; HInstance ����ǿ����Ҳ��ͬʱ�ṩ, �������ð�װ�����������Դ.

; ���µ�������Ȼ���ڰ�װ��������ʾ, ������Ҳͬ��������ж�س���.

[Code]
procedure InitializeWizard();
var
  MyIco1, MyIco2, MyIco3: TNewIconImage;
begin
  with TLabel.Create(WizardForm) do
  begin
    Parent := WizardForm.WelcomePage;
    Caption := 'MyIcon1:';
    SetBounds(ScaleX(176), ScaleY(184), ScaleX(45), ScaleY(13));
  end;
  with TLabel.Create(WizardForm) do
  begin
    Parent := WizardForm.WelcomePage;
    Caption := 'MyIcon2:';
    SetBounds(ScaleX(248), ScaleY(184), ScaleX(45), ScaleY(13));
  end;
  with TLabel.Create(WizardForm) do
  begin
    Parent := WizardForm.WelcomePage;
    Caption := 'MyIcon3:';
    SetBounds(ScaleX(320), ScaleY(184), ScaleX(45), ScaleY(13));
  end;

  MyIco1 := TNewIconImage.Create(WizardForm);
  with MyIco1 do
  begin
    Parent := WizardForm.WelcomePage;
    SetBounds(ScaleX(176), ScaleY(200), 32, 32);
    // HInstance �����ṩ�ķ��ذ�װ����ʵ���ĺ���, ����Ҫ����ϰ�װ�����ж�س������������Դʹ�õ�.
    Icon.LoadFromResourceName(HInstance, '_IS_MYICON1');
  end;
  MyIco2 := TNewIconImage.Create(WizardForm);
  with MyIco2 do
  begin
    Parent := WizardForm.WelcomePage;
    SetBounds(ScaleX(248), ScaleY(200), 32, 32);
    Icon.LoadFromResourceName(HInstance, '_IS_MYICON2');
  end;
  MyIco3 := TNewIconImage.Create(WizardForm);
  with MyIco3 do
  begin
    Parent := WizardForm.WelcomePage;
    SetBounds(ScaleX(320), ScaleY(200), 32, 32);
    Icon.LoadFromResourceName(HInstance, '_IS_MYICON3');
  end;

  WizardForm.WelcomeLabel2.Height := ScaleY(100);
end;





