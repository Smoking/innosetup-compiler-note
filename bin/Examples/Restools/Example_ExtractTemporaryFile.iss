; �ű�: restools ( http://restools.hanzify.org )

; ֧��ͬ���ļ�ʹ������ͳ�ʵ���ϲ�ͬ���ļ�.
; ���ַ�ʽ���ͳ��ļ�ͬ��֧�����º���:
;     ExtractTemporaryFileEx
;     ExtractTemporaryFileToStream
;     ExtractTemporaryFileToBuffer

#ifndef IS_ENHANCED
  #error Enhanced edition of Inno Setup (restools) is required to compile this script
#endif

[Setup]
AppName=My Application
AppVersion=1.5
DefaultDirName={pf}\My Application
DefaultGroupName=My Application
UninstallDisplayIcon={app}\MyProg.exe
SolidCompression=yes
Compression=lzma/ultra
OutputDir=userdocs:Inno Setup Examples Output

[Files]
; �ļ���� 0 , ��  (logo.bmp:0)  ����ȡ
Source: "logo.bmp"; Flags: dontcopy
; �ļ���� 1 , ��  (logo.bmp:1)  ����ȡ
Source: "otherlogo.bmp"; DestName: "logo.bmp"; Flags: dontcopy
; �ļ���� 2 , ��  (logo.bmp:2)  ����ȡ
;Source: "xxxx.bmp"; DestName: "logo.bmp"; Flags: dontcopy
; �ļ���� 3 , ��  (logo.bmp:3)  ����ȡ
;Source: "C:\mylogo\logo.bmp"; Flags: dontcopy

[code]
procedure InitializeWizard();
var
  Logo: TBitmapImage;
begin
  ExtractTemporaryFile('logo.bmp:1'); // ʵ�����൱��  otherlogo.bmp
  // ��Ϊ��������ͬ��Ŀ������, ������Ҫʹ�����������ͬ���ļ�
  // �� [Files] ���ļ���˳�����������, �� 0 ��ʼ����.
  // logo.bmp:0  = (Source: "logo.bmp"; Flags: dontcopy)
  // logo.bmp:1  = (Source: "otherlogo.bmp"; DestName: "logo.bmp"; Flags: dontcopy)
  Logo := TBitmapImage.Create(WizardForm);
  Logo.Parent := WizardForm;
  Logo.Bitmap.LoadFromFile(ExpandConstant('{tmp}\logo.bmp'));
  Logo.SetBounds(30, WizardForm.Bevel.Top+10, Logo.Bitmap.Width, Logo.Bitmap.Height);
end;
