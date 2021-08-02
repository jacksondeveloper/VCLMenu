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
      .AdicionarSubMenu('Animal1')
      .AdicionarSubMenu('Animal2')
      .AdicionarSubMenu('Animal3')
      .AdicionarSubMenu('Animal4')
      .AdicionarSubMenu('Animal5')
    .AdicionarMenu('Fazenda')
      .AdicionarSubMenu('Fazenda1')
      .AdicionarSubMenu('Fazenda2')
  .GerarMenu;
end;

end.
