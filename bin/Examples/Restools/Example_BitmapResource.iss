; ��ʾ���ʹ��Setup���� BitmapResource.
; �ű�: restools ( http://restools.hanzify.org )

; �ò�����Ҫ����װ������� Bitmap ��Դ, ��������Ҫ����Ϊж�س�����������ͼ����Դ.
; ��Ϊж�س����ǲ���ѹ���ļ���. ���������ж�س���Ҳ��һ���������ļ�, ֻ������Դ��ʽΪж�س����ṩ�����ͼ����Դ.

#ifndef IS_ENHANCED
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
BitmapResource=MyBmp1:2000.bmp|MyBmp2:2001.bmp|MyBmp3:2002.bmp
; BitmapResource ��ʽ:
;  BmpResName1:BmpFileName1|BmpResName2:BmpFileName2|BmpResName3:BmpFileName3|......
; ע��: Bitmap ��Դд�밲װ�����, ���Զ��� Bitmap ��Դ����ǰ�����ǰ׺ "_IS_"
; ������ʹ�� Bitmap.LoadFromResourceName �ȵȺ�����ʱ��Ҳ��Ҫ��ͼ����Դ����ǰ����� "_IS_"
; ����: Bitmap.LoadFromResourceName(HInstance, '_IS_MYBMP1');

; HInstance ����ǿ����Ҳ��ͬʱ�ṩ, �������ð�װ�����������Դ.

; ���µ�������Ȼ���ڰ�װ��������ʾ, ������Ҳͬ��������ж�س���.

[Code]
procedure InitializeWizard();
var
  MyIco1, MyIco2, MyIco3: TBitmapImage;
begin
  with TLabel.Create(WizardForm) do
  begin
    Parent := WizardForm.WelcomePage;
    Caption := 'MyBmp1:';
    SetBounds(ScaleX(176), ScaleY(184), ScaleX(45), ScaleY(13));
  end;
  with TLabel.Create(WizardForm) do
  begin
    Parent := WizardForm.WelcomePage;
    Caption := 'MyBmp2:';
    SetBounds(ScaleX(248), ScaleY(184), ScaleX(45), ScaleY(13));
  end;
  with TLabel.Create(WizardForm) do
  begin
    Parent := WizardForm.WelcomePage;
    Caption := 'MyBmp3:';
    SetBounds(ScaleX(320), ScaleY(184), ScaleX(45), ScaleY(13));
  end;

  MyIco1 := TBitmapImage.Create(WizardForm);
  with MyIco1 do
  begin
    Parent := WizardForm.WelcomePage;
    SetBounds(ScaleX(176), ScaleY(200), 32, 32);
    // HInstance �����ṩ�ķ��ذ�װ����ʵ���ĺ���, ����Ҫ����ϰ�װ�����ж�س������������Դʹ�õ�.
    Bitmap.LoadFromResourceName(HInstance, '_IS_MYBMP1');
  end;
  MyIco2 := TBitmapImage.Create(WizardForm);
  with MyIco2 do
  begin
    Parent := WizardForm.WelcomePage;
    SetBounds(ScaleX(248), ScaleY(200), 32, 32);
    Bitmap.LoadFromResourceName(HInstance, '_IS_MYBMP2');
  end;
  MyIco3 := TBitmapImage.Create(WizardForm);
  with MyIco3 do
  begin
    Parent := WizardForm.WelcomePage;
    SetBounds(ScaleX(320), ScaleY(200), 32, 32);
    Bitmap.LoadFromResourceName(HInstance, '_IS_MYBMP3');
  end;

  WizardForm.WelcomeLabel2.Height := ScaleY(100);
end;





