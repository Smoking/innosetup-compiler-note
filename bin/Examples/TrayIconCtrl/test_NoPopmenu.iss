; -- test_NoPopmenu.iss --
; restools
; http://restools.hanzify.org

#define TIconList_Count 4
#include "trayiconctrl.ish"

[Setup]
AppName=MyApp
AppVerName=MyApp Ver 1.0
DefaultDirName={pf}\MyApp
DefaultGroupName=MyApp
Compression=lzma
;WindowVisible=yes
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: "icons\icon1.ico"; Flags: dontcopy
Source: "icons\icon2.ico"; Flags: dontcopy
Source: "icons\icon3.ico"; Flags: dontcopy
Source: "icons\icon4.ico"; Flags: dontcopy
Source: "icons\face.ico"; Flags: dontcopy
Source: "icons\exp.ico"; Flags: dontcopy

[code]
function LoadImage(hInst: UINT; ImageName: String; ImageType: UINT; X, Y: Integer; Flags: UINT): THandle;
external 'LoadImage{#A}@user32.dll stdcall';

const
  WM_USER = $400;
 	WM_ICON_NOTIFY = WM_USER + 22; // �Լ�����һ�� TrayIcon ����Ϣ��־�Ժ���������Ϣ����
  IMAGE_ICON = 1;
  LR_LOADFROMFILE = $10;

var
  AniIcon: TIconList;
  Ico1, Ico2: UINT;

procedure AnimateBtnOnClick(Sender: TObject);
begin
  // ѭ����ʾͼ���� 5 ����Զ�ֹͣ
  AnimateTrayIcon(40, 5);
  ShowBalloon('Animate Icon...', 'MyApp ver 1.0', NIIF_INFO, 10, False);
end;

procedure StopAnimateBtnOnClick(Sender: TObject);
begin
  StopAnimation();
  ShowBalloon('Stop Animation...', 'MyApp ver 1.0', NIIF_WARNING, 10, False);
end;

procedure RadioBtnOnClick(Sender: TObject);
begin
	case TNewRadioButton(Sender).Tag of
	1: SetTrayIcon('MyApp Ver 1111.0', ico1);
	2: SetTrayIcon('MyApp Ver 2222.0', ico2);
	end;
end;

procedure InitializeWizard();
var
  AnimateBtn, StopAnimateBtn, CancelButton: TButton;
  Icon_Check1, Icon_Check2: TNewRadioButton;
begin
  PDir('{# TrayIconCtrl_DLL }');

  ExtractTemporaryFile('icon1.ico');
  ExtractTemporaryFile('icon2.ico');
  ExtractTemporaryFile('icon3.ico');
  ExtractTemporaryFile('icon4.ico');
  ExtractTemporaryFile('face.ico');
  ExtractTemporaryFile('exp.ico');

  Ico1 := LoadImage(0, ExpandConstant('{tmp}\face.ico'), IMAGE_ICON, 16, 16, LR_LOADFROMFILE);
  Ico2 := LoadImage(0, ExpandConstant('{tmp}\exp.ico'), IMAGE_ICON, 16, 16, LR_LOADFROMFILE);

  InitTrayIconCtrl(MainForm.Handle, WizardForm.Handle,
			 WM_ICON_NOTIFY,   // �Զ����Լ�����Ϣ ID, ������������Ϣ
			 'MyApp Ver 1.0',  // Tooltip ����� TrayIcon ͼ�����ƶ���ʱ����ʾ����ʾ
			 0,                // ����Ĭ��ʹ�ð�װ����ͼ��
       True,             // ������ʾ, ���õ��� ShowTrayIcon
			 False,            // ����ʾ��װ�������������ť
			 '',               // ����������ͼ��˵�
			 -1,               // û��Ĭ�ϲ˵���
			 nil,              // û�в˵�����¼�
			 nil,              // û�в˵������¼�
			 nil               // û���Զ�������ͼ���¼�
			 );

  // ��ʾ������������ʾ
  ShowBalloon('Setup is starting...', 'MyApp ver 1.0', 0, 10, False);

  // ����ͼ����
  AniIcon.Icon1 := LoadImage(0, ExpandConstant('{tmp}\icon1.ico'), IMAGE_ICON, 16, 16, LR_LOADFROMFILE);
  AniIcon.Icon2 := LoadImage(0, ExpandConstant('{tmp}\icon2.ico'), IMAGE_ICON, 16, 16, LR_LOADFROMFILE);
  AniIcon.Icon3 := LoadImage(0, ExpandConstant('{tmp}\icon3.ico'), IMAGE_ICON, 16, 16, LR_LOADFROMFILE);
  AniIcon.Icon4 := LoadImage(0, ExpandConstant('{tmp}\icon4.ico'), IMAGE_ICON, 16, 16, LR_LOADFROMFILE);

  // ����ͼ��������
  SetIconList(AniIcon, SizeOf(AniIcon) div SizeOf(AniIcon.Icon1));

  CancelButton := WizardForm.CancelButton;

  AnimateBtn := TButton.Create(WizardForm);
  AnimateBtn.Left := ScaleX(5);
  AnimateBtn.Top := CancelButton.Top;
  AnimateBtn.Width := ScaleX(95);
  AnimateBtn.Height := CancelButton.Height;
  AnimateBtn.Caption := '&AnimateTrayIcon';
  AnimateBtn.OnClick := @AnimateBtnOnClick;
  AnimateBtn.Parent := WizardForm;

  StopAnimateBtn := TButton.Create(WizardForm);
  StopAnimateBtn.Left := ScaleX(105);
  StopAnimateBtn.Top := CancelButton.Top;
  StopAnimateBtn.Width := ScaleX(95);
  StopAnimateBtn.Height := CancelButton.Height;
  StopAnimateBtn.Caption := '&StopAnimateIcon';
  StopAnimateBtn.OnClick := @StopAnimateBtnOnClick;
  StopAnimateBtn.Parent := WizardForm;

  Icon_Check1 := TNewRadioButton.Create(WizardForm);
  Icon_Check1.Left := ScaleX(205);
  Icon_Check1.Top := CancelButton.Top - ScaleY(6);
  Icon_Check1.Width := ScaleX(50);
  Icon_Check1.Caption := 'Icon &1';
  Icon_Check1.Checked := True;
  Icon_Check1.OnClick := @RadioBtnOnClick;
  Icon_Check1.Parent := WizardForm;
  Icon_Check1.Tag := 1;

  Icon_Check2 := TNewRadioButton.Create(WizardForm);
  Icon_Check2.Left := ScaleX(205);
  Icon_Check2.Top := CancelButton.Top + ScaleY(12);
  Icon_Check2.Width := ScaleX(50);
  Icon_Check2.Caption := 'Icon &2';
  Icon_Check2.OnClick := @RadioBtnOnClick;
  Icon_Check2.Parent := WizardForm;
  Icon_Check2.Tag := 2;

end;

procedure DeinitializeSetup();
begin
  MainForm.Hide;
  WizardForm.Hide;
  UninitTrayIconCtrl();
end;









