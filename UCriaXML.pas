unit UCriaXML;

interface

uses Forms, SysUtils, xmldom, XMLIntf, StdCtrls, msxmldom, XMLDoc, UCliente;

type
  TCriaXML = class
    XMLDocument1: TXMLDocument;

  private
    { Private declarations }
  public
    { Public declarations }
    procedure CriaXml(cliente: TCliente);
  end;

implementation

procedure TCriaXML.CriaXml(cliente: TCliente);
var
  diretorio : String;
  arqName : String;
  XML : IXMLDOCUMENT;
  RootNode, CurNode, DetNode : IXMLNODE;
begin
  diretorio := ExtractFilePath(Application.ExeName);
  arqName := diretorio+cliente.CPF+'.xml';
  with cliente do
  begin
  XML := NewXMLDocument;
  XML.Encoding := 'utf-8';
  XML.Options := [doNodeAutoIndent];
  RootNode := XML.AddChild('XML');
  CurNode := RootNode.AddChild('Cliente');
  DetNode := CurNode.AddChild('Nome');
  DetNode.Text := Nome;
  DetNode := CurNode.AddChild('Identidade');
  DetNode.Text := Identidade;
  DetNode := CurNode.AddChild('CPF');
  DetNode.Text := CPF;
  DetNode := CurNode.AddChild('Telefone');
  DetNode.Text := Telefone;
  DetNode := CurNode.AddChild('Email');
  DetNode.Text := Email;
  CurNode := CurNode.AddChild('Endereco');
  DetNode := CurNode.AddChild('CEP');
  DetNode.Text := CEP;
  DetNode := CurNode.AddChild('Logradouro');
  DetNode.Text := Logradouro;
  DetNode := CurNode.AddChild('Numero');
  DetNode.Text := Numero;
  DetNode := CurNode.AddChild('Complemento');
  DetNode.Text := Complemento;
  DetNode := CurNode.AddChild('Bairro');
  DetNode.Text := Bairro;
  DetNode := CurNode.AddChild('Cidade');
  DetNode.Text := Cidade;
  DetNode := CurNode.AddChild('Estado');
  DetNode.Text := Estado;
  DetNode := CurNode.AddChild('Pais');
  DetNode.Text := Pais;
  end;
  XMl.SaveToFile(arqName);
end;

end.
