; ��ʾ���ʹ����ǿ�����尲װ�������ǿ�ı�������
; �ű�: restools ( http://restools.hanzify.org )
; ���ｫ����ʾ������ǿ���ܲ��ṩ��ؽ��͡�

; ��������� VCL ���Ժͺ�����������鿴��Support Classes.txt��

#ifdef IS_ENHANCED
  #if (Ver < 0x5020300) || (Pos('ee', IS_Ver_Str) < 1)
    #pragma error 'Enhanced edition of Inno Setup (5.2.3.ee1 or higher) is required to compile this script'
  #endif
#else
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

[Files]
Source: "img.bmp"; Flags: dontcopy

[code]
var
  TreeView1: TTreeView;

procedure TreeView1OnMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  tn: TTreeNode;
begin
  tn := TreeView1.GetNodeAt(x, y);
  if htOnItem in TreeView1.GetHitTestInfoAt(X, Y) then
    if not tn.HasChildren then
      MsgBox('Children: ' + tn.Text, mbInformation, MB_OK);
  // ֻ�е����ײ�����Żᵯ���Ի���
end;

procedure TreeView1OnGetImageIndex(Sender: TObject; Node: TTreeNode);
begin
  if Node.HasChildren then
  begin
    if Node.Expanded then
      Node.ImageIndex := 1
    else
      Node.ImageIndex := 0;
  end else
    Node.ImageIndex := 2;
end;

procedure TreeView1OnGetSelectedIndex(Sender: TObject; Node: TTreeNode);
begin
  if Node.HasChildren then
  begin
    if Node.Expanded then
      Node.SelectedIndex := 1
    else
      Node.SelectedIndex := 0;
  end else
    Node.SelectedIndex := 2;
end;

procedure InitializeWizard();
var
  MyTreeNode1, MyTreeNode2: TTreeNode;
  ImgList: TImageList;
  bmp: TBitmap;
  bmpStream: TFileStream;
begin
  WizardForm.WelcomeLabel1.Caption := 'TTreeView';

  TreeView1 := TTreeView.Create(WizardForm);
  TreeView1.Parent := WizardForm.WelcomePage;
//  TreeView1.BorderStyle := bsNone;
  
  TreeView1.SetBounds(WizardForm.WizardBitmapImage.Width + 4, 40,  WizardForm.WelcomePage.Width - WizardForm.WizardBitmapImage.Width - 8, WizardForm.WelcomePage.Height - 44);
  
  ImgList := TImageList.Create(WizardForm);
  ExtractTemporaryFile('img.bmp');
  bmp := TBitmap.Create;
  try
    bmpStream := TFileStream.Create(ExpandConstant('{tmp}\img.bmp'), fmOpenRead or fmShareDenyNone);
    // ���ļ��������ļ�����Ч��ֹ�����ļ���ʱռ�ø��ļ������翨��˹���ļ�ʱ�鶾�п���ռ���ļ����³���
    try
      bmp.LoadFromStream(bmpStream);
      ImgList.AddMasked(bmp, clFuchsia);
      // һ��ʹ���Ϻ�ɫΪ����ɫ����������û��������ɫ���д�����Ϊ�ǰ�ɫ����������ͼƬҲ���˰�ɫ������
    finally
      bmpStream.Free;
    end;
  finally
    bmp.Free;
  end;
  
  TreeView1.Images := ImgList;

  TreeView1.OnGetImageIndex := @TreeView1OnGetImageIndex;
  TreeView1.OnGetSelectedIndex := @TreeView1OnGetSelectedIndex;
  TreeView1.OnMouseUp := @TreeView1OnMouseUp;
  TreeView1.ReadOnly := True;
  
  with TreeView1.Items do
  begin

    {Adds a root node}
    Add(TreeView1.Selected, 'RootTreeNode1');

    {Sets MyTreeNode to first node in}
    {tree view and adds a child node to it}
    MyTreeNode1 := TreeView1.Items[0];
    AddChild(MyTreeNode1,'ChildNode1');

    {Adds a root node}
    Add(TreeView1.Selected, 'RootTreeNode2');

    {Sets MyTreeNode to third node in}
    {tree view and adds a child node to it}
    MyTreeNode2:=TreeView1.items[2];
    AddChild(MyTreeNode2,'ChildNode2');

    {Sets MyTreeNode to fourth node in}
    {tree view and adds a child node to it}
    MyTreeNode2:=TreeView1.items[3];
    AddChild(MyTreeNode2,'ChildNode2a');

    {Sets MyTreeNode to fifth node in}
    {tree view and adds a child node to it}

    MyTreeNode2:=TreeView1.items[4];
    Add(MyTreeNode2,'ChildNode2b');

    {add another root node}
    Add(TreeView1.Selected, 'RootTreeNode3');
  end;
  
  TreeView1.FullExpand;
end;

