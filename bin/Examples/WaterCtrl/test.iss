; -- test.iss --
; restools
; http://restools.hanzify.org
; ʱ��ִ٣����Կ��ܻ��е��������д���������
; waterctrl.dll Ϊһ������ Inno Setup �� 16.5 KB ��ˮ����Ч�����
; ��Ҫע�⣬���ʹ�� MFC, ϵͳ��Ҫ�� mfc42.dll������һ��ϵͳ�Դ���

; v2 �汾  ��������ˮ�Ʋ���ĸ����

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
Source: "{#PluginDir}\waterctrl.dll"; Flags: dontcopy
Source: "WizModernImage-Is.bmp"; Flags: dontcopy

[Icons]
Name: "{group}\�ҵĳ���"; Filename: "{app}\MyProg.exe"

[code]

function enablewater(ParentWnd: HWND; Left, Top: integer; Bmp: HBITMAP;
     WaterRadius, WaterHeight: integer): BOOL; external 'enablewater@files:waterctrl.dll stdcall';
//ParentWnd     ������Ч���ڵĸ����ھ����
//Left          ��λ��
//Top           ��λ��
//Bmp           λͼ�����
//WaterRadius   ˮ�ư뾶�����ˮ�ƿ�������Χ���㡣
//WaterHeight   ˮ�Ƹ߶ȣ����ˮ�ƿ��������
//ע�⣬ˮ�Ʋ���Զ�����ͼƬ���趨�߶ȺͿ�ȣ�
//����ˮ�Ƶ�ͼ�����Ƿ�ת��ͼƬ����ʾ��ʱ��ᷭתͼƬ����ʾ��

function waterblob(x, y: integer; radius, height: integer): BOOL; external 'waterblob@files:waterctrl.dll stdcall';
// �� x,y ������뾶Ϊradius, �߶�Ϊheight ��ˮ�ơ�

function flattenwater(): BOOL; external 'flattenwater@files:waterctrl.dll stdcall';
// ƽ������ˮ�ơ�

function disablewater(): BOOL; external 'disablewater@files:waterctrl.dll stdcall';
//�ͷ�ˮ�Ʋ��

function setwaterparent(ParentWnd: HWND): BOOL; external 'setwaterparent@files:waterctrl.dll stdcall';
//v2 ����������ˮ�Ʋ���ĸ����

var
  bmp: TBitmap;

procedure InitializeWizard();
begin
  ExtractTemporaryFile('WizModernImage-Is.bmp');
  bmp := TBitmap.create;
  bmp.LoadFromFile(ExpandConstant('{tmp}\WizModernImage-Is.bmp'));

  enablewater(WizardForm.WelcomePage.Handle, 0, 0, bmp.Handle, 3, 50);
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  if CurPageID = wpWelcome then
  begin
    setwaterparent(WizardForm.WelcomePage.Handle);
    waterblob(70, 198, 10, 1000);
  end else
  if CurPageID = wpFinished then
  begin
    setwaterparent(WizardForm.FinishedPage.Handle);
    waterblob(70, 198, 10, 1000);
  end else
    flattenwater();
end;

procedure DeinitializeSetup();
begin
  disablewater();
  bmp.Free;
end;


