program DelphiPro;

uses
  Forms,
  NP in 'NP.pas' {MainFrm},
  NN in 'NN.pas' {ErrorFrm},
  RR in 'RR.pas' {RightFrm},
  LP in 'LP.pas' {LicFrm},
  AP in 'AP.pas' {AboutFrm},
  RP in 'RP.pas' {ResultFrm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Система проверки знаний Delphi';
  Application.CreateForm(TMainFrm, MainFrm);
  Application.CreateForm(TErrorFrm, ErrorFrm);
  Application.CreateForm(TRightFrm, RightFrm);
  Application.CreateForm(TLicFrm, LicFrm);
  Application.CreateForm(TAboutFrm, AboutFrm);
  Application.CreateForm(TResultFrm, ResultFrm);
  Application.Run;
end.
