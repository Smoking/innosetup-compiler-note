; ��ʾ���ʹ����ǿ�����尲װ�������ǿ�ı�������
; �ű�: restools ( http://restools.hanzify.org )
; ���ｫ����ʾ������ǿ���ܲ��ṩ��ؽ��͡�

; ��������� VCL ���Ժͺ�����������鿴��Support Classes.txt��

; ���� Hint ����ʾЧ������ Delphi 2.0 �±���� Hint ��ʾ������ӽӽ� Windows �ķ��
; ��û�в��� Delphi ����汾�ķ�񣬶��ǲ����˴���� VC++ ����� Windows �������ʾ���

#ifndef IS_ENHANCED
  #error Enhanced edition of Inno Setup (restools) is required to compile this script
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
procedure InitializeWizard();
var
  Panel: TPanel;
begin
	WizardForm.OuterNotebook.Hide;
	WizardForm.NextButton.Hide;
	
//  Application.HintHidePause := 4000; // Hint ͣ����ʱ�� ��λ: ms

  Panel := TPanel.Create(WizardForm);
  with Panel do
  begin
    Parent := WizardForm;
    Caption := 'Panel';
    SetBounds(ScaleX(180), ScaleY(200), ScaleX(230), ScaleY(100));
    Hint := 'I am a Panel.'
    ShowHint := True;
  end;

  with TLabel.Create(WizardForm) do
  begin
    Parent := WizardForm;
    Caption := 'Position your mouse over these components.';
    Left := ScaleX(10);
    Top := ScaleY(10);
    Font.Size := 16;
  end;

  with TNewButton.Create(WizardForm) do
  begin
    Parent := Panel;
    Caption := 'Button';
    SetBounds(ScaleX(30), ScaleY(60), ScaleX(80), ScaleY(30));
    Hint := 'I am a Button.'
    ShowHint := True;
  end;

  with TNewEdit.Create(WizardForm) do
  begin
    Parent := WizardForm;
    Text := 'Edit';
    SetBounds(ScaleX(40), ScaleY(170), ScaleX(120), ScaleY(30));
    Hint := 'I am a Edit.'
    ShowHint := True;
  end;

  with TNewListBox.Create(WizardForm) do
  begin
    Parent := WizardForm;
    Items.Append('ListBox');
    SetBounds(ScaleX(180), ScaleY(70), ScaleX(180), ScaleY(120));
    Hint := 'I am a ListBox.'
    ShowHint := True;
  end;
  
  WizardForm.CancelButton.Hint := 'Don''t click meeee.... :(';
  WizardForm.CancelButton.ShowHint := True;
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  WizardForm.Caption := 'TControl Hint Demo';
  WizardForm.NextButton.Hide;
  WizardForm.CancelButton.Caption := 'Close';
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  Result := False;
end;
