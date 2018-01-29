; -- test.iss --
; restools
; http://restools.hanzify.org
; ʱ��ִ٣����Կ��ܻ��е��������д���������
; firectrl.dll Ϊһ������ Inno Setup �� 17.5 KB �Ļ�����Ч�����
; ��Ҫע�⣬���ʹ�� MFC, ϵͳ��Ҫ�� mfc42.dll������һ��ϵͳ�Դ���

[Setup]
AppName=�ҵĳ���
AppVerName=�ҵĳ��� �汾 1.5
DefaultDirName={pf}\�ҵĳ���
DefaultGroupName=�ҵĳ���
UninstallDisplayIcon={app}\MyProg.exe
Compression=lzma
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: "compiler:\Examples\MyProg.exe"; DestDir: "{app}"
Source: "compiler:\Examples\Readme.txt"; DestDir: "{app}"; Flags: isreadme
Source: "{#PluginDir}\firectrl.dll"; Flags: dontcopy
Source: "MicrosoftClassic15.bmp"; Flags: dontcopy

[Icons]
Name: "{group}\�ҵĳ���"; Filename: "{app}\MyProg.exe"

[code]

function enablefire(ParentWnd: HWND; Left, Top: integer; Bmp: HBITMAP;
     FireAlpha: integer): BOOL; external 'enablefire@files:firectrl.dll stdcall';
//ParentWnd     ������Ч���ڵĸ����ھ����
//Left          ��Ч����xλ��
//Top           ��Ч����yλ��
//Bmp           λͼ�����
//FireAlpha     ���� Alpha ֵ 0~100��ֵԽ�󣬻����Ũ��
//ע�⣬�������Զ�����ͼƬ���趨�߶ȺͿ�ȣ�
//��������ͼ�����Ƿ�ת��ͼƬ����ʾ��ʱ��ᷭתͼƬ����ʾ��

function disablefire(): BOOL; external 'disablefire@files:firectrl.dll stdcall';
//�ͷŻ�����

var
  bmp: TBitmap;

procedure InitializeWizard();
begin
  ExtractTemporaryFile('MicrosoftClassic15.bmp');
  bmp := TBitmap.create;
  bmp.LoadFromFile(ExpandConstant('{tmp}\MicrosoftClassic15.bmp'));

  enablefire(WizardForm.WelcomePage.Handle, 0, 0, bmp.Handle, 50);
end;

procedure DeinitializeSetup();
begin
  disablefire();
  bmp.Free;
end;


