; ��ʾ���ʹ�� �ڲ����� {apphwnd}
; �ű�: restools ( http://restools.hanzify.org )

; ����һ���ڲ����� {apphwnd}, �᷵�� Application �ľ��, �൱�� Delphi �е� Application.handle .

#ifndef IS_ENHANCED
  #error Enhanced edition of Inno Setup (restools) is required to compile this script
#endif

#ifdef UNICODE
  #define A "W"
#else
  #define A "A"
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

[code]
function SetWindowText(hWnd: Longint; lpString: String): Longint; external 'SetWindowText{#A}@user32.dll';

function InitializeSetup(): Boolean;
begin
  SetWindowText(StrToInt(ExpandConstant('{apphwnd}')), 'Change Application Title');
  Result := True;
end;

