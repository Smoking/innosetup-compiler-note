; Inno Setup ���滻ж�س���ͼ��Ĳ��������
; ��д: zhfi @ http://hi.baidu.com/zhfi1022/
; �ر��л: ����ҹ˼��, Restools !

;ע��: �滻ж�س����ͼ�꣬��������ж�س�������֮ǰ��
;���鰲װͼ����ж��ͼ��ĸ�ʽ���Сһ�£�������ܻᵼ��ж�س������
;Ҫ�滻ͼ���exe�ļ�·���������գ��������Զ��滻��Innoж�س����ͼ�꣡

[Setup]
; ע��: AppId ��ֵ��Ψһʶ���������ı�־��
; ��Ҫ������������ʹ����ͬ�� AppId ֵ��
; (�ڱ������е���˵������� -> ���� GUID�����Բ���һ���µ� GUID)
AppId={{DC1559D2-A4CC-471F-8FDF-45F4278AFAEA}
AppName=Inno Setup ���滻ж�س���ͼ�������
AppVerName=�ҵĳ��� 1.5
AppPublisher=�ҵĹ�˾
AppPublisherURL=http://www.example.com/
AppSupportURL=http://www.example.com/
AppUpdatesURL=http://www.example.com/
DefaultDirName=.\Uninst
DefaultGroupName=�ҵĳ���
OutputBaseFilename=setup
Compression=lzma
SolidCompression=yes
SetupIconFile=Setup.ico
OutputDir=userdocs:Inno Setup Examples Output

[Languages]
Name: "chinese"; MessagesFile: "compiler:Default.isl"

[Files]
; NOTE: Don't use "Flags: ignoreversion" on any shared system files
;ͼ��
Source: "uninst.ico"; Flags: solidbreak dontcopy
;���
Source: "{#PluginDir}\UpdateIcon.dll"; Flags: solidbreak dontcopy

[code]
//����÷���
//ͨ�õ�PEͼ���滻���� UpdateIcon �÷�:
//����: ���(�������Ի���ĸ����), exe�ļ�����·������, (exe�ļ���Ҫ�滻��)ͼ����Դ����, ͼ���ļ�������·������, (exe��Ҫ�滻��ͼ����Դ����)��ϵ
//����ֵ: �ɹ� = True, ʧ�� = False
function UpdateIcon(const hWnd: Integer; const exeFileName, exeIcon, IcoFileName: String; wlangID: DWORD): Boolean;
external 'UpdateIcon@files:UpdateIcon.dll stdcall';

//������2������Ϊ�滻Inno��ж��ͼ��ר��:
//�滻ͼ�꣬�ú���������ж�س�������֮ǰ����
function BeginUpdateUninstIcon(const IcoFileName: String): Boolean;
external 'BeginUpdateUninstIcon@files:UpdateIcon.dll stdcall';
//�����滻, �ú���������ж�س�������֮�����
function FinishUpdateUninstIcon: Boolean;
external 'FinishUpdateUninstIcon@files:UpdateIcon.dll stdcall';

procedure CurStepChanged(CurStep: TSetupStep);
var
  sIcon: String;
begin
//ע��: �滻ж�س����ͼ�꣬��������ж�س�������֮ǰ��
//���鰲װͼ����ж��ͼ��ĸ�ʽ���Сһ�£�������ܻᵼ��ж�س������
  if CurStep=ssInstall then
  begin
    sIcon:= ExpandConstant('{tmp}\uninst.ico'); //����ж��ͼ��
//  ExtractTemporaryFile('UpdateIcon.dll');
    ExtractTemporaryFile(ExtractFileName(sIcon)); //�ͷ�ж��ͼ��
//�滻ж�س����ͼ��, �ú���������ж�س�������֮ǰ����
    if BeginUpdateUninstIcon(sIcon) then  //�滻ж��ͼ��
      MsgBox('ж�س���ͼ�� �滻�ɹ���', mbInformation, MB_OK)
    else MsgBox('ж�س���ͼ�� �滻ʧ�ܣ�', mbError, MB_OK);
  end
  else if CurStep=ssPostInstall then
  begin
//�滻���, �ú���������ж�س�������֮�����
    FinishUpdateUninstIcon;  //�����滻
  end;
end;
