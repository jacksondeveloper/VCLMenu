unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, MenuController, StdCtrls, ImgList, jpeg, pngimage,
  CadastroTeste, MenuSubItem, MenuParametros;

type
  TfrPrincipal = class(TForm)
    pnContainer: TPanel;
    pnTopo: TPanel;
    pnPrincipal: TPanel;
    Panel1: TPanel;
    pnEsquerdo: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Panel4: TPanel;
    PnPrincipalInterno: TPanel;
    pnEsquerdoInterno: TPanel;
    Panel5: TPanel;
    Image1: TImage;
    Label2: TLabel;
    pnMargimLeft: TPanel;
    pnMargimTop: TPanel;
    procedure pnEsquerdoClick(Sender: TObject);
    procedure pnPrincipalClick(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure pnTopoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    fMenuController: iMenuController;
    fMenuParametros: iMenuParametros;
    FFormAtivo: TForm;
    procedure AbrirCadastro(Sender: TFrame);
    procedure SetMenuController(const Value: iMenuController);
    procedure ClickSubmenuView(Sender: TFrame);
    procedure AbrirFormRegistrado(Sender: TFrame);
    procedure MinimizarMenu(Sender: TFrame);
    procedure MaximizarMenu(Sender: TFrame);
    procedure SetFormAtivo(const Value: TForm);
    function GetFormAtivo: TForm;
  public
    property MenuController: iMenuController read FMenuController write SetMenuController;
    property FormAtivo: TForm read GetFormAtivo write SetFormAtivo;
  end;

var
  frPrincipal: TfrPrincipal;

implementation

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
  // Parâmetros
  fMenuParametros := TMenuParametros.New
                      .SetAlturaMenu(55)
                      .SetLarguraMenu(260)
                      .SetAlturaSubMenu(50)
                      .SetEvMinimizarMenu(MinimizarMenu)
                      .SetEvMaximizarMenu(MaximizarMenu)
                      ;
  fMenuController := TMenuController.New(pnEsquerdoInterno, PnPrincipalInterno, fMenuParametros);
  fMenuController.SetEvClickSubmenuView(ClickSubmenuView);

  // Criação do menu
  fMenuController
    .AdicionarMenu('Animal', Image1.Picture)
      .AdicionarSubMenu('Animal1', AbrirFormRegistrado, 'TfrCadastroTeste', Image1.Picture)
      .AdicionarSubMenu('Animal2', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Animal3', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Animal4', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Animal5', AbrirCadastro, EmptyStr, Image1.Picture)
    .AdicionarMenu('Fazenda', Image1.Picture)
      .AdicionarSubMenu('Fazenda1', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Fazenda2', AbrirCadastro, EmptyStr, Image1.Picture)
    .AdicionarMenu('Mastite', Image1.Picture)
      .AdicionarSubMenu('Mastite1', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Mastite2', AbrirCadastro, EmptyStr, Image1.Picture)
    .AdicionarMenu('Utilitários', Image1.Picture)
      .AdicionarSubMenu('Utilitários1', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários2', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários3', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários4', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários5', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários6', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários7', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários8', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários9', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários10', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários11', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários12', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários13', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários14', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários15', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários16', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários17', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários18', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários19', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários20', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários21', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários22', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários23', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários24', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários25', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários26', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários27', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários28', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários29', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários30', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários31', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários32', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários33', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários34', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários35', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários36', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários37', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários39', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários40', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários41', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários42', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários43', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários44', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários45', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários46', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários47', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários48', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários49', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários50', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários51', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilitários52', AbrirCadastro, EmptyStr, Image1.Picture)
  .GerarMenu;
end;

procedure TfrPrincipal.SetMenuController(const Value: iMenuController);
begin
  FMenuController := Value;
end;

procedure TfrPrincipal.ClickSubmenuView(Sender: TFrame);
begin
  Label1.Caption := TfrMenuSubItem(Sender).CaminhoSubmenu;
end;

procedure TfrPrincipal.AbrirFormRegistrado(Sender: TFrame);
var
  Form : TForm;
  TClasse : TPersistentClass;
begin
  Form := nil;
  TClasse := GetClass(TfrMenuSubItem(Sender).FormRegistrado);
  if (TClasse <> nil) and TClasse.InheritsFrom(TForm) then
    Form := TFormClass(TClasse).Create(nil);
  if not Assigned(Form) then
    MessageDlg('Form não registrado!', mtError, [mbOK], 0)
  else
  begin
    frPrincipal.SetFormAtivo(Form);
    Form.Show;
  end;
end;

procedure TfrPrincipal.AbrirCadastro(Sender: TFrame);
begin
  if not Assigned(frCadastroTeste) then FreeAndNil(frCadastroTeste);
  Application.CreateForm(TfrCadastroTeste, frCadastroTeste);

  frPrincipal.SetFormAtivo(frCadastroTeste);

  frCadastroTeste.Label1.Caption := TfrMenuSubItem(Sender).lbPrincipal.Caption;

  frCadastroTeste.Show;
end;

procedure TfrPrincipal.MinimizarMenu(Sender: TFrame);
begin
  pnEsquerdo.Width := TfrMenuSubItem(Sender).imgPrincipal.Width;
end;

procedure TfrPrincipal.MaximizarMenu(Sender: TFrame);
begin
  pnEsquerdo.Width := TfrMenuSubItem(Sender).Width;
end;

procedure TfrPrincipal.SetFormAtivo(const Value: TForm);
begin
  FFormAtivo := Value;
  if Assigned(FFormAtivo) then
    FFormAtivo.Parent := PnPrincipalInterno; 
end;

function TfrPrincipal.GetFormAtivo: TForm;
begin
  Result := FFormAtivo;
end;

initialization
  RegisterClass(TfrCadastroTeste);

end.
