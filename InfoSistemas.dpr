program InfoSistemas;

uses
  Forms,
  UFrmPrincipal in 'UFrmPrincipal.pas' {FrmPrincipal},
  UCliente in 'UCliente.pas',
  UFrmNovoCliente in 'UFrmNovoCliente.pas' {FrmNovoCliente},
  UCriaXML in 'UCriaXML.pas',
  UEnviaEmail in 'UEnviaEmail.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmNovoCliente, FrmNovoCliente);
  Application.Run;
end.
