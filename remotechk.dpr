program remotechk;

uses
  Forms,
  remotecheck in 'units\remotecheck.pas' {_remotecheck},
  SendKeys in 'units\sendkeys.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(T_remotecheck, _remotecheck);
  Application.Run;
end.
