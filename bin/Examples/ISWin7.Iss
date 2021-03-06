; ���������������� ������ ISWin7 v0.5
;
; [+] ����������?���������� ��������?���������� ��������
;
; ��������?Windows Vista ���� ���������� ���������� ���� ���� ������?
;
; ��?�������� ������ ��������� ������?����������?��? ��?��?���� ������?
; �������� ?Windows 7, Windows 8
;
; ?Windows XP ?Windows Vista �� ���������� ������������?
; ��?�� ������ ����������������?��������??���� ������������ ��������
;
; ��������? VoLT ( Vo1T �� Ru-Board )

#include "IsWin7.ish"

[Setup]
AppName=My Program
AppVerName=My Program version 1.5
DefaultDirName={pf}\My Program
DefaultGroupName=My Program
UninstallDisplayIcon={app}\MyProg.exe
Compression=lzma
SolidCompression=yes
OutputDir=userdocs:Inno Setup Examples Output

[Code]
procedure InitializeWizard();
begin
  PDir('{# ISWin7_DLL }');

  // ���������� ��������� ������ ������ ������������?�� ������
  // �� ������������?������ ��� ���� ��?�� �� ���� ��?))
  iswin7_add_button(WizardForm.BackButton.Handle);
  iswin7_add_button(WizardForm.NextButton.Handle);
  iswin7_add_button(WizardForm.CancelButton.Handle);
  // �������� True �� ������?�� ��� htuos ))
  iswin7_add_glass(WizardForm.Handle, 0, 0, 0, 47, True);
end;

procedure DeinitializeSetup();
begin
  //�˳���װ����
  iswin7_free;
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  WizardForm.ReadyPage.Hide;
end;