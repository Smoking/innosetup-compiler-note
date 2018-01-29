; �ű�: restools ( http://restools.hanzify.org )

; �����ڴ����ͳ���װ�����ļ�, ��������ЩͼƬҪ�ڰ�װ������ʹ��, ���ǲ����ͷŵ���ʱĿ¼��ʹ��,
; �Ϳ���ʹ����������Ž��ڴ���, Ȼ������, ��ô�ļ���ʹ���ڼ�Ͳ����ͷŵ��û���Ӳ����ȥ.

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
Source: "logo.bmp"; Flags: dontcopy

[code]
procedure InitializeWizard();
var
  Logo: TBitmapImage;
  MemStream: TMemoryStream;
begin
  Logo := TBitmapImage.Create(WizardForm);
  Logo.Parent := WizardForm;
  MemStream := TMemoryStream.Create;
  try
    ExtractTemporaryFileToStream('logo.bmp', MemStream);
    MemStream.Position := 0;
    Logo.Bitmap.LoadFromStream(MemStream);
  finally
    MemStream.Free;
  end;
  Logo.SetBounds(30, WizardForm.Bevel.Top+10, Logo.Bitmap.Width, Logo.Bitmap.Height);
end;
