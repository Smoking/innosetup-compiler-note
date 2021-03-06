; -- Example_ISFD.iss --

[Setup]
AppName=My Program
AppVersion=My Program version 1.5
DefaultDirName={pf}\My Program
DefaultGroupName=My Program
UninstallDisplayIcon={app}\MyProg.exe
Compression=lzma
SolidCompression=yes
OutputDir=userdocs:Inno Setup Examples Output

[Files]
;{ ISFormDesignerFilesBegin } // Don't remove this line!
;// Don't modify this section. It is generated automatically.
DestName: "WizardForm.LogoImage.bmp"; Source: "logo.bmp"; Flags: dontcopy solidbreak
;// Don't modify this section. It is generated automatically.
;{ ISFormDesignerFilesEnd } // Don't remove this line!

[ISFormDesigner]
WizardForm=FF0A005457495A415244464F524D003010F013000054504630F10B5457697A617264466F726D0A57697A617264466F726D044C656674020003546F7002000C436C69656E744865696768740368010B436C69656E74576964746803F1010D506978656C73506572496E636802600A54657874486569676874020D00F202010C544269746D6170496D616765094C6F676F496D616765044C656674022003546F70034301055769647468025806486569676874021F06437572736F72070B637248616E64506F696E740448696E74060D7669736974206D7920626C6F670E506172656E7453686F7748696E74080853686F7748696E74090753747265746368090A4269746D617046696C6506086C6F676F2E626D70074F6E436C69636B070E436F6E74726F6C4F6E436C69636B0000F10C544E65774E6F7465626F6F6B0D4F757465724E6F7465626F6F6B00F110544E65774E6F7465626F6F6B506167650B57656C636F6D6550616765084E65787450616765070F4C6963656E7365466F726D506167650000F110544E65774E6F7465626F6F6B5061676509496E6E65725061676500F10C544E65774E6F7465626F6F6B0D496E6E65724E6F7465626F6F6B00F110544E65774E6F7465626F6F6B506167650B4C6963656E7365506167650C50726576696F757350616765070E53616D706C65466F726D50616765000010544E65774E6F7465626F6F6B506167650F4C6963656E7365466F726D506167650743617074696F6E06174C6963656E7365466F726D506167655F43617074696F6E0B4465736372697074696F6E061B4C6963656E7365466F726D506167655F4465736372697074696F6E0C50726576696F757350616765070B57656C636F6D6550616765084E6578745061676507114D756C7469706C654C696E657350616765000F5452696368456469745669657765720F526963684564697456696577657231044C656674020003546F70020005576964746803A1010648656967687403ED0005416C69676E0708616C436C69656E740A5363726F6C6C42617273070A7373566572746963616C085461624F72646572020007525446546578740C980800007B5C727466315C616E73695C616E73696370673933365C64656666307B5C666F6E7474626C7B5C66305C666E696C205461686F6D613B7D7B5C66315C666D6F6465726E5C66707271365C6663686172736574313334205C2763625C2763655C2763635C2765353B7D7B5C66325C666E696C5C666368617273657430205461686F6D613B7D7B5C66335C666D6F6465726E5C66707271365C666368617273657430203F3F3B7D7B5C66345C666E696C5C6663686172736574313334204D6963726F736F66742053616E732053657269663B7D7D0D0A7B5C636F6C6F7274626C203B5C726564305C677265656E305C626C75653235353B5C726564305C677265656E305C626C7565303B5C726564305C677265656E3132385C626C7565303B7D0D0A5C766965776B696E64345C7563315C706172645C6366315C6C616E67313033315C625C66305C6673323620496E6E6F205365747570204C6963656E73655C6366325C62305C667332305C7061720D0A5C636633203D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D5C6366325C7061720D0A457863657074207768657265206F7468657277697365206E6F7465642C20616C6C206F662074686520646F63756D656E746174696F6E20616E6420736F66747761726520696E636C756465645C6C616E67313033335C663120205C6C616E67313033315C663020696E2074686520496E6E6F205365747570207061636B61676520697320636F707972696768746564206279204A6F7264616E2052757373656C6C2E5C7061720D0A436F707972696768742028432920313939372D32305C6C616E67313033335C66322031305C6C616E67313033315C663020205C756C5C62204A6F7264616E2052757373656C6C5C756C6E6F6E655C6230202E20416C6C207269676874732072657365727665642E5C7061720D0A5468697320736F6674776172652069732070726F7669646564202261732D69732C2220776974686F757420616E792065787072657373206F7220696D706C6965642077617272616E74792E5C6C616E67313033335C663120205C6C616E67313033315C663020496E206E6F206576656E74207368616C6C2074686520617574686F722062652068656C64206C6961626C6520666F7220616E792064616D616765732061726973696E672066726F6D207468655C6C616E67323035325C663320205C6C616E67313033315C663020757365206F66207468697320736F6674776172652E5C7061720D0A5065726D697373696F6E206973206772616E74656420746F20616E796F6E6520746F20757365207468697320736F66747761726520666F7220616E7920707572706F73652C5C6C616E67313033335C663120205C6C616E67313033315C663020696E636C7564696E6720636F6D6D65726369616C206170706C69636174696F6E732C20616E6420746F20616C74657220616E64207265646973747269627574652069742C5C6C616E67313033335C663120205C6C616E67313033315C66302070726F766964656420746861742074686520666F6C6C6F77696E6720636F6E646974696F6E7320617265206D65743A5C7061720D0A5C706172647B5C706E746578745C663020312E5C7461627D7B5C2A5C706E5C706E6C766C626F64795C706E66305C706E696E64656E74305C706E7374617274315C706E6465637B5C706E747874612E7D7D0D0A5C66692D3230305C6C6932303020416C6C207265646973747269627574696F6E73206F6620736F7572636520636F64652066696C6573206D7573742072657461696E20616C6C20636F70797269676874206E6F74696365732074686174206172652063757272656E746C7920696E20706C6163652C20616E642074686973206C697374206F6620636F6E646974696F6E7320776974686F7574206D6F64696669636174696F6E2E5C7061720D0A7B5C706E746578745C663020322E5C7461627D416C6C207265646973747269627574696F6E7320696E2062696E61727920666F726D206D7573742072657461696E20616C6C206F6363757272656E636573206F66207468652061626F766520636F70797269676874206E6F7469636520616E64207765622073697465206164647265737365732074686174206172652063757272656E746C7920696E20706C6163652028666F72206578616D706C652C20696E207468652041626F757420626F786573292E5C7061720D0A7B5C706E746578745C663020332E5C7461627D546865206F726967696E206F66207468697320736F667477617265206D757374206E6F74206265206D6973726570726573656E7465643B20796F75206D757374206E6F7420636C61696D207468617420796F752077726F746520746865206F726967696E616C20736F6674776172652E20496620796F7520757365207468697320736F66747761726520746F206469737472696275746520612070726F647563742C20616E2061636B6E6F776C6564676D656E7420696E207468652070726F6475637420646F63756D656E746174696F6E20776F756C6420626520617070726563696174656420627574206973206E6F742072657175697265642E5C7061720D0A7B5C706E746578745C663020342E5C7461627D4D6F6469666965642076657273696F6E7320696E20736F75726365206F722062696E61727920666F726D206D75737420626520706C61696E6C79206D61726B656420617320737563682C20616E64206D757374206E6F74206265206D6973726570726573656E746564206173206265696E6720746865206F726967696E616C20736F6674776172652E5C7061720D0A5C706172645C7061720D0A4A6F7264616E2052757373656C6C5C7061720D0A6A722D32305C6C616E67313033335C66322031305C6C616E67313033315C663020204154206A72736F6674776172652E6F72675C7061720D0A687474703A2F2F7777772E6A72736F6674776172652E6F72672F5C7061720D0A5C6366305C6C616E67323035325C66345C667331365C7061720D0A7D0D0A0B5468656D65426F726465720800000010544E65774E6F7465626F6F6B50616765114D756C7469706C654C696E6573506167650743617074696F6E06194D756C7469706C654C696E6573506167655F43617074696F6E0B4465736372697074696F6E061D4D756C7469706C654C696E6573506167655F4465736372697074696F6E0C50726576696F757350616765070F4C6963656E7365466F726D50616765084E65787450616765070E53616D706C65466F726D506167650006544C6162656C064C6162656C31044C656674020803546F7002080557696474680385000648656967687402340743617074696F6E065F54686973206C6162656C20636F6E7461696E73206D756C7469626C650D0A6C696E657320776869636820617265206372656174656420776974680D0A746865206E6577202743617074696F6E272D70726F70657274790D0A656469746F722100000654426576656C08426576656C315F31044C656674020803546F700248055769647468038901064865696768740202000006544C6162656C064C6162656C32044C656674020803546F700258055769647468037E0106486569676874021A084175746F53697A65080743617074696F6E0660436865636B206F75742C2077686174206B696E64206F6620736F75726365636F646520495346442067656E657261746564206966207573696E672027437573746F6D204D6573736167657327206F7220656D626564646564207465787465732E08576F7264577261700900000E544E6577537461746963546578740E4E65775374617469635465787431044C65667403E80003546F70021005576964746803A40006486569676874021B084175746F53697A650808576F726457726170090743617074696F6E064354686973205374617469632D5465787420636F6E74726F6C20686173206869732070726F70657274792027576F726457726170272073657420746F202774727565272E085461624F72646572020000000010544E65774E6F7465626F6F6B506167650E53616D706C65466F726D506167650743617074696F6E061653616D706C65466F726D506167655F43617074696F6E0B4465736372697074696F6E061A53616D706C65466F726D506167655F4465736372697074696F6E0C50726576696F75735061676507114D756C7469706C654C696E657350616765084E65787450616765070B4C6963656E7365506167650006544C6162656C084C6162656C315F31044C656674021003546F700208055769647468025C06486569676874020D0743617074696F6E06145468697320697320612064656D6F206C6162656C0000065450616E656C0650616E656C31044C656674020803546F7002200557696474680389010648656967687403C1000A426576656C496E6E6572070962764C6F77657265640A426576656C576964746802020B426F726465725374796C650708627353696E676C65085461624F726465720200000754427574746F6E07427574746F6E31044C656674020E03546F70020E055769647468024B0648656967687402170743617074696F6E0607427574746F6E31085461624F726465720200074F6E436C69636B070E436F6E74726F6C4F6E436C69636B00000754427574746F6E07427574746F6E32044C656674025E03546F70020E055769647468024B0648656967687402170743617074696F6E0607427574746F6E32085461624F726465720201074F6E436C69636B070E436F6E74726F6C4F6E436C69636B000008544C697374426F78084C697374426F7831044C656674020E03546F70022E055769647468039900064865696768740381000A4974656D486569676874020D0D4974656D732E537472696E67730106054C696E653106054C696E653206054C696E653306054C696E653406054C696E653500085461624F726465720202094974656D496E64657802FF00000F544E657750726F67726573734261720F4E657750726F677265737342617231044C65667403AE0003546F70039E0005576964746803CE0006486569676874021108506F736974696F6E023200000954436865636B426F7809436865636B426F7831044C65667403B60003546F70020E05576964746802610648656967687402110743617074696F6E0609436865636B426F7831085461624F726465720203074F6E436C69636B070E436F6E74726F6C4F6E436C69636B00000954436865636B426F7809436865636B426F7832044C65667403B60003546F70022605576964746802610648656967687402110743617074696F6E0609436865636B426F7832085461624F726465720204074F6E436C69636B070E436F6E74726F6C4F6E436C69636B00000954436865636B426F7809436865636B426F7833044C65667403B60003546F70023E05576964746802610648656967687402110743617074696F6E0609436865636B426F7833085461624F726465720205074F6E436C69636B070E436F6E74726F6C4F6E436C69636B0000065450616E656C0650616E656C32044C65667403AE0003546F70025805576964746803CD0006486569676874023B0743617074696F6E060120085461624F726465720206000C54526164696F427574746F6E0C526164696F427574746F6E31044C656674021003546F70020805576964746802710648656967687402110743617074696F6E060C526164696F427574746F6E31085461624F726465720200074F6E436C69636B070E436F6E74726F6C4F6E436C69636B00000C54526164696F427574746F6E0C526164696F427574746F6E32044C656674021003546F70022005576964746802710648656967687402110743617074696F6E060C526164696F427574746F6E32085461624F726465720201074F6E436C69636B070E436F6E74726F6C4F6E436C69636B000000000000000000

[Code]
{ RedesignWizardFormBegin } // Don't remove this line!
// Don't modify this section. It is generated automatically.
var
  LogoImage: TBitmapImage;
  LicenseFormPage: TWizardPage;
  RichEditViewer1: TRichEditViewer;
  MultipleLinesPage: TWizardPage;
  Label1: TLabel;
  Bevel1_1: TBevel;
  Label2: TLabel;
  NewStaticText1: TNewStaticText;
  SampleFormPage: TWizardPage;
  Label1_1: TLabel;
  Panel1: TPanel;
  Button1: TButton;
  Button2: TButton;
  ListBox1: TListBox;
  NewProgressBar1: TNewProgressBar;
  CheckBox1: TCheckBox;
  CheckBox2: TCheckBox;
  CheckBox3: TCheckBox;
  Panel2: TPanel;
  RadioButton1: TRadioButton;
  RadioButton2: TRadioButton;

procedure ControlOnClick(Sender: TObject); forward;

procedure RedesignWizardForm;
begin
  { Creates custom wizard page }
  LicenseFormPage := CreateCustomPage(wpWelcome, 'LicenseFormPage_Caption', 'LicenseFormPage_Description');
  MultipleLinesPage := CreateCustomPage(LicenseFormPage.ID, 'MultipleLinesPage_Caption', 'MultipleLinesPage_Description');
  SampleFormPage := CreateCustomPage(MultipleLinesPage.ID, 'SampleFormPage_Caption', 'SampleFormPage_Description');

  { LogoImage }
  LogoImage := TBitmapImage.Create(WizardForm);
  with LogoImage do
  begin
    Name := 'LogoImage';
    Parent := WizardForm;
    Left := ScaleX(32);
    Top := ScaleY(323);
    Width := ScaleX(88);
    Height := ScaleY(31);
    Cursor := crHand;
    Hint := 'visit my blog';
    ShowHint := True;
    Stretch := True;
    ExtractTemporaryFile('WizardForm.LogoImage.bmp');
    Bitmap.LoadFromFile(ExpandConstant('{tmp}\WizardForm.LogoImage.bmp'));
    OnClick := @ControlOnClick;
  end;

  { LicenseFormPage }
  with LicenseFormPage.Surface do
  begin
    Name := 'LicenseFormPage';
  end;

  { RichEditViewer1 }
  RichEditViewer1 := TRichEditViewer.Create(WizardForm);
  with RichEditViewer1 do
  begin
    Name := 'RichEditViewer1';
    Parent := LicenseFormPage.Surface;
    Left := ScaleX(0);
    Top := ScaleY(0);
    Width := ScaleX(417);
    Height := ScaleY(237);
    Align := alClient;
    ScrollBars := ssVertical;
    RTFText := '{\rtf1\ansi\ansicpg936\deff0{\fonttbl{\f0\fnil Tahoma;}{\f1\fmodern\fprq6\fcharset134 \''cb\''ce\''cc\''e5;}{\f2\fnil\fcharset0 Tahoma;}{\f3\fmodern\fprq6\fcharset0 ??;}{\f4\fnil\fcharset134 Microsoft Sans Serif;}}' + #13#10 +
         '{\colortbl ;\red0\green0\blue255;\red0\green0\blue0;\red0\green128\blue0;}' + #13#10 +
         '\viewkind4\uc1\pard\cf1\lang1031\b\f0\fs26 Inno Setup License\cf2\b0\fs20\par' + #13#10 +
         '\cf3 ==================\cf2\par' + #13#10 +
         'Except where otherwise noted, all of the documentation and software included\lang1033\f1  \lang1031\f0 in the Inno Setup package is copyrighted by Jordan Russell.\par' + #13#10 +
         'Copyright (C) 1997-20\lang1033\f2 10\lang1031\f0  \ul\b Jordan Russell\ulnone\b0 . All rights reserved.\par' + #13#10 +
         'This software is provided "as-is," without any express or implied warranty.\lang1033\f1  \lang1031\f0 In no event shall the author be held liable for any damages arising from the\lang2052\f3  \lang1031\f0 use of this software.\par' + #13#10 +
         'Permission is granted to anyone to use this software for any purpose,\lang1033\f1  \lang1031\f0 including commercial applications, and to alter and redistribute it,\lang1033\f1  \lang1031\f0 provided that the following conditions are met:\par' + #13#10 +
         '\pard{\pntext\f0 1.\tab}{\*\pn\pnlvlbody\pnf0\pnindent0\pnstart1\pndec{\pntxta.}}' + #13#10 +
         '\fi-200\li200 All redistributions of source code files must retain all copyright notices that are currently in place, and this list of conditions without modification.\par' + #13#10 +
         '{\pntext\f0 2.\tab}All redistributions in binary form must retain all occurrences of the above copyright notice and web site addresses that are currently in place (for example, in the About boxes).\par' + #13#10 +
         '{\pntext\f0 3.\tab}The origin of this software must not be misrepresented; you must not claim that you wrote the original software. If you use this software to distribute a product, an acknowledgment in the product documentation would be appreciated but is not required.\par' + #13#10 +
         '{\pntext\f0 4.\tab}Modified versions in source or binary form must be plainly marked as such, and must not be misrepresented as being the original software.\par' + #13#10 +
         '\pard\par' + #13#10 +
         'Jordan Russell\par' + #13#10 +
         'jr-20\lang1033\f2 10\lang1031\f0  AT jrsoftware.org\par' + #13#10 +
         'http://www.jrsoftware.org/\par' + #13#10 +
         '\cf0\lang2052\f4\fs16\par' + #13#10 +
         '}' + #13#10 +
         '';
  end;

  RichEditViewer1.TabOrder := 0;

  { MultipleLinesPage }
  with MultipleLinesPage.Surface do
  begin
    Name := 'MultipleLinesPage';
  end;

  { Label1 }
  Label1 := TLabel.Create(WizardForm);
  with Label1 do
  begin
    Name := 'Label1';
    Parent := MultipleLinesPage.Surface;
    Caption := 'This label contains multible' + #13#10 +
         'lines which are created with' + #13#10 +
         'the new ''Caption''-property' + #13#10 +
         'editor!';
    Left := ScaleX(8);
    Top := ScaleY(8);
    Width := ScaleX(133);
    Height := ScaleY(52);
  end;

  { Bevel1_1 }
  Bevel1_1 := TBevel.Create(WizardForm);
  with Bevel1_1 do
  begin
    Name := 'Bevel1_1';
    Parent := MultipleLinesPage.Surface;
    Left := ScaleX(8);
    Top := ScaleY(72);
    Width := ScaleX(393);
    Height := ScaleY(2);
  end;

  { Label2 }
  Label2 := TLabel.Create(WizardForm);
  with Label2 do
  begin
    Name := 'Label2';
    Parent := MultipleLinesPage.Surface;
    AutoSize := False;
    Caption := 'Check out, what kind of sourcecode ISFD generated if using ''Custom Messages'' or embedded textes.';
    WordWrap := True;
    Left := ScaleX(8);
    Top := ScaleY(88);
    Width := ScaleX(382);
    Height := ScaleY(26);
  end;

  { NewStaticText1 }
  NewStaticText1 := TNewStaticText.Create(WizardForm);
  with NewStaticText1 do
  begin
    Name := 'NewStaticText1';
    Parent := MultipleLinesPage.Surface;
    AutoSize := False;
    WordWrap := True;
    Caption := 'This Static-Text control has his property ''WordWrap'' set to ''true''.';
    Left := ScaleX(232);
    Top := ScaleY(16);
    Width := ScaleX(164);
    Height := ScaleY(27);
  end;

  NewStaticText1.TabOrder := 0;

  { SampleFormPage }
  with SampleFormPage.Surface do
  begin
    Name := 'SampleFormPage';
  end;

  { Label1_1 }
  Label1_1 := TLabel.Create(WizardForm);
  with Label1_1 do
  begin
    Name := 'Label1_1';
    Parent := SampleFormPage.Surface;
    Caption := 'This is a demo label';
    Left := ScaleX(16);
    Top := ScaleY(8);
    Width := ScaleX(92);
    Height := ScaleY(13);
  end;

  { Panel1 }
  Panel1 := TPanel.Create(WizardForm);
  with Panel1 do
  begin
    Name := 'Panel1';
    Parent := SampleFormPage.Surface;
    Left := ScaleX(8);
    Top := ScaleY(32);
    Width := ScaleX(393);
    Height := ScaleY(193);
    BevelInner := bvLowered;
    BevelWidth := 2;
    BorderStyle := bsSingle;
    Caption := '';
  end;

  { Button1 }
  Button1 := TButton.Create(WizardForm);
  with Button1 do
  begin
    Name := 'Button1';
    Parent := Panel1;
    Left := ScaleX(14);
    Top := ScaleY(14);
    Width := ScaleX(75);
    Height := ScaleY(23);
    OnClick := @ControlOnClick;
  end;

  { Button2 }
  Button2 := TButton.Create(WizardForm);
  with Button2 do
  begin
    Name := 'Button2';
    Parent := Panel1;
    Left := ScaleX(94);
    Top := ScaleY(14);
    Width := ScaleX(75);
    Height := ScaleY(23);
    OnClick := @ControlOnClick;
  end;

  { ListBox1 }
  ListBox1 := TListBox.Create(WizardForm);
  with ListBox1 do
  begin
    Name := 'ListBox1';
    Parent := Panel1;
    Left := ScaleX(14);
    Top := ScaleY(46);
    Width := ScaleX(153);
    Height := ScaleY(129);
    Items.Text := 'Line1' + #13#10 +
         'Line2' + #13#10 +
         'Line3' + #13#10 +
         'Line4' + #13#10 +
         'Line5';
    ItemIndex := -1;
  end;

  { NewProgressBar1 }
  NewProgressBar1 := TNewProgressBar.Create(WizardForm);
  with NewProgressBar1 do
  begin
    Name := 'NewProgressBar1';
    Parent := Panel1;
    Left := ScaleX(174);
    Top := ScaleY(158);
    Width := ScaleX(206);
    Height := ScaleY(17);
    Position := 50;
  end;

  { CheckBox1 }
  CheckBox1 := TCheckBox.Create(WizardForm);
  with CheckBox1 do
  begin
    Name := 'CheckBox1';
    Parent := Panel1;
    Left := ScaleX(182);
    Top := ScaleY(14);
    Width := ScaleX(97);
    Height := ScaleY(17);
    OnClick := @ControlOnClick;
  end;

  { CheckBox2 }
  CheckBox2 := TCheckBox.Create(WizardForm);
  with CheckBox2 do
  begin
    Name := 'CheckBox2';
    Parent := Panel1;
    Left := ScaleX(182);
    Top := ScaleY(38);
    Width := ScaleX(97);
    Height := ScaleY(17);
    OnClick := @ControlOnClick;
  end;

  { CheckBox3 }
  CheckBox3 := TCheckBox.Create(WizardForm);
  with CheckBox3 do
  begin
    Name := 'CheckBox3';
    Parent := Panel1;
    Left := ScaleX(182);
    Top := ScaleY(62);
    Width := ScaleX(97);
    Height := ScaleY(17);
    OnClick := @ControlOnClick;
  end;

  { Panel2 }
  Panel2 := TPanel.Create(WizardForm);
  with Panel2 do
  begin
    Name := 'Panel2';
    Parent := Panel1;
    Left := ScaleX(174);
    Top := ScaleY(88);
    Width := ScaleX(205);
    Height := ScaleY(59);
    Caption := ' ';
  end;

  { RadioButton1 }
  RadioButton1 := TRadioButton.Create(WizardForm);
  with RadioButton1 do
  begin
    Name := 'RadioButton1';
    Parent := Panel2;
    Left := ScaleX(16);
    Top := ScaleY(8);
    Width := ScaleX(113);
    Height := ScaleY(17);
    OnClick := @ControlOnClick;
  end;

  { RadioButton2 }
  RadioButton2 := TRadioButton.Create(WizardForm);
  with RadioButton2 do
  begin
    Name := 'RadioButton2';
    Parent := Panel2;
    Left := ScaleX(16);
    Top := ScaleY(32);
    Width := ScaleX(113);
    Height := ScaleY(17);
    OnClick := @ControlOnClick;
  end;

  RadioButton1.TabOrder := 0;
  RadioButton2.TabOrder := 1;

  Button1.TabOrder := 0;
  Button2.TabOrder := 1;
  ListBox1.TabOrder := 2;
  CheckBox1.TabOrder := 3;
  CheckBox2.TabOrder := 4;
  CheckBox3.TabOrder := 5;
  Panel2.TabOrder := 6;
  NewProgressBar1.TabOrder := 7;

  Panel1.TabOrder := 0;

{ ReservationBegin }
  // This part is for you. Add your specialized code here.

{ ReservationEnd }
end;
// Don't modify this section. It is generated automatically.
{ RedesignWizardFormEnd } // Don't remove this line!

procedure ControlOnClick(Sender: TObject);
var
  ControlName: String;
  ErrCode: Integer;
begin
  if Sender = Button1 then
    ControlName := 'Button1'
  else if Sender = Button2 then
    ControlName := 'Button2'
  else if Sender = CheckBox1 then
    ControlName := 'CheckBox1'
  else if Sender = CheckBox2 then
    ControlName := 'CheckBox2'
  else if Sender = CheckBox3 then
    ControlName := 'CheckBox3'
  else if Sender = RadioButton1 then
    ControlName := 'RadioButton1'
  else if Sender = RadioButton2 then
    ControlName := 'RadioButton2'
  else if Sender = LogoImage then
    ShellExec('open', 'http://restools.hanzify.org','','', SW_SHOW, ewNoWait, ErrCode);

  if Sender <> LogoImage then
    MsgBox(ControlName + ' OnClick', mbInformation, MB_OK);
end;                               

procedure InitializeWizard();
begin
  RedesignWizardForm;
end;


