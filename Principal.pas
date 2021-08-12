unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, MenuController, StdCtrls, ImgList, jpeg;

type
  TfrPrincipal = class(TForm)
    pnContainer: TPanel;
    pnTopo: TPanel;
    pnPrincipal: TPanel;
    Panel1: TPanel;
    pnEsquerdo: TPanel;
    Panel3: TPanel;
    Memo1: TMemo;
    Image1: TImage;
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
                      .SetLarguraMenu(230)
                      .SetAlturaSubMenu(50);
                      
  fMenuController := TMenuController.New(pnEsquerdo, pnPrincipal, fMenuParametros);

  fMenuController
    .AdicionarMenu('Animal', Image1.Picture)
      .AdicionarSubMenu('Animal1', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Animal2', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Animal3', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Animal4', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Animal5', AbrirCadastro, Image1.Picture)
    .AdicionarMenu('Fazenda', Image1.Picture)
      .AdicionarSubMenu('Fazenda1', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Fazenda2', AbrirCadastro, Image1.Picture)
    .AdicionarMenu('Mastite', Image1.Picture)
      .AdicionarSubMenu('Mastite1', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Mastite2', AbrirCadastro, Image1.Picture)
    .AdicionarMenu('Utilit�rios', Image1.Picture)
      .AdicionarSubMenu('Utilit�rios1', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios2', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios3', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios4', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios5', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios6', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios7', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios8', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios9', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios10', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios11', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios12', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios13', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios14', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios15', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios16', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios17', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios18', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios19', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios20', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios21', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios22', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios23', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios24', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios25', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios26', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios27', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios28', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios29', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios30', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios31', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios32', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios33', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios34', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios35', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios36', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios37', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios38', AbrirCadastro, Image1.Picture)
  .GerarMenu;
end;

procedure TfrPrincipal.AbrirCadastro(Sender: TObject);
begin
  if not Assigned(frCadastroTeste) then FreeAndNil(frCadastroTeste);
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
