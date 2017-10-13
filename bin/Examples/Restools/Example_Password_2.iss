; -- Example_Password.iss --
; ��ʾ��η�ֹ ͨ�ý������Update: 2008-12-07
; �ű�: restools ( http://restools.hanzify.org )

; ������޸İ汾�ڱ���ű��������е�ʱ����������������.

;build 081207
;1. �޸� GetPassword ���塣
;     function GetPassword(PrePassword: String): String;
;2. ���� 1 ���������ú��� SetPassword������ʹ�÷������Բο����ӡ�
;     procedure SetPassword(const Password: String);

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
Password=123456abcdef
UsePreviousTasks=yes
Encryption=true
OutputDir=userdocs:Inno Setup Examples Output

[Types]
Name: "full"; Description: "full"
Name: "compact"; Description: "compact"
Name: "custom"; Description: "custom"; Flags: iscustom

[Components]
Name: "program"; Description: "app files"; Types: full compact custom; Flags: fixed
Name: "help"; Description: "help files"; Types: full
Name: "readme"; Description: "readme files"; Types: full

[Files]
Source: "MyProg.exe"; DestDir: "{app}"; Components: program
Source: "MyProg1.chm"; DestDir: "{app}"; Components: help
Source: "Readme1.txt"; DestDir: "{app}"; Components: readme; Flags: isreadme
Source: "logo.bmp"; Flags: dontcopy

[Icons]
Name: "{group}\my application"; Filename: "{app}\MyProg.exe"

[code]
function TmpPassword: String;
begin
// �����ʱ�������ṩ�������û��Լ�����ģ��������ֿ������������Ĵ������д��
// ���ǲ���д�� Result := '123456abcdef'; ������������Գ����ַ������֡�
// �������ֻ�������ṩ����װ������ʱ�ͷ��ļ��ã����ޱ�Ҫ���벻Ҫʹ�����ַ�ʽ��
// ���ʹ�����ַ�ʽ�������û��ļ������Լ��ܣ�����Ԥ�ͷ��ļ������Բ��� noencryption ��ǡ�
  Result := chr(ord('2')-1);
  Result := Result + chr(ord('3')-1);
  Result := Result + chr(ord('4')-1);
  Result := Result + chr(ord('5')-1);
  Result := Result + chr(ord('6')-1);
  Result := Result + chr(ord('7')-1);
  Result := Result + chr(ord('b')-1);
  Result := Result + chr(ord('c')-1);
  Result := Result + chr(ord('d')-1);
  Result := Result + chr(ord('e')-1);
  Result := Result + chr(ord('f')-1);
  Result := Result + chr(ord('g')-1);
end;

function CheckPassword(Password: String): Boolean;
begin
// ���������Ƿ���ȷ��Ҫ�ر� password ҳ�档
// ��Ϊ���ǲ���Ҫ���ҳ�����ṩ��ȷ���롣
  Result := True;
end;

procedure InitializeWizard();
var
  Logo: TBitmapImage;
begin
// ���´�����ʵ��ȡ����ʱ����������������ʹ���ͷ��ļ���
// ��������Ϊ���ǿ�����������顣
// Ҫ�������ڰ�װ�ļ���ʱ����ṩ��ȷ���롣

  SetPassword(TmpPassword);
  ExtractTemporaryFile('logo.bmp');
  SetPassword('FakePassword'); // ���������������һ�����롣
  
  // �������������ȷ�������ھ����ܵ����̶�̬���Գ��򿴼������ʱ�䷶Χ�� 

  Logo := TBitmapImage.Create(WizardForm);
  Logo.Parent := WizardForm;
  Logo.Bitmap.LoadFromFile(ExpandConstant('{tmp}\logo.bmp'));
  Logo.SetBounds(30, WizardForm.Bevel.Top+10, Logo.Bitmap.Width, Logo.Bitmap.Height);
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  // ����������װ�ļ���ʱ����ṩ��ȷ�����룬����������Ҫ�����ֱ��ʹ�õ���������������ķ�����
  // �򵥵��㷨�Ϳ�������ԵĹ��̳�Ϊһ���Ĺ�����������Ҫ��������ֻ�Ƕ̶̵ļ�����롣 
  if CurStep = ssInstall then
    SetPassword(TmpPassword); 
end;

