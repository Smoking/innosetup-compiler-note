;��������ʾ���� WLDNA ��д���ɣ�����ת�أ��뱣����˵����лл
;Auther: WLDNA
;WebSite: http://blog.csdn.net/WLDNA
;��ӭ���Ƹ��ֹ���/�����д��ͨ�ýű����ơ���

#include "istask.ish"

[Setup]
AppName=My Program
AppVerName=My Program v 1.5
DefaultDirName={pf}\My Program
OutputDir=userdocs:Inno Setup Examples Output
Compression=lzma/ultra
InternalCompressLevel=ultra
;SolidCompression=yes
;DisableDirPage=yes
;DisableReadyPage=yes

[CustomMessages]
Tasks=QQ.exe%ncmd.exe%nnotepad.exe

[Code]
function InitializeSetup(): Boolean;
begin
  Result := True;

  if PDir ('ISTask.dll') <> '' then
    if RunTasks(CustomMessage('Tasks'), False, False) then
    begin
      if MsgBox('��⵽ QQ/CMD/NotePad �������У���װ�޷�������' + #13#10 + #13#10 +
        '������ȷ����ֱ�ӹر� QQ/CMD/NotePad�����ߵ�����ȡ�����˳���װ��', mbConfirmation, MB_OKCANCEL) = IDYES then
        begin
          KillTasks(CustomMessage('Tasks'));
          Result := True;
        end
        else
          Result := False;
    end
end;

function InitializeUninstall(): Boolean;
begin
  Result := True;

  if PDir ('ISTask.dll') <> '' then
    if RunTask('QQ.exe', False) then
    begin
      if MsgBox('��⵽QQ�������У���װ�޷�������' + #13#10 + #13#10 +
        '������ȷ����ֱ�ӹر�QQ�����ߵ�����ȡ�����˳���װ��', mbConfirmation, MB_OKCANCEL) = IDYES then
        begin
          KillTask('QQ.exe');
          Result := True;
        end
        else
          Result := False;
    end
end;