Ish ͷ�ļ� ʹ��˵��

1��Ish ��ʲô��
  Ish ���� ��PreDefines.ish�� ��Ϊ�������ص�һ�� ͷ�ļ�ϵͳ�������WLDNA�����������
  ���У��кܶ��Ԥ���� �� ������ �� ���̡�Ϊ��С�����ߵĸ���������Nsis��Nsh �� Delphi��Pas��
  ������壬��ο������� Ish �Լ� ���ʹ�� Ish - http://www.dreams8.com/thread-12007-1-1.html

2��Ish�ļ���ʽ����ô���ģ�
  �� ��CallNsis.Ish�� �ļ�Ϊ����
  
  #ifndef _CALLNSIS_ISH_                                    //ͷ�ļ���ʼ�����ͷ�ļ��Ƿ��Ѿ���������� ����
    #Define _CALLNSIS_ISH_ __PATHFILENAME__                 //��ͷ�ļ���������ͷ�ļ�·��
    #expr Plugin_Init                                          //�����ͷ�ļ�Ϊ���ͷ�ļ�����ôʹ�øù��ܣ����԰���ʵ�ֲ���ĸ��ֵĶ��壬���������ű�ʱ��ȫ�ֶ���

  #define CallNsis_DLL "CallNsis.dll"                       //���� �ò��ͷ�ļ� ��ʹ�õĲ����

  [Files]                                                   //�������涨�壬�Զ������ļ��ļ��صȵ�
  Source: {#PluginDir}\{#CallNsis_DLL}; DestDir: {#Plugin_DestDir}; Flags: {#Plugin_FileFlags}

  [Code]                                                   //�������涨�壬�Զ����������ܵȵ�
  function callplug(parentwnd: Integer; pluginname,funcname,param1,param2,param3,param4,param5,param6,param7,param8,param9,param10: PAnsiChar): Integer;
  external 'callplug@{#Plugin_CodeDir}{#CallNsis_DLL} {#Plugin_CodeFlags}';
  [/Code]

  #endif                                                    //ͷ�ļ�������
  
  
3��Ish�ļ�Ĭ����μ��أ�
  1)����װʱ��Ish�����������ļ��У����Զ����� ��PreDefines.ish��
  2)����PreDefines.ish�������Զ����� �����ļ��У�IncludeDir��������ļ��У�PluginDir�����ĵ��ļ��У�DocDir������չ�ļ��У�ExtendDir�� ���ඨ��
  3)����PreDefines.ish�������� ISPP�꣺AddQuotes(str S)��RemoveQuotes(str S)�� FolderExists(str DirName) ��SimpleVersion(str S)��InvalidFileName(str FileName)��
  4)����PreDefines.ish��������һЩInno��û�е����Ͷ��� �� function PDir(PName: String): String;
  5)����PreDefines.ish�����Զ����� IncludeDir �� ��������������ļ��У�������Ŀ¼
  6)����PreDefines.ish���������� ������� ���� �� ��