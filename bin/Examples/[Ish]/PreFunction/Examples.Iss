;--------------------------------------------------------------------------------------------;
; Script-Writed by D8 Team                                                                   ;
; Author                            : WLDNA                                                  ;
; Contact me at                     : WLDNA@FoxMail.CoM                                      ;
; Support Site                      : http://www.wldna.com/                                  ;
; Title                             : Ish function examples                                  ;
; Post link                         :                                                        ;
; Function and Usage                :                                                        ;
;--------------------------------------------------------------------------------------------;

#include "PreFunc.iss"
#define MyAppName "Ish Examples"

[Setup]
AppName={#MyAppName}
AppVersion=1.0
CreateAppDir=false
OutputDir=userdocs:Inno Setup Examples Output

[code]
function InitializeSetup(): Boolean;
begin
  Result := {# PreInitializeSetup };
end;

procedure InitializeWizard();
begin
  {# PreInitializeWizard }
end;

procedure DeinitializeSetup();
begin
  {# PreDeinitializeSetup }
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  {# PreCurPageChanged }
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  {# PreCurStepChanged }
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  Result := {# PreNextButtonClick };
end;

function ShouldSkipPage(PageID: Integer): Boolean;
begin
  Result := {# PreShouldSkipPage };
end;

