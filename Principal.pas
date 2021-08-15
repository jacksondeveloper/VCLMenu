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
    .AdicionarMenu('Utilitários', Image1.Picture)
      .AdicionarSubMenu('Utilitários1', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilitários2', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilitários3', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilitários4', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilitários5', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilitários6', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilitários7', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilitários8', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilitários9', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilitários10', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilitários11', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilitários12', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilitários13', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilitários14', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilitários15', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilitários16', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilitários17', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilitários18', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilitários19', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilitários20', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilitários21', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilitários22', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilitários23', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilitários24', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilitários25', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilitários26', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilitários27', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilitários28', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilitários29', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilitários30', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilitários31', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilitários32', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilitários33', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilitários34', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilitários35', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilitários36', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilitários37', AbrirCadastro, Nil)
      .AdicionarSubMenu('Utilitários38', AbrirCadastro, Nil)
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
