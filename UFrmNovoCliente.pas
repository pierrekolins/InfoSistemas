unit UFrmNovoCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, UCliente, UListaCliente, DBXJSONReflect,  idHTTP, IdSSLOpenSSL,
  DSClientRest, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, UCriaXML, UEnviaEmail,
  DBXJSON,  Generics.Collections;

type
  TFrmNovoCliente = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    edtCEP: TEdit;
    edtLogadouro: TEdit;
    edtNumero: TEdit;
    edtPais: TEdit;
    edtEstado: TEdit;
    edtCidade: TEdit;
    edtComplemento: TEdit;
    edtBairro: TEdit;
    edtNome: TEdit;
    edtIdentidade: TEdit;
    edtCPF: TEdit;
    edtTelefone: TEdit;
    edtEmail: TEdit;
    btnBuscar: TButton;
    btnSalvar: TButton;
    btnCancel: TButton;
    IdHTTP: TIdHTTP;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    btnExcluir: TButton;
    btnEmail: TButton;
    btnNovo: TButton;
    btnLocalizar: TButton;
    procedure btnBuscarClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edtCEPKeyPress(Sender: TObject; var Key: Char);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAntClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
  private
    { Private declarations }
   dicCliente : TDictionary<string, TCliente>;
   function TestaCEP(cep: string): Boolean;
   procedure CarregaCep(JSON: TJSONObject);
   function RemoveAspas(s: string): string;
   function TestaCampos():boolean;
   procedure LimpaCampos();
  public
    { Public declarations }
  end;

  TJsonObjectHelper = class helper for TJsonObject
  public
    //Helper to find a JSON pair based on the pair string part
    function Get(const PairName: UnicodeString): TJSONPair; overload;
  end;

var
  FrmNovoCliente: TFrmNovoCliente;

implementation

{$R *.dfm}

procedure TFrmNovoCliente.btnAntClick(Sender: TObject);
begin
  LimpaCampos;
end;

procedure TFrmNovoCliente.btnBuscarClick(Sender: TObject);
const
  RETORNO_ERRO = '{'#$A'  "erro": true'#$A'}';
var
  URL: String;
  JsonStreamRetorno: TStringStream;
  vJson: TJSONObject;
begin
  if TestaCEP(edtCEP.Text) then
  Begin
  URL :='https://viacep.com.br/ws/%s/json';
  JsonStreamRetorno := TStringStream.Create;
  try
   IdHttp.IOHandler := IdSSLIOHandlerSocketOpenSSL1;
    try

       idHttp.Get(Format(URL, [edtCEP.Text]), JsonStreamRetorno);
       if (idHTTP.ResponseCode = 200) and (not (JsonStreamRetorno.DataString = RETORNO_ERRO)) then
       Begin
        vJson := TJsonObject(TJSONObject.ParseJSONValue(UTF8ToString(PAnsiChar(AnsiString(JsonStreamRetorno.DataString)))));
        carregaCep(vJson);
       End
       else
       Begin
         ShowMessage('CEP não localizado');
       End;
    except
      on E:EIdHTTPProtocolException do
        ShowMessage(e.ErrorMessage);
    end;
   finally
    JsonStreamRetorno.Free;
     //ShowMessage(JsonStreamRetorno.DataString);
   end;
   End
   else
   Begin
    ShowMessage('CEP Inválido!');
    Exit;
   End;
end;

procedure TFrmNovoCliente.CarregaCep(JSON: TJSONObject);
begin
   edtLogadouro.Text := RemoveAspas(TJSONObject(JSON.Get('logradouro').JsonValue).ToString);
   edtCidade.Text  := RemoveAspas(TJSONObject(JSON.Get('localidade').JsonValue).ToString);
   edtBairro.Text   := RemoveAspas(TJSONObject(JSON.Get('bairro').JsonValue).ToString);
   edtEstado.Text  := RemoveAspas(TJSONObject(JSON.Get('uf').JsonValue).ToString);
   edtComplemento.Text :=  RemoveAspas(TJSONObject(JSON.Get('complemento').JsonValue).ToString);
   // Testa preenchimento do País
   if (Length(Trim(edtEstado.Text))) > 0 then
    edtPais.Text := 'BR';
end;

procedure TFrmNovoCliente.btnCancelClick(Sender: TObject);
begin
 Close();
end;

procedure TFrmNovoCliente.btnEmailClick(Sender: TObject);
var tmpCPF: String;
 tmpCliente: TCliente;
 envemail: TEnviaEmail;
 xml: TCriaXML;
begin
  tmpCPF := inputbox('Enviar Email', 'Digite o CPF', '');
  if dicCliente.ContainsKey(tmpCPF) then
  Begin
    tmpCliente := TCliente.Create;
    dicCliente.TryGetValue(tmpCPF, tmpCliente);
    //cria xml com dados armazenados
    xml.CriaXml(tmpCliente);
    //envia email
    envemail.EnviaEmail(tmpCliente);
  End
  else
  Begin
    ShowMessage('Cliente não localizado!');
  End;
end;

procedure TFrmNovoCliente.btnExcluirClick(Sender: TObject);
var tmpCPF: string;
begin
  tmpCPF := inputbox('Localizar', 'Digite o CPF', '');
  if dicCliente.ContainsKey(tmpCPF) then
  Begin
  if Application.MessageBox('Confirma exclusão?',
   'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
   begin
      dicCliente.Remove(tmpCPF);
   end;
  End
  else
  Begin
    ShowMessage('Registro não localizado!');
  End;
end;

procedure TFrmNovoCliente.btnLocalizarClick(Sender: TObject);
var tmpCPF: String;
 tmpCliente: TCliente;
begin
  tmpCPF := inputbox('Localizar', 'Digite o CPF', '');
  if dicCliente.ContainsKey(tmpCPF) then
  Begin
    tmpCliente := TCliente.Create;
    dicCliente.TryGetValue(tmpCPF, tmpCliente);
    with tmpCliente do
    begin
    edtNome.Text := Nome;
    edtIdentidade.Text := Identidade;
    edtCPF.Text := CPF;
    edtTelefone.Text := Telefone;
    edtEmail.Text := Email;

    edtCEP.Text := CEP;
    edtLogadouro.Text := Logradouro;
    edtNumero.Text := Numero;
    edtComplemento.Text := Complemento;
    edtBairro.Text := Bairro;
    edtCidade.Text := Cidade;
    edtEstado.Text := Estado;
    edtPais.Text := Pais;
  end;
  End
  else
  Begin
    ShowMessage('Cliente não localizado');
  End;
end;

procedure TFrmNovoCliente.btnNovoClick(Sender: TObject);
begin
 LimpaCampos;
 edtNome.SetFocus;
end;

procedure TFrmNovoCliente.btnSalvarClick(Sender: TObject);
Var
  tempCliente : TCliente;
  xml : TCriaXML;
  envemail: TEnviaEmail;
begin
// Testa campos mínimos Nome, CPF, Email
  if TestaCampos then
  Begin
  tempCliente := TCliente.Create;
  with tempCliente do
  begin
    Nome      := edtNome.Text;
    Identidade := edtIdentidade.Text;
    CPF      := edtCPF.Text;
    Telefone := edtTelefone.Text;
    Email    := edtEmail.Text;

    CEP      := edtCEP.Text;
    Logradouro := edtLogadouro.Text;
    Numero      := edtNumero.Text;
    Complemento      := edtComplemento.Text;
    Bairro := edtBairro.Text;
    Cidade      := edtCidade.Text;
    Estado      := edtEstado.Text;
    Pais := edtPais.Text;
  end;
  // Testa se já existe
  if not dicCliente.ContainsKey(edtCPF.Text) then
  Begin
   dicCliente.AddOrSetValue(edtCPF.Text, tempCliente);
   ShowMessage('Dados do Cliente foram salvos');

   if Application.MessageBox('Deseja enviar email agora?',
   'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
   begin
     // cria arquivo xml
     xml.CriaXml(tempCliente);
     // envia email
     envemail.EnviaEmail(tempCliente);
   end;
   End
   else
   Begin
    if Application.MessageBox('Deseja alterar os dados do cliente?',
   'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
    begin
      dicCliente.AddOrSetValue(edtCPF.Text, tempCliente);
    end;
   End;
   LimpaCampos;
  End
  else
  Begin
    ShowMessage('Necessário o preenchimento dos campos: Nome, CPF e Email!');
  End;
end;

procedure TFrmNovoCliente.edtCEPKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key <> #8) then
  begin
      if not (Key in ['0'..'9']) then // apenas númerico
      begin
         Key := #0;
      end;
  end;
end;

procedure TFrmNovoCliente.FormCreate(Sender: TObject);
begin
 dicCliente := TDictionary<string, TCliente>.Create;
end;

procedure TFrmNovoCliente.LimpaCampos;
 // Limpa todas as edits
 var
  I : Integer;
begin

   for I := 0 to ComponentCount-1 do
   begin
     if (Components[I] is TEdit) then
        TEdit(Components[I]).Text := '';
   end;
end;

function TFrmNovoCliente.RemoveAspas(s: string): string;
begin
 Result := StringReplace(s, '"', '', [rfReplaceAll]);
end;

function TFrmNovoCliente.TestaCampos: boolean;
begin
 Result := true;
 if Length(Trim(edtNome.Text)) = 0 then
 Begin
   Result := false;
 End;
 if Length(Trim(edtCPF.Text)) = 0 then
 Begin
   Result := false;
 End;
 if Length(Trim(edtEmail.Text)) = 0 then
 Begin
   Result := false;
 End;
end;

function TFrmNovoCliente.TestaCEP(cep: string): Boolean;
const INVALID_CHARACTER = -1;
begin
 Result := true;
 //Testa tamanho
 if not Length(Trim(cep)) = 8 then
 Begin
   Result := false;
 End;
 // Testa numérico
 if StrToIntDef(cep, INVALID_CHARACTER) = INVALID_CHARACTER then
 Begin
    Result := false;
 End;
end;

{ TJsonObjectHelper }

function TJsonObjectHelper.Get(const PairName: UnicodeString): TJSONPair;
var
  Candidate: TJSONPair;
  I: Integer;
begin
  for i := 0 to Size - 1 do
  begin
    Candidate := Get(i);
    if (Candidate.JsonString.Value = PairName) then
      Exit(Candidate);
  end;
  Result := nil;
end;

end.
