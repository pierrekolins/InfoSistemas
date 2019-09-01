unit UCliente;

interface

type
  TCliente = class

  private
    { private declarations }
    FNome : string;
    FIdentidade : string;
    FCPF : string;
    FTelefone: string;
    FEmail: string;

    FCEP: string;
    FLogradouro: string;
    FNumero: string;
    FComplemento: string;
    FBairro: string;
    FCidade: string;
    FEstado: string;
    FPais: string;

    procedure SetNome(const valor: string);
    procedure SetIdentidade(const valor: string);
    procedure SetCPF(const valor: string);
    procedure SetTelefone(const valor: string);
    procedure SetEmail(const valor: string);
    procedure SetCEP(const valor: string);
    procedure SetLogradouro(const valor: string);
    procedure SetNumero(const valor: string);
    procedure SetComplemento(const valor: string);
    procedure SetBairro(const valor: string);
    procedure SetCidade(const valor: string);
    procedure SetEstado(const valor: string);
    procedure SetPais(const valor: string);

  protected
    { protected declarations }
  public
    { public declarations }
    property Nome : string read FNome write SetNome;
    property Identidade : string read FIdentidade write SetIdentidade;
    property CPF : string read FCPF write SetCPF;
    property Telefone : string read FTelefone write SetTelefone;
    property Email : string read FEmail write SetEmail;
    //endereço
    property CEP : string read FCEP write SetCEP;
    property Logradouro : string read FLogradouro write SetLogradouro;
    property Numero : string read FNumero write SetNumero;
    property Complemento : string read FComplemento write SetComplemento;
    property Bairro : string read FBairro write SetBairro;
    property Cidade : string read FCidade write SetCidade;
    property Estado : string read FEstado write SetEstado;
    property Pais : string read FPais write SetPais;

    Constructor Create;    // construtor
    Destructor  Destroy; Override; // destrutor

  published
  end;

implementation

constructor TCliente.Create;
begin
// metodo contrutor
end;

destructor TCliente.Destroy;
begin
// metodo destrutor
inherited;

end;

procedure TCliente.SetNome(const valor: string);
begin
  FNome := valor;
end;

procedure TCliente.SetIdentidade(const valor: string);
begin
  FIdentidade := valor;
end;

procedure TCliente.SetCPF(const valor: string);
begin
  FCPF := valor;
end;

procedure TCliente.SetTelefone(const valor: string);
begin
  FTelefone := valor;
end;

procedure TCliente.SetEmail(const valor: string);
begin
  FEmail := valor;
end;

procedure TCliente.SetCEP(const valor: string);
begin
  FCEP := valor;
end;

procedure TCliente.SetLogradouro(const valor: string);
begin
  FLogradouro := valor;
end;

procedure TCliente.SetNumero(const valor: string);
begin
  FNumero := valor;
end;

procedure TCliente.SetComplemento(const valor: string);
begin
  FComplemento := valor;
end;

procedure TCliente.SetBairro(const valor: string);
begin
  FBairro := valor;
end;

procedure TCliente.SetCidade(const valor: string);
begin
  FCidade := valor;
end;

procedure TCliente.SetEstado(const valor: string);
begin
  FEstado := valor;
end;

procedure TCliente.SetPais(const valor: string);
begin
  FPais := valor;
end;

end.
