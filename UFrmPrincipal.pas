unit UFrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, UFrmNovoCliente;

type
  TFrmPrincipal = class(TForm)
    t: TPanel;
    btnNovoCliente: TButton;
    Label1: TLabel;
    procedure btnNovoClienteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}



procedure TFrmPrincipal.btnNovoClienteClick(Sender: TObject);
begin
  FrmNovoCliente := TFrmNovoCliente.Create(Application);
  FrmNovoCliente.ShowModal;
  FrmNovoCliente.Free;
end;

end.
