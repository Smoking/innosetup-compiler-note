; ��ʾ��η�ֹ ͨ�ý������Update: 2008-12-07
; �ű�: restools ( http://restools.hanzify.org )

; ��ʾ InitializeLanguageDialog ���÷�.
; ����һ���� ���ԶԻ��� ������ֵ� Inno Setup �¼���
; Wnd �����ԶԻ���Ĵ��ھ��,
; Languages �����ԶԻ������ֵ������б�,
; LanguageIndex �ǽ���ѡ��������, ���¼��п�������ָ��.
; ����ֵ���Ϊ��, ���ԶԻ��򽫲������.

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

[Languages]
Name: "default"; MessagesFile: "compiler:Default.isl"
Name: "chinesesimp"; MessagesFile: "compiler:Languages\ChineseSimp.isl"
Name: "chinesetrad"; MessagesFile: "compiler:Languages\ChineseTrad.isl"
Name: "japanese"; MessagesFile: "compiler:Languages\Japanese.isl"
Name: "korean"; MessagesFile: "compiler:Languages\Korean.isl"
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"

[Types]
Name: "full"; Description: "full"
Name: "compact"; Description: "compact"
Name: "custom"; Description: "custom"; Flags: iscustom

[Components]
Name: "program"; Description: "app files"; Types: full compact custom; Flags: fixed
Name: "help"; Description: "help files"; Types: full
Name: "readme"; Description: "readme files"; Types: full

[Files]
Source: "ISSkin.dll"; DestDir: {app}; Flags: dontcopy
Source: "Styles\Office2007.cjstyles"; DestDir: {tmp}; Flags: dontcopy
Source: "MyProg.exe"; DestDir: "{app}"; Components: program
Source: "MyProg1.chm"; DestDir: "{app}"; Components: help
Source: "Readme1.txt"; DestDir: "{app}"; Components: readme; Flags: isreadme

[Icons]
Name: "{group}\my application"; Filename: "{app}\MyProg.exe"

[code]
procedure LoadSkin(lpszPath: String; lpszIniFileName: String); external 'LoadSkin@files:isskin.dll stdcall';
procedure UnloadSkin(); external 'UnloadSkin@files:isskin.dll stdcall';
function ShowWindow(hWnd: Integer; uType: Integer): Integer; external 'ShowWindow@user32.dll stdcall';

function InitializeLanguageDialog(Wnd: HWND; Languages: String; var LanguageIndex: Integer): Boolean;
begin
  ExtractTemporaryFile('Office2007.cjstyles');
	LoadSkin(ExpandConstant('{tmp}\Office2007.cjstyles'), '');
	Result := True;
end;

procedure DeinitializeSetup();
begin
	ShowWindow(StrToInt(ExpandConstant('{wizardhwnd}')), 0);
	UnloadSkin();
end;


















