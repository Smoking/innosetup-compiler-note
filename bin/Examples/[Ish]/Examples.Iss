;--------------------------------------------------------------------------------------------;
; Script-Writed by D8 Team                                                                   ;
; Author                            : D8 Team - Mr.Grapes                                    ;
; Contact me at                     : Mr.Grapes@FoxMail.CoM                                  ;
; Support Site                      : http://d8.dreams8.com/                                 ;
; Title                             : Ish function examples                                  ;
; Post link                         :                                                        ;
; Function and Usage                :                                                        ;
;--------------------------------------------------------------------------------------------;


;Define switch that plugin will be used by uninstaller.
#Define Plugin_UnInst True
;Define the path plugins stored
#Define Plugin_UnInst_Dir "UninsFiles"
;Include some Inno Setup HeaderFile
#include "ISTask.Ish"
;Define switch to off
#Define Plugin_UnInst False

#define MyAppName "Ish Examples"

[Setup]
AppName={#MyAppName}
AppVersion=1.0
CreateAppDir=false
OutputDir=userdocs:Inno Setup Examples Output

[code]
function InitializeSetup(): Boolean;
begin
  //Extract the dll that functions import from.
  PDir('{# AutoPDirs }');

  //Then you can call functions or procedures form the dll
  ......
  //
end;

