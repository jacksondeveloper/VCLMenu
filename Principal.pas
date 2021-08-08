unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, MenuController, StdCtrls;

type
  TfrPrincipal = class(TForm)
    pnContainer: TPanel;
    pnTopo: TPanel;
    pnPrincipal: TPanel;
    Panel1: TPanel;
    pnEsquerdo: TPanel;
    Panel3: TPanel;
    Memo1: TMemo;
    procedure pnEsquerdoClick(Sender: TObject);
    procedure pnPrincipalClick(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure pnTopoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    fMenuController: iMenuController;
    fMenuParametros: iMenuParametros;
    procedure AbrirCadastro(Sender: TObject);
    procedure SetMenuController(const Value: iMenuController);
  public
    property MenuController: iMenuController read FMenuController write SetMenuController;
  end;

var
  frPrincipal: TfrPrincipal;

procedure DOLog(Value: String);

implementation

uses
  CadastroTeste, MenuSubItem;

procedure DOLog(Value: String);
begin
  // Para teste
  frPrincipal.Memo1.Lines.Add(Value);
end;

{$R *.dfm}

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

procedure TfrPrincipal.FormActivate(Sender: TObject);
begin
  fMenuParametros := TMenuParametros.New
                      .SetAlturaMenu(50)
                      .SetAlturaSubMenu(50);
                      
  fMenuController := TMenuController.New(pnEsquerdo, pnPrincipal, fMenuParametros);

  fMenuController
    .AdicionarMenu('Animal')
      .AdicionarSubMenu('Animal1', AbrirCadastro)
      .AdicionarSubMenu('Animal2', AbrirCadastro)
      .AdicionarSubMenu('Animal3', AbrirCadastro)
      .AdicionarSubMenu('Animal4', AbrirCadastro)
      .AdicionarSubMenu('Animal5', AbrirCadastro)
    .AdicionarMenu('Fazenda')
      .AdicionarSubMenu('Fazenda1', AbrirCadastro)
      .AdicionarSubMenu('Fazenda2', AbrirCadastro)
    .AdicionarMenu('Mastite')
      .AdicionarSubMenu('Mastite1', AbrirCadastro)
      .AdicionarSubMenu('Mastite2', AbrirCadastro)
    .AdicionarMenu('Utilit�rios')
      .AdicionarSubMenu('Utilit�rios1', AbrirCadastro)
      .AdicionarSubMenu('Utilit�rios2', AbrirCadastro)
      .AdicionarSubMenu('Utilit�rios3', AbrirCadastro)
      .AdicionarSubMenu('Utilit�rios4', AbrirCadastro)
      .AdicionarSubMenu('Utilit�rios5', AbrirCadastro)
      .AdicionarSubMenu('Utilit�rios6', AbrirCadastro)
      .AdicionarSubMenu('Utilit�rios7', AbrirCadastro)
      .AdicionarSubMenu('Utilit�rios8', AbrirCadastro)
      .AdicionarSubMenu('Utilit�rios9', AbrirCadastro)
      .AdicionarSubMenu('Utilit�rios10', AbrirCadastro)
      .AdicionarSubMenu('Utilit�rios11', AbrirCadastro)
      .AdicionarSubMenu('Utilit�rios12', AbrirCadastro)
      .AdicionarSubMenu('Utilit�rios13', AbrirCadastro)
      .AdicionarSubMenu('Utilit�rios14', AbrirCadastro)
      .AdicionarSubMenu('Utilit�rios15', AbrirCadastro)
      .AdicionarSubMenu('Utilit�rios16', AbrirCadastro)
      .AdicionarSubMenu('Utilit�rios17', AbrirCadastro)
      .AdicionarSubMenu('Utilit�rios18', AbrirCadastro)
      .AdicionarSubMenu('Utilit�rios19', AbrirCadastro)
      .AdicionarSubMenu('Utilit�rios20', AbrirCadastro)
      .AdicionarSubMenu('Utilit�rios21', AbrirCadastro)
      .AdicionarSubMenu('Utilit�rios22', AbrirCadastro)
      .AdicionarSubMenu('Utilit�rios23', AbrirCadastro)
      .AdicionarSubMenu('Utilit�rios24', AbrirCadastro)
      .AdicionarSubMenu('Utilit�rios25', AbrirCadastro)
      .AdicionarSubMenu('Utilit�rios26', AbrirCadastro)
      .AdicionarSubMenu('Utilit�rios27', AbrirCadastro)
      .AdicionarSubMenu('Utilit�rios28', AbrirCadastro)
      .AdicionarSubMenu('Utilit�rios29', AbrirCadastro)
      .AdicionarSubMenu('Utilit�rios30', AbrirCadastro)
      .AdicionarSubMenu('Utilit�rios31', AbrirCadastro)
      .AdicionarSubMenu('Utilit�rios32', AbrirCadastro)
      .AdicionarSubMenu('Utilit�rios33', AbrirCadastro)
      .AdicionarSubMenu('Utilit�rios34', AbrirCadastro)
      .AdicionarSubMenu('Utilit�rios35', AbrirCadastro)
      .AdicionarSubMenu('Utilit�rios36', AbrirCadastro)
      .AdicionarSubMenu('Utilit�rios37', AbrirCadastro)
      .AdicionarSubMenu('Utilit�rios38', AbrirCadastro)  
  .GerarMenu;
end;

procedure TfrPrincipal.AbrirCadastro(Sender: TObject);
begin
  Application.CreateForm(TfrCadastroTeste, frCadastroTeste);
  frCadastroTeste.Parent := pnPrincipal;
  frCadastroTeste.Label1.Caption := TfrMenuSubItem(Sender).lbPrincipal.Caption;
  frCadastroTeste.Show;
end;

procedure TfrPrincipal.SetMenuController(const Value: iMenuController);
begin
  FMenuController := Value;
end;

end.
