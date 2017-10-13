; ��ʾ���ʹ��Setup���� UninstallIconFile.
; �ű�: restools ( http://restools.hanzify.org )

; �ؿ� UninstallIconFile ����.
; �ò����Ѿ����ٷ��汾������, ԭ������Ϊ��װ���ֺ�ж�ز��ֵ���������Ѿ���һ�廯.
; �ؿ�����Ϊ�Ѿ��ҵ�����ķ���. �÷���������õİ�װ����ʹ�� Win98 ��Ҳ����������.

#ifndef IS_ENHANCED
  #error Enhanced edition of Inno Setup (restools) is required to compile this script
#endif

[Setup]
AppName=My Program
AppVersion=1.5
DefaultDirName={pf}\My Program
DefaultGroupName=My Program
UninstallDisplayIcon={app}\MyProg.exe
SetupIconFile=Setup.ico
SolidCompression=yes
Compression=lzma/ultra
OutputDir=userdocs:Inno Setup Examples Output
// ���¼��� UninstallIconFile ������ʹ��
UninstallIconFile=Uninstall.ico

[Files]
Source: "MyProg.exe"; DestDir: "{app}"
Source: "MyProg1.chm"; DestName: "MyProg.chm"; DestDir: "{app}"
Source: "Readme1.txt"; DestName: "Readme.txt"; DestDir: "{app}"; Flags: isreadme

[Icons]
Name: "{group}\My Program"; Filename: "{app}\MyProg.exe"
Name: "{group}\My Program Documentation"; Filename: "{app}\MyProg.chm";
Name: "{group}\My Program Readme"; Filename: "{app}\Readme.txt";
Name: "{group}\Remove My Program"; Filename: "{uninstallexe}";

