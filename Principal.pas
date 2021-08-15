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
    Label1: TLabel;
    Panel2: TPanel;
    Panel4: TPanel;
    PnPrincipalInterno: TPanel;
    pnEsquerdoInterno: TPanel;
    Panel5: TPanel;
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
    procedure ClickSubmenuView(Sender: TFrame);
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
                      //.SetMenuMargemDireita(True)
                      .SetAlturaSubMenu(50);

  fMenuController := TMenuController.New(pnEsquerdoInterno, PnPrincipalInterno, fMenuParametros);
  fMenuController.SetEvClickSubmenuView(ClickSubmenuView);

  fMenuController
    .AdicionarMenu('Animal', Image1.Picture)
      .AdicionarSubMenu('Animal1', AbrirCadastro, Nil)
      .AdicionarSubMenu('Animal2', AbrirCadastro, Nil)
      .AdicionarSubMenu('Animal3', AbrirCadastro, Nil)
      .AdicionarSubMenu('Animal4', AbrirCadastro, Nil)
      .AdicionarSubMenu('Animal5', AbrirCadastro, Nil)
    .AdicionarMenu('Fazenda', Image1.Picture)
      .AdicionarSubMenu('Fazenda1', AbrirCadastro, Nil)
      .AdicionarSubMenu('Fazenda2', AbrirCadastro, Nil)
    .AdicionarMenu('Mastite', Image1.Picture)
      .AdicionarSubMenu('Mastite1', AbrirCadastro, Nil)
      .AdicionarSubMenu('Mastite2', AbrirCadastro, Nil)
    .AdicionarMenu('Utilit�rios', Image1.Picture)
      .AdicionarSubMenu('Utilit�rios1', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilit�rios2', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilit�rios3', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilit�rios4', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilit�rios5', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilit�rios6', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilit�rios7', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilit�rios8', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilit�rios9', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilit�rios10', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilit�rios11', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilit�rios12', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilit�rios13', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilit�rios14', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilit�rios15', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilit�rios16', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilit�rios17', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilit�rios18', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilit�rios19', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilit�rios20', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilit�rios21', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilit�rios22', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilit�rios23', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilit�rios24', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilit�rios25', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilit�rios26', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilit�rios27', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilit�rios28', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilit�rios29', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilit�rios30', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilit�rios31', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilit�rios32', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilit�rios33', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilit�rios34', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilit�rios35', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilit�rios36', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilit�rios37', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilit�rios38', AbrirCadastro, Nil)
  .GerarMenu;
end;

procedure TfrPrincipal.AbrirCadastro(Sender: TObject);
begin
  if not Assigned(frCadastroTeste) then FreeAndNil(frCadastroTeste);
  Application.CreateForm(TfrCadastroTeste, frCadastroTeste);
  frCadastroTeste.Parent := PnPrincipalInterno;
  frCadastroTeste.Label1.Caption := TfrMenuSubItem(Sender).lbPrincipal.Caption;
  frCadastroTeste.Show;
end;

procedure TfrPrincipal.SetMenuController(const Value: iMenuController);
begin
  FMenuController := Value;
end;

procedure TfrPrincipal.ClickSubmenuView(Sender: TFrame);
begin
  Label1.Caption := TfrMenuSubItem(Sender).CaminhoSubmenu;
end;

end.
