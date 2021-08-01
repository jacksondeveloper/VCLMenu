unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, MenuController;

type
  TfrPrincipal = class(TForm)
    pnContainer: TPanel;
    pnTopo: TPanel;
    pnPrincipal: TPanel;
    Panel1: TPanel;
    pnEsquerdo: TPanel;
    procedure FormCreate(Sender: TObject);
  private
    fMenuController: iMenuController;
  public
    { Public declarations }
  end;

var
  frPrincipal: TfrPrincipal;

implementation

{$R *.dfm}

procedure TfrPrincipal.FormCreate(Sender: TObject);
begin
  fMenuController := TMenuController.New(pnEsquerdo, pnPrincipal);

  fMenuController
    .AdicionarMenu('Animal')
      .AdicionarSubMenu('Cadastro')
      .AdicionarSubMenu('Leite')
    .AdicionarMenu('Fazenda')
  .GerarMenu;
end;

end.
