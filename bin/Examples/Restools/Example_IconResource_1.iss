; ��ʾ���ʹ��Setup���� IconResource.
; �ű�: restools ( http://restools.hanzify.org )

; �ò�����Ҫ����װ������� Icon ��Դ, ��������Ҫ����Ϊж�س�����������ͼ����Դ.
; ��Ϊж�س����ǲ���ѹ���ļ���. ���������ж�س���Ҳ��һ���������ļ�, ֻ������Դ��ʽΪж�س����ṩ�����ͼ����Դ.

#ifndef IS_ENHANCED
  #error Enhanced edition of Inno Setup (restools) is required to compile this script
#endif

#ifdef UNICODE
  #define A "W"
#else
  #define A "A"
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
IconResource=MyIcon1:2000.ico|MyIcon2:2001.ico|MyIcon3:2002.ico
; IconResource ��ʽ:
;  IcoResName1:IconFileName1|IcoResName2:IconFileName2|IcoResName3:IconFileName3|......
; ע��: Icon ��Դд�밲װ�����, ���Զ���ͼ����Դ����ǰ�����ǰ׺ "_IS_"
; ������ʹ�� LoadIcon �ȵ� API ��ʱ��Ҳ��Ҫ��ͼ����Դ����ǰ����� "_IS_"
; ����: LoadIcon(HInstance, '_IS_MYICON1');

; HInstance ����ǿ����Ҳ��ͬʱ�ṩ, �������ð�װ�����������Դ.

; ���µ�������Ȼ���ڰ�װ��������ʾ, ������Ҳͬ��������ж�س���.

[Code]
function LoadImage(hInst: UINT; ImageName: String; ImageType: UINT; X, Y: Integer; Flags: UINT): THandle;
external 'LoadImage{#A}@user32.dll stdcall';
function DrawIconEx(hdc: LongInt; xLeft, yTop: Integer; hIcon: LongInt; cxWidth, cyWidth: Integer; istepIfAniCur: LongInt; hbrFlickerFreeDraw, diFlags: LongInt): LongInt;
external 'DrawIconEx@user32.dll stdcall';
function DestroyIcon(hIcon: LongInt): LongInt;
external 'DestroyIcon@user32.dll stdcall';

const
  IMAGE_ICON = 1;
  DI_NORMAL = 3;

procedure InitializeWizard();
var
  MyBmp1, MyBmp2, MyBmp3: TBitmapImage;
  hIcon: LongInt;
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

  MyBmp1 := TBitmapImage.Create(WizardForm);
  with MyBmp1 do
  begin
    Parent := WizardForm.WelcomePage;
    SetBounds(ScaleX(176), ScaleY(200), 32, 32);
    // HInstance �����ṩ�ķ��ذ�װ����ʵ���ĺ���, ����Ҫ����ϰ�װ�����ж�س������������Դʹ�õ�.
    hIcon := LoadImage(HInstance, '_IS_MYICON1', IMAGE_ICON, 32, 32, 0);
    try
      Bitmap.Width := 32;
      Bitmap.Height := 32;
      DrawIconEx(Bitmap.Canvas.Handle, 0, 0, hIcon, 32, 32, 0, 0, DI_NORMAL);
    finally
      DestroyIcon(hIcon);
    end;
  end;
  MyBmp2 := TBitmapImage.Create(WizardForm);
  with MyBmp2 do
  begin
    Parent := WizardForm.WelcomePage;
    SetBounds(ScaleX(248), ScaleY(200), 32, 32);
    hIcon := LoadImage(HInstance, '_IS_MYICON2', IMAGE_ICON, 32, 32, 0);
    try
      Bitmap.Width := 32;
      Bitmap.Height := 32;
      DrawIconEx(Bitmap.Canvas.Handle, 0, 0, hIcon, 32, 32, 0, 0, DI_NORMAL);
    finally
      DestroyIcon(hIcon);
    end;
  end;
  MyBmp3 := TBitmapImage.Create(WizardForm);
  with MyBmp3 do
  begin
    Parent := WizardForm.WelcomePage;
    SetBounds(ScaleX(320), ScaleY(200), 32, 32);
    hIcon := LoadImage(HInstance, '_IS_MYICON3', IMAGE_ICON, 32, 32, 0);
    try
      Bitmap.Width := 32;
      Bitmap.Height := 32;
      DrawIconEx(Bitmap.Canvas.Handle, 0, 0, hIcon, 32, 32, 0, 0, DI_NORMAL);
    finally
      DestroyIcon(hIcon);
    end;
  end;

  WizardForm.WelcomeLabel2.Height := ScaleY(100);
end;





