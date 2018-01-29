; -- WH_CALLWNDPROC.iss --
; restools
; http://restools.hanzify.org
; WinMsgCtrl.dll Ϊһ������ Inno Setup �� 6 KB �� Windows ��Ϣ��ȡ�����
; ������������ʾ��δ���װ����� Windows Message��

; ���������ʾ���� Mouse Message ��ʹ��.

; Ver 1.2 ������ĳЩ Windows ƽ̨��(���� Windows XP SP3)�����������е����⡣

; �����õĵ����ڵ���״̬�¿��ܸо��е�ٻ�����ֱ���������ɵİ�װ����鿴Ч����

#include "MsgCtrl.ish"

[Setup]
AppName=MyApp
AppVerName=MyApp Ver 1.0
DefaultDirName={pf}\MyApp
DefaultGroupName=MyApp
Compression=lzma
OutputDir=userdocs:Inno Setup Examples Output

[Components]
Name: "Basque"; Description: "Basque"; Types: full compact custom; Flags: fixed
Name: "BrazilianPortuguese"; Description: "BrazilianPortuguese"; Types: full
Name: "Catalan"; Description: "Catalan"; Types: full compact
Name: "Czech"; Description: "Czech"; Types: full
Name: "Danish"; Description: "Danish"; Types: full
Name: "Dutch"; Description: "Dutch"; Types: full
Name: "Finnish"; Description: "Finnish"; Types: full
Name: "French"; Description: "French"; Types: full
Name: "German"; Description: "German"; Types: full
Name: "Hebrew"; Description: "Hebrew"; Types: full
Name: "Hungarian"; Description: "Hungarian"; Types: full
Name: "Italian"; Description: "Italian"; Types: full
Name: "Norwegian"; Description: "Norwegian"; Types: full
Name: "Polish"; Description: "Polish"; Types: full
Name: "Portuguese"; Description: "Portuguese"; Types: full
Name: "Russian"; Description: "Russian"; Types: full
Name: "Slovak"; Description: "Slovak"; Types: full
Name: "Slovenian"; Description: "Slovenian"; Types: full
Name: "Spanish"; Description: "Spanish"; Types: full

[code]
const
  WH_CALLWNDPROC   = 4;
  WM_SYSCOMMAND    = $0112;
  SC_MINIMIZE      = 61472;
  SC_CLOSE         = 61536;

type
  TCWPStruct = record
    lParam:  LongWord;
    wParam:  LongWord;
    message: UINT;
    hwnd:    HWND;
  end;

// �ص�����������ʽ����
//TMessageProc = procedure(nCode: LongWord; wParam: LongWord; lParam: LongWord);
  TMessageProc = procedure(nCode: LongWord; wParam: LongWord; lParam: TCWPStruct);

  {# MsgCtrl_SetWinHookEx }

var
  HandleMark: Boolean;

procedure MyMessageProc(nCode: LongWord; wParam: LongWord; lParam: TCWPStruct);
begin
  if HandleMark then exit;
  if nCode >= 0 then
  try
    HandleMark := True;
    if lParam.message = WM_SYSCOMMAND then
    begin
      case lParam.wParam of
      SC_MINIMIZE: MsgBox('OnMinmize', mbInformation, MB_OK);
      SC_CLOSE: MsgBox('OnClose', mbInformation, MB_OK);
      end;
    end;
  finally
    HandleMark := False;
  end;
end;

procedure InitializeWizard();
begin
  PDir('winmsgctrl.dll');
  HandleMark := False;
  SetWinHookEx(WH_CALLWNDPROC, @MyMessageProc);
end;

procedure DeinitializeSetup();
begin
  UnhookWinHookEx();
end;

