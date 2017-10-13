;Created by South.Tver 09.2010
;������ ������������� ����������� ���������

#include "botva2.ish"
#include "TrackBar.ish"
#include "ProgressBar.ish"

[Setup]
AppName=TrackBar by South.Tver
AppVerName=TrackBar by South.Tver
DefaultDirName={pf}\TrackBar
OutputBaseFilename=setup
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: Files\*; Flags: dontcopy

[Code]

var
  TB,TB2 : integer;
  L,L2   : TLabel;
  PB1    : TImgPB;

function InitializeSetup:boolean;
begin
  PDir('{# Botva2_Dll}');
  PDir('{# CallbackCtrl_Dll}');
  Result:=True;
end;

procedure TBChangePos(pos:integer);
begin
  L.Caption:=IntToStr(pos);
  ImgPBSetPosition(PB1,pos);
  //ImgApplyChanges(WizardForm.Handle);
end;

procedure TBChangePos2(pos:integer);
begin
  L2.Caption:='������� ������� = '+IntToStr(pos);
end;

procedure InitializeWizard;
var
  i:integer;
begin
  PDir('nfs.jpg');
  PDir('trackbar_btn.png');
  PDir('trackbar_bkg.png');
  PDir('pbbkg.png');
  PDir('pb.png');
  //�������� �������� �����
  with WizardForm do begin
    InnerNotebook.Hide;
    OuterNotebook.Hide;
    Bevel.Hide;
  end;
  //������ ��� ����������� ����
  L:=TLabel.Create(WizardForm);
  with L do begin
    SetBounds(80,140,150,21);
    AutoSize:=True;
    Font.Color:=clWhite;
    Font.Style:=[fsBold];
    Parent:=WizardForm;
    Transparent:=True;
  end;
  L2:=TLabel.Create(WizardForm);
  with L2 do begin
    SetBounds(200,140,150,21);
    AutoSize:=True;
    Font.Color:=clWhite;
    Font.Style:=[fsBold];
    Caption:='������� ������� = 0';
    Parent:=WizardForm;
    Transparent:=True;
  end;
  
  //������� ��������
  ImgLoad(WizardForm.Handle,ExpandConstant('{tmp}\nfs.jpg'),0,0,WizardForm.ClientWidth,WizardForm.ClientHeight,True,True);
  //�����������
  PB1:=ImgPBCreate(WizardForm.Handle, ExpandConstant('{tmp}\pbbkg.png'), ExpandConstant('{tmp}\pb.png'), 10, 250, WizardForm.ClientWidth-20, 25);
  //������ �������
  TB:=ImgTBCreate(WizardForm.Handle,ExpandConstant('{tmp}\trackbar_bkg.png'),ExpandConstant('{tmp}\trackbar_btn.png'),10,170,150,10,7,163,160,18,33,2);
  ImgTBSetChangePosEvent(TB,@TBChangePos); //��� ����������� ������� �������� TB ����� ����������� ��������� TBChangePos
  ImgTBSetPosition(TB,50);
  //������ �������
  TB2:=ImgTBCreate(WizardForm.Handle,ExpandConstant('{tmp}\trackbar_bkg.png'),ExpandConstant('{tmp}\trackbar_btn.png'),200,170,150,10,197,353,160,18,33,2);
  ImgTBSetChangePosEvent(TB2,@TBChangePos2); //��� ����������� ������� �������� TB2 ����� ����������� ��������� TBChangePos2

  ImgApplyChanges(WizardForm.Handle);
end;

procedure DeinitializeSetup;
begin
  gdipShutdown;
end;

