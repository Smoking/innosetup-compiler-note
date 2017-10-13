; -- Example1.iss --

; ��ʾ��ε��� NSIS ����� INNO ��װ����
; ���з���ֵ�ĵ��ò��
; ���Խ���������Ч��������������������
; ͨ�� NSIS ���ò�� callnsis.dll��NSIS ������� AdvSplash.dll
; �ű���д�� restools ��ҳ�� http://restools.yeah.net

#include "CallNsis.Ish"

[Setup]
AppName=�ҵĳ���
AppVerName=�ҵĳ��� �汾 1.5
DefaultDirName={pf}\�ҵĳ���
DefaultGroupName=�ҵĳ���
UninstallDisplayIcon={app}\MyProg.exe
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: "compiler:\Examples\MyProg.exe"; DestDir: "{app}"
Source: "compiler:\Examples\MyProg.chm"; DestDir: "{app}"
Source: "compiler:\Examples\Readme.txt"; DestDir: "{app}"; Flags: isreadme

Source: "{#PluginDir}\Nsis\AdvSplash.dll"; Flags: dontcopy
Source: "logo.bmp"; Flags: dontcopy
Source: "logo.wav"; Flags: dontcopy


[Icons]
Name: "{group}\�ҵĳ���"; Filename: "{app}\MyProg.exe"

[code]

procedure InitializeWizard();
var
  val: Integer;
begin
  PDir('{# CallNsis_Dll}');
  
  ExtractTemporaryFile('AdvSplash.dll');
  ExtractTemporaryFile('logo.bmp');
  ExtractTemporaryFile('logo.wav');
  val:=callplug(0,ExpandConstant('{tmp}\AdvSplash.dll'),'show','2800','1400','1200','-1',ExpandConstant('{tmp}\logo'),'','','','','');
  
  // �� NSIS �������е��������µģ�
  
  // SetOutPath $TEMP                               # �������λ��Ϊ��ʱĿ¼
  // File /oname=logo.bmp "my_splash.bmp"           # �ͷ��ļ�
  // File /oname=logo.wav "my_splashshit.wav"       # �ͷ��ļ�
  // advsplash::show 2800 1400 1200 -1 $TEMP\spltmp # ���ò��
  // Pop $0                                         # ȡ����ֵ�� ���� '1' ��ʾ�û���ǰ�ر�����, ���� '0' ��ʾ������������, ���� '-1' ��ʾ������ʾ����
  
  // �����ϣ����õķ�������һ���ģ�����ֻҪ���Կ��� NSIS �Ĳ�����ӣ���Ϳ����� INNO ���������Ϸ������е���

  if val = 1 then
    MsgBox('�������������ڣ�����������ǰ�رգ�', mbConfirmation, MB_OK);
end;



