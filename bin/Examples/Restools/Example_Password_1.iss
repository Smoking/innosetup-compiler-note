; ��ʾ��η�ֹ ͨ�ý������Update: 2008-12-07
; �ű�: restools ( http://restools.hanzify.org )

; ������޸İ汾�ڱ���ű��������е�ʱ����������������.

;build 081207
;1. �޸� GetPassword ���塣
;     function GetPassword(PrePassword: String): String;
;2. ���� 1 ���������ú��� SetPassword������ʹ�÷������Բο����ӡ�
;     procedure SetPassword(const Password: String);

#ifndef IS_ENHANCED
  #error Enhanced edition of Inno Setup (restools) is required to compile this script
#endif

[Setup]
AppName=My Application
AppVersion=1.5
DefaultDirName={pf}\My Application
DefaultGroupName=My Application
UninstallDisplayIcon={app}\MyProg.exe
SolidCompression=yes
Compression=lzma/ultra
Password=123456abcdef
UsePreviousTasks=yes
Encryption=true
OutputDir=userdocs:Inno Setup Examples Output

[Types]
Name: "full"; Description: "full"
Name: "compact"; Description: "compact"
Name: "custom"; Description: "custom"; Flags: iscustom

[Components]
Name: "program"; Description: "app files"; Types: full compact custom; Flags: fixed
Name: "help"; Description: "help files"; Types: full
Name: "readme"; Description: "readme files"; Types: full

[Files]
Source: "MyProg.exe"; DestDir: "{app}"; Components: program
Source: "MyProg1.chm"; DestDir: "{app}"; Components: help
Source: "Readme1.txt"; DestDir: "{app}"; Components: readme; Flags: isreadme

[Icons]
Name: "{group}\my application"; Filename: "{app}\MyProg.exe"

[code]
Var
  P1, P2: Integer;
  
function CheckPassword(Password: String): Boolean;
begin
// ���������Ƿ���ȷ��Ҫ�ر� password ҳ�档
// ��Ϊ���ǲ���Ҫ���ҳ�����ṩ��ȷ���롣
  Result := True;
end;
  
// ������һ�� Inno Setup �ڲ�֧�ֺ���, GetPassword,
// �����ֽű����д˺���ʱ�������ṩ��ȷ������ʱ, �����Զ����� password ҳ��
// ���� PrePassword ����һ���ṩ�����룬������Ҫ������������ʱ�����������������Բ���������������ֱ���ṩ��ȷ������Ϳ����ˡ�
function GetPassword(PrevPassword: String): String;
begin
// P1 �ĸ�ֵ�������κνű��ĺ����н��У���ȷ���ű�����������İ�װ������������ȡ���롣����κηǱ���װ���������˽ű�����Ϊδ֪ P1 ��ֵ��ֱ��ͨ���ⲿ�������иú����ǲ��ܳɹ������ȷ����ġ�
  if (P1 = 5) and (P2 = 6) then
  begin
    Result := chr(ord('2')-1);
    Result := Result + chr(ord('3')-1);
    Result := Result + chr(ord('4')-1);
    Result := Result + chr(ord('5')-1);
    Result := Result + chr(ord('6')-1);
    Result := Result + chr(ord('7')-1);
  end else
  if (P1 = 5) and (P2 = 9) then
  begin
// ȡǰ 6 λ��������룬��Ϊ������һ���ṩ�İ����ȷ���롣�������������ȷ�ĺ������롣
    Result := Copy(PrevPassword, 1, 6) + chr(ord('b')-1);
    Result := Result + chr(ord('c')-1);
    Result := Result + chr(ord('d')-1);
    Result := Result + chr(ord('e')-1);
    Result := Result + chr(ord('f')-1);
    Result := Result + chr(ord('g')-1);
  end else
    Result := PrevPassword + 'FakePassword'; // ����δ����Ҫ���һ�ɷ��ؼ����롣
    
// P2 �� GetPassword �ڲ����ӣ������������˵� GetPassword ���� 7 �κ͵� 10 �ε��ú� 2 �κϲ��ͻ�����ȷ���롣
  P2 := P2 + 1;
  
// ����Ĵ��������Ը�⣬�������ø����ӣ������������������ڴ��д��۸��ӣ����������Զ���ȡ��
// ���´��������鿴һ�������ṩ�������
//  MsgBox(PrePassword+' , '+Result, mbInformation, MB_OK);
end;
                             
procedure InitializeWizard();
begin
// P1 �ŵ� InitializeWizard ��ֵ����ʾ�˽ű�����ͬʱ������ InitializeWizard ���ܹ���ȡ��ȷ���롣
// ������ڰ�װ�����ļ�֮ǰ���е��κκ��������ж�㸳ֵ���������������ṩ����(GetPassword)���Ա鼰������װ����ű����޷������������������һ���ֺ������롣
  P1 := 5;

// ��������λ�����ȷ�����أ����ļ������ͷŵ�ʱ�򣬻��� 10 �λ�ȡ��ȷ����Ļ��ᣬֻҪ�� 10 ��֮���ṩ��ȷ�����루GetPassword �ᱻ���� 10 �Σ���������Ȼ�ᱻ��ȷ��װ��
// ��Ǳ�Ҫ���벻Ҫֱ���� SetPassword ���ṩ���룬�������� GetPassword ���ڰ�װ�ļ�ʱ�Զ���ȡ����Ϊ�����������������Ĵ��벢������Ч��ֹ�����ȡ����������İ�װ�����ļ���Ҫ��������װһ�Ρ�

// ��ô��������ҪдЩʲô�����أ���Ϊ�����˰�װ�ļ�ǰ���ṩ��ȷ���룬�����κγ������ȡ����ͱ���������İ�װ���򵽿�ʼ��װ�ļ���һ����������Ϊֹ���㹻�Ľű�����ʱ����㷢���������������ֹ�κ��������������ȡ��Ϊ��
// 1. ѡ���Զ��˳���װ����
// 2. ѡ���ṩһ�������룬���°�װ�����ܰ�װ��
// 3. ѡ����ֹ���ӳ���������ȡ�������飬��Ϊ�������Ѷȣ����ʺ���ͨ�û�ʵ�֣�
// ��ⷽ���кܶ��֣����̲鿴�����ڼ��ȵȣ���֮���뵽ʲô������ʲô�����������ű������ɵġ�
// ...... ����ķ�ֹ�ű��������Լ����Ӱɡ���ֻ�ṩһ����ſ�ܡ�
end;
