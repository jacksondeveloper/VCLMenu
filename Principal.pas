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
    .AdicionarMenu('Utilitários')
      .AdicionarSubMenu('Utilitários1', AbrirCadastro)
      .AdicionarSubMenu('Utilitários2', AbrirCadastro)
      .AdicionarSubMenu('Utilitários3', AbrirCadastro)
      .AdicionarSubMenu('Utilitários4', AbrirCadastro)
      .AdicionarSubMenu('Utilitários5', AbrirCadastro)
      .AdicionarSubMenu('Utilitários6', AbrirCadastro)
      .AdicionarSubMenu('Utilitários7', AbrirCadastro)
      .AdicionarSubMenu('Utilitários8', AbrirCadastro)
      .AdicionarSubMenu('Utilitários9', AbrirCadastro)
      .AdicionarSubMenu('Utilitários10', AbrirCadastro)
      .AdicionarSubMenu('Utilitários11', AbrirCadastro)
      .AdicionarSubMenu('Utilitários12', AbrirCadastro)
      .AdicionarSubMenu('Utilitários13', AbrirCadastro)
      .AdicionarSubMenu('Utilitários14', AbrirCadastro)
      .AdicionarSubMenu('Utilitários15', AbrirCadastro)
      .AdicionarSubMenu('Utilitários16', AbrirCadastro)
      .AdicionarSubMenu('Utilitários17', AbrirCadastro)
      .AdicionarSubMenu('Utilitários18', AbrirCadastro)
      .AdicionarSubMenu('Utilitários19', AbrirCadastro)
      .AdicionarSubMenu('Utilitários20', AbrirCadastro)
      .AdicionarSubMenu('Utilitários21', AbrirCadastro)
      .AdicionarSubMenu('Utilitários22', AbrirCadastro)
      .AdicionarSubMenu('Utilitários23', AbrirCadastro)
      .AdicionarSubMenu('Utilitários24', AbrirCadastro)
      .AdicionarSubMenu('Utilitários25', AbrirCadastro)
      .AdicionarSubMenu('Utilitários26', AbrirCadastro)
      .AdicionarSubMenu('Utilitários27', AbrirCadastro)
      .AdicionarSubMenu('Utilitários28', AbrirCadastro)
      .AdicionarSubMenu('Utilitários29', AbrirCadastro)
      .AdicionarSubMenu('Utilitários30', AbrirCadastro)
      .AdicionarSubMenu('Utilitários31', AbrirCadastro)
      .AdicionarSubMenu('Utilitários32', AbrirCadastro)
      .AdicionarSubMenu('Utilitários33', AbrirCadastro)
      .AdicionarSubMenu('Utilitários34', AbrirCadastro)
      .AdicionarSubMenu('Utilitários35', AbrirCadastro)
      .AdicionarSubMenu('Utilitários36', AbrirCadastro)
      .AdicionarSubMenu('Utilitários37', AbrirCadastro)
      .AdicionarSubMenu('Utilitários38', AbrirCadastro)  
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
