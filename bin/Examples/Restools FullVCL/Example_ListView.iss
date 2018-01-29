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
Source: "img_small.bmp"; Flags: dontcopy

[code]
type
  TNames = record
    Last: string;
    First: string;
  end;

var
  ListView: TListView;
  Names: array[0..5] of TNames;

procedure ListViewOnDblClick(Sender: TObject);
begin
  if Assigned(ListView.Selected) then
    MsgBox(ListView.Selected.Caption, mbInformation, MB_OK);
end;

procedure InitializeWizard();
var
  I: Integer;
  NewColumn: TListColumn;
  ListItem: TListItem;

  ImgList: TImageList;
  bmp: TBitmap;
  bmpStream: TFileStream;
begin
  Names[0].Last := 'Rubble';
  Names[0].First := 'Barney';
  Names[1].Last := 'Michael';
  Names[1].First := 'Johnson';
  Names[2].Last := 'Bunny';
  Names[2].First := 'Bugs';
  Names[3].Last := 'Silver';
  Names[3].First := 'HiHo';
  Names[4].Last := 'Simpson';
  Names[4].First := 'Bart';
  Names[5].Last := 'Squirrel';
  Names[5].First := 'Rocky';

  WizardForm.WelcomeLabel1.Caption := 'TListView';

  ListView := TListView.Create(WizardForm);
  ListView.Parent := WizardForm.WelcomePage;
  ListView.ViewStyle := vsReport;

//  ListView.BorderStyle := bsNone;
  
  ListView.SetBounds(WizardForm.WizardBitmapImage.Width + 4, 40,  WizardForm.WelcomePage.Width - WizardForm.WizardBitmapImage.Width - 8, WizardForm.WelcomePage.Height - 44);
  
  ImgList := TImageList.Create(WizardForm);
  ExtractTemporaryFile('img_small.bmp');
  bmp := TBitmap.Create;
  try
    bmpStream := TFileStream.Create(ExpandConstant('{tmp}\img_small.bmp'), fmOpenRead or fmShareDenyNone);
    // ���ļ��������ļ�����Ч��ֹ����������ʱռ�ø��ļ������翨��˹���ļ�ʱ�鶾�п���ռ���ļ����³���
    try
      bmp.LoadFromStream(bmpStream);
      ImgList.AddMasked(bmp, clFuchsia);
      // һ��ʹ���Ϻ�ɫΪ����ɫ��
    finally
      bmpStream.Free;
    end;
  finally
    bmp.Free;
  end;

  with ListView do
  begin
    OnDblClick := @ListViewOnDblClick;
    SmallImages := ImgList;
    NewColumn := Columns.Add;
    NewColumn.Caption := 'Last';
    NewColumn.Width := 80;
    NewColumn := Columns.Add;
    NewColumn.Caption := 'First';
    NewColumn.Width := 100;
    for I := 0 to 5 do
    begin
      ListItem := Items.Add;
      ListItem.ImageIndex := I;
      ListItem.Caption := Names[I].Last;
      ListItem.SubItems.Add(Names[I].First);
    end;
  end;

end;
