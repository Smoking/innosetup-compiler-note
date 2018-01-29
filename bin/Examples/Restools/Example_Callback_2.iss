; ��ʾ���ʹ����ǿ�����尲װ�������ǿ�ı�������
; �ű�: restools ( http://restools.hanzify.org )
; ���ｫ����ʾ������ǿ���ܲ��ṩ��ؽ��͡�

; ��������� VCL ���Ժͺ�����������鿴��Support Classes.txt��

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
SolidCompression=yes
Compression=lzma/ultra	
PrivilegesRequired=none
OutputDir=userdocs:Inno Setup Examples Output

[code]
var
  ListBox: TListBox;

function EnumWindows(lpEnumFunc: Longword; lParam: Longword): Boolean; external 'EnumWindows@user32.dll stdcall';
// ö�ٵ�ǰ���д��ڣ���Ҫ���ûص�������

function GetWindowText(hWnd: HWND; lpString: String; nMaxCount: Integer): Integer; external 'GetWindowText{#A}@user32.dll stdcall';

function IsWindowVisible(hWnd: HWND): Boolean; external 'IsWindowVisible@user32.dll stdcall';

function EnumWindowsProc(
    hwnd: HWND;	    // handle to parent window
    lParam: Longword  	// application-defined value
    ): Boolean;
var
  s: String;
begin
  Result := True; // ������ֵ��ʾ����ö�٣�Ҳ���Ǽ��������������ֱ�����д��ڱ�ö��һ�顣
  // �����о������б���Ŀ��Ӵ��ڵı��⡣
  if IsWindowVisible(hwnd) then
  begin
    s := StringOfChar(' ', 256);
    GetWindowText(hwnd, s, 256);
    s := Trim(s);
    if s <> '' then
      if ListBox.Items.IndexOf(s) = -1 then
        ListBox.Items.Append(S);
  end;
end;

procedure InitializeWizard();
begin
  WizardForm.Caption := 'Visible window title';
  WizardForm.OuterNotebook.Hide;
  ListBox := TListBox.Create(WizardForm);
  ListBox.Parent := WizardForm;
  ListBox.SetBounds(5, 5, WizardForm.ClientWidth - 10, WizardForm.Bevel.Top - 10);
  EnumWindows(CallbackAddr('EnumWindowsProc'), 0);
  // CallbackAddr �������ָ���ĺ���������ܹ��� WinAPI ���õĻص�����������ʹ���൱���㡣
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  WizardForm.NextButton.Hide;
  WizardForm.CancelButton.Caption := 'Close';
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  Result := False;
end;




