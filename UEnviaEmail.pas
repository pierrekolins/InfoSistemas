unit UEnviaEmail;

interface

uses UCliente, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdMessageClient, IdSMTP, StdCtrls, IdMessage, ExtCtrls, SysUtils, EASendMailObjLib_TLB;

  type
  TEnviaEmail = class

  private
    { Private declarations }
  public
    { Public declarations }
    Procedure EnviaEmail(cliente : TCliente);
  end;


implementation

Procedure TEnviaEmail.EnviaEmail(cliente : TCliente);
var
    oSmtp : TMail;
    diretorio, arqNome, completo : string;
Begin
 try

 oSmtp := TMail.Create(Application);
  oSmtp.LicenseCode := 'TryIt';

  // Meu email
  oSmtp.FromAddr := 'infosistemasteste@yahoo.com';

  // Email cliente
  oSmtp.AddRecipientEx( cliente.Email, 0);

  // Título
  oSmtp.Subject := 'InfoSistemas';

  // Corpo
  oSmtp.BodyText := 'InfoSistemas Cliente';

  // Adiciona o arquivo como anexo
  diretorio := ExtractFilePath(Application.ExeName);
  arqNome:= cliente.CPF+'.xml';
  completo := diretorio+cliente.CPF+'.xml';
  If oSmtp.AddAttachment(completo) <> 0 Then
      ShowMessage( 'Failed to add attachment with error: ' + oSmtp.GetLastErrDescription());

  // Endereço SMTP
  oSmtp.ServerAddr := 'smtp.mail.yahoo.com';

  // Autenticação Email e Senha
  oSmtp.UserName := 'infosistemasteste@yahoo.com';
  oSmtp.Password := 'info@2019';

   // Requer SSL
  oSmtp.SSL_init();

//  ShowMessage( 'Enviando email ...' );

  if oSmtp.SendMail() = 0 then
  Begin
    try
     deletefile(arqNome);
    except
    end;
    ShowMessage( 'Email enviado com Sucesso!' );
  End
  else
    ShowMessage( 'Falha no envio: '+ oSmtp.GetLastErrDescription());

 except on E: Exception do
  Begin
    ShowMessage(e.Message);
  End;

 end;

end;

end.
