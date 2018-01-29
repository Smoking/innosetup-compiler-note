; ��ʾ���ʹ��Setup���� IconResource.
; �ű�: restools ( http://restools.hanzify.org )

; �ò�����Ҫ����װ������� Raw Data ��Դ, ��������Ҫ����Ϊж�س������������ļ���Դ.
; ��Ϊж�س����ǲ���ѹ���ļ���. ���������ж�س���Ҳ��һ���������ļ�, ֻ������Դ��ʽΪж�س����ṩ������ļ���Դ.

#ifdef IS_ENHANCED
  #if (Pos('ee', IS_Ver_Str) >= 1)
    #define IS_Version_ee
  #endif
#else
  #error Enhanced edition of Inno Setup (restools) is required to compile this script
#endif

#ifdef UNICODE
  #define A "W"
#else
  #define A "A"
#endif

[Setup]
AppName=My Program
AppVersion=1.5
DefaultDirName={pf}\My Program
DefaultGroupName=My Program
UninstallDisplayIcon={app}\MyProg.exe
SolidCompression=yes
Compression=lzma/ultra
OutputDir=userdocs:Inno Setup Examples Output
RawDataResource=MyFile1:readme1.txt|MyFile2:readme2.txt|MyCursor:cursor.ani
; RawDataResource ��ʽ:
; RDResName1:RDFileName1|RDResName2:RDFileName2|RDResName3:RDFileName3|......
; ע��: Raw Data ��Դд�밲װ�����, ���Զ��� RCDATA ��Դ����ǰ�����ǰ׺ "_IS_"
; ������ʹ�� TResourceStream.Create �ȵȺ�����ʱ��Ҳ��Ҫ��ͼ����Դ����ǰ����� "_IS_"
; ����: TResourceStream.Create(HInstance, '_IS_MYFILE1', RT_RCDATA);

; HInstance ����ǿ����Ҳ��ͬʱ�ṩ, �������ð�װ�����������Դ.

; ���µ�������Ȼ���ڰ�װ��������ʾ, ������Ҳͬ��������ж�س���.

[Code]
#ifdef IS_Version_ee
function LoadCursorFromFile(FileName: String): Cardinal; external 'LoadCursorFromFile{#A}@user32 stdcall';
function DeleteObject(p1: Longword): BOOL; external 'DeleteObject@gdi32.dll stdcall';

const
  MyCursor = 101;
#endif

const
  RT_RCDATA = 10;
var
  hcur: Cardinal;
  
procedure InitializeWizard();
var
  ResStream: TResourceStream;
  ISCustomPage: TWizardPage;
begin          
#ifdef IS_Version_ee
  ResStream := TResourceStream.Create(HInstance, '_IS_MYCURSOR', RT_RCDATA);
  try
    ResStream.SaveToFile(ExpandConstant('{tmp}\cursor.ani'));
    hcur := LoadCursorFromFile(ExpandConstant('{tmp}\cursor.ani'));
    Screen.Cursors[MyCursor] := hcur;
  finally
    ResStream.Free;
  end;
#endif

  ISCustomPage := CreateCustomPage(wpWelcome, 'Load from RCDATA resource', 'readme1.txt and readme2.txt');

  with TNewMemo.Create(WizardForm) do
  begin
    Parent := ISCustomPage.Surface;
    SetBounds(ScaleX(0), ScaleY(0), ScaleX(417), ScaleY(113));
#ifdef IS_Version_ee
    Cursor := MyCursor;
#endif
    ResStream := TResourceStream.Create(HInstance, '_IS_MYFILE1', RT_RCDATA);
    try
      Lines.LoadFromStream(ResStream);
    finally
      ResStream.Free;
    end;
  end;

  with TNewMemo.Create(WizardForm) do
  begin
    Parent := ISCustomPage.Surface;
    SetBounds(ScaleX(0), ScaleY(124), ScaleX(417), ScaleY(113));
#ifdef IS_Version_ee
    Cursor := MyCursor;
#endif
    ResStream := TResourceStream.Create(HInstance, '_IS_MYFILE2', RT_RCDATA);
    try
      Lines.LoadFromStream(ResStream);
    finally
      ResStream.Free;
    end;
  end;

  WizardForm.WelcomeLabel2.Height := ScaleY(100);
end;

procedure DeinitializeSetup();
begin
#ifdef IS_Version_ee
  DeleteObject(hcur);
#endif
end;






