; �ű��� Inno Setup �ű��� ���ɣ�
; �йش��� Inno Setup �ű��ļ�����ϸ��������İ����ĵ���

#include "FlashLib.ish"

[Setup]
; ע: AppId��ֵΪ������ʶ��Ӧ�ó���
; ��ҪΪ������װ����ʹ����ͬ��AppIdֵ��
; (�����µ�GUID����� ����|��IDE������GUID��)
AppId={{07A9667A-62FA-4EE1-BA80-DE7B0AC3C12E}
AppName=�ҵĳ���
AppVerName=�ҵĳ��� 1.5
AppPublisher=�ҵĹ�˾
AppPublisherURL=http://www.example.com/
AppSupportURL=http://www.example.com/
AppUpdatesURL=http://www.example.com/
DefaultDirName={pf}\�ҵĳ���
DefaultGroupName=�ҵĳ���
OutputDir=userdocs:Inno Setup Examples Output
OutputBaseFilename=setup
Compression=lzma
SolidCompression=yes

[Files]
; ע��: ��Ҫ���κι���ϵͳ�ļ���ʹ�á�Flags: ignoreversion��
Source: FlashLib.swf; DestDir: {tmp}; Flags: noencryption nocompression

[Icons]
Name: {group}\{cm:UninstallProgram, �ҵĳ���}; Filename: {uninstallexe}

[Code]
var
  FlashHwnd: HWND;

procedure InitializeWizard();
var
  F: String;
begin
  PDir('FlashLib.dll');
  ExtractTemporaryFile('FlashLib.swf');
  F:= ExpandConstant('{tmp}\FlashLib.swf');
  with WizardForm.WizardBitmapImage do
  begin
    FlashHwnd := FlashLibInit(Left, Top, Width, Height, WizardForm.WelcomePage.Handle, Bitmap.Handle, True);
  end;
  FlashLoadMovie(FlashHwnd, AnsiString(F));
end;

procedure DeinitializeSetup();
begin
  FlashLibFree(FlashHwnd);
end;
