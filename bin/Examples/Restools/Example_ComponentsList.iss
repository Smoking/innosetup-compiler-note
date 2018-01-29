; ��ʾ���ʹ����ǿ�����尲װ�������ǿ�ı�������
; �ű�: restools ( http://restools.hanzify.org )
; ���ｫ����ʾ������ǿ���ܲ��ṩ��ؽ��͡�

; ��������� VCL ���Ժͺ�����������鿴��Support Classes.txt��

#ifndef IS_ENHANCED
  #error Enhanced edition of Inno Setup (restools) is required to compile this script
#endif

[Setup]
AppName=My Program
AppVersion=1.5
DefaultDirName={pf}\My Program
DefaultGroupName=My Program
UninstallDisplayIcon={app}\MyProg.exe
SolidCompression=yes
Compression=lzma/ultra	
UsePreviousTasks=yes
;///////////////////////////////////////////////
; build 080805
; ��������һ��ѡ�������б�� TreeView ģʽ������һ�����ο��ƴ��ڡ�
; Ĭ������б���ԭʼģʽ����ԭ��һ����ֻ����������ѡ��Ż������ο��ơ�
ComponentsListTVStyle=yes
;///////////////////////////////////////////////
; build 090424
; ��������һ��ѡ�� ComponentsListBtnImageFile�������Զ��� Radiobutton �� CheckBox �İ�ťͼƬ��
ComponentsListBtnImageFile=btnimage.bmp
OutputDir=userdocs:Inno Setup Examples Output

[Types]
Name: "full"; Description: "Full installation"
Name: "compact"; Description: "Compact installation"
Name: "custom"; Description: "Custom installation"; Flags: iscustom

[Components]
Name: "program"; Description: "Program Files"; Types: full compact custom; Flags: fixed
;///////////////////////////////////////////////
; build 080815
; ItemHeightFixed := True;
; �����ֵ�����ʾ������Ƶ������ϻ��� Hint ����ʽ��ʾ������һ��
Name: "help"; Description: "Help File (����ӳ�������Ϊ��������µĲ��ԣ��� ItemHeightFixed ��������Ϊ True ��ʱ����һ�����ֻ��Ե�����ʾ)"; Types: full compact
Name: "help\help1"; Description: "Help File 1 (Test Bold)"; Flags: exclusive
Name: "help\help2"; Description: "Help File 2 (Test Italic)"; Flags: exclusive
Name: "readme"; Description: "Readme (Test Underline)"; Types: full
Name: "readme\readme1"; Description: "Readme 1 (Test StrikeOut)"; Types: full compact
;///////////////////////////////////////////////
; build 080805
; ComponentsListTVStyle ��������
; Ĭ�����������ʼ����չ������ʽ���֣��������ĳһ��������֡��۵���״̬���������ñ�ǡ�Collapsed��
Name: "readme\readme2"; Description: "Readme 2"; Types: full; Flags: Collapsed
Name: "readme\readme2\r1"; Description: "Readme 2..1"; Types: full compact
Name: "readme\readme2\r2"; Description: "Readme 2..2"; Types: full

[Files]
Source: "MyProg.exe"; DestDir: "{app}"; Components: program
Source: "MyProg1.chm"; DestDir: "{app}"; Components: help\help1
Source: "MyProg2.chm"; DestDir: "{app}"; Components: help\help2
Source: "Readme1.txt"; DestDir: "{app}"; Components: readme\readme1; Flags: isreadme
Source: "Readme2.txt"; DestDir: "{app}"; DestName: "Readme2_1.txt"; Components: readme\readme2\r1
Source: "Readme2.txt"; DestDir: "{app}"; DestName: "Readme2_2.txt"; Components: readme\readme2\r2

[Icons]
Name: "{group}\My Program"; Filename: "{app}\MyProg.exe"

[code]
procedure InitializeWizard();
begin
////////////////////////////////////////////////
// build 080805
// ���´�����������������ǰ������ߣ���������ѡ���ôΨһ��չ���������ķ�������˫��������
//  WizardForm.ComponentsList.Showroot := False;

////////////////////////////////////////////////
// build 080815
// ��������Ϊ True���Ե��и���ʾÿ���ʾ����ȫ�Ŀ����� Hint ��ʾ����һ�С�
//  WizardForm.ComponentsList.ItemHeightFixed := True;

////////////////////////////////////////////////
// build 081121    [fsBold,fsItalic,fsUnderline,fsStrikeOut]
// �������Ҫ��ÿһ�������ص��ʶ������һ���ǳ��õĹ��ܡ�
  WizardForm.ComponentsList.ItemFontStyle[2] := [fsBold];
  WizardForm.ComponentsList.ItemFontStyle[3] := [fsItalic];
  WizardForm.ComponentsList.ItemFontStyle[4] := [fsUnderline];
  WizardForm.ComponentsList.ItemFontStyle[5] := [fsStrikeOut];
  WizardForm.ComponentsList.SubItemFontStyle[5] := [fsBold];
  WizardForm.ComponentsList.SubItemFontStyle[4] := [fsItalic];
  WizardForm.ComponentsList.SubItemFontStyle[3] := [fsUnderline];
  WizardForm.ComponentsList.SubItemFontStyle[2] := [fsStrikeOut];
end;

