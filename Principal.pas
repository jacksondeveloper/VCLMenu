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
    procedure pnEsquerdoClick(Sender: TObject);
    procedure pnPrincipalClick(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure pnTopoClick(Sender: TObject);
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
    .AdicionarMenu('Mastite')
      .AdicionarSubMenu('Mastite1')
      .AdicionarSubMenu('Mastite2')
    .AdicionarMenu('Utilit�rios')
      .AdicionarSubMenu('Utilit�rios1')
      .AdicionarSubMenu('Utilit�rios2')
      .AdicionarSubMenu('Utilit�rios3')
      .AdicionarSubMenu('Utilit�rios4')
      .AdicionarSubMenu('Utilit�rios5')
      .AdicionarSubMenu('Utilit�rios6')
      .AdicionarSubMenu('Utilit�rios7')
      .AdicionarSubMenu('Utilit�rios8')
  .GerarMenu;
end;

procedure TfrPrincipal.pnEsquerdoClick(Sender: TObject);
begin
  fMenuController.EsconderSubMenus;
end;

procedure TfrPrincipal.pnPrincipalClick(Sender: TObject);
begin
  fMenuController.EsconderSubMenus;
end;

procedure TfrPrincipal.Panel1Click(Sender: TObject);
begin
  fMenuController.EsconderSubMenus;
end;

procedure TfrPrincipal.pnTopoClick(Sender: TObject);
begin
  fMenuController.EsconderSubMenus;
end;

end.
