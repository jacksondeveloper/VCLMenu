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
    .AdicionarMenu('Utilitários', Image1.Picture)
      .AdicionarSubMenu('Utilitários1', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilitários2', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilitários3', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilitários4', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilitários5', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilitários6', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilitários7', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilitários8', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilitários9', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilitários10', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilitários11', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilitários12', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilitários13', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilitários14', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilitários15', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilitários16', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilitários17', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilitários18', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilitários19', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilitários20', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilitários21', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilitários22', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilitários23', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilitários24', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilitários25', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilitários26', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilitários27', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilitários28', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilitários29', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilitários30', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilitários31', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilitários32', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilitários33', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilitários34', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilitários35', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilitários36', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilitários37', AbrirCadastro, Image1.Picture)
      .AdicionarSubMenu('Utilitários38', AbrirCadastro, Image1.Picture)
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
