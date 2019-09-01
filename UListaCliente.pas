unit UListaCliente;

interface

uses Classes, UCliente, Dialogs;

Type
  TListaCliente = class
  private
    { private declarations }
    FListaClientes : TList;
  protected
    { protected declarations }
  public
    { public declarations }
    constructor Create;
    procedure Adicionar(pCliente: TCliente);
    procedure Remover(Index: Integer);
    function Count: Integer;
  published
    { published declarations }
  end;

implementation

constructor TListaCliente.Create;
begin
  inherited Create;
  FListaClientes := TList.Create;
end;

function TListaCliente.Count: Integer;
begin
  Result := FListaClientes.Count;
end;

procedure TListaCliente.Adicionar(pCliente: TCliente);
begin
  FListaClientes.Add(pCliente);
end;

procedure TListaCliente.Remover(Index: Integer);
begin
  if Index < Count then
     FListaClientes.Delete(Index)
  else
    ShowMessage('Item não encontrado!');
end;

end.
