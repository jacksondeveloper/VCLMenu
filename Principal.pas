{
TODO
 - No adicionar menu pasar um evendo mousedown na imagem do menu para quando minimizado
 - Abrir form registrado para o ultimo parametro e colocar a função dentro do controller
 - Criar parametrro para colocar menus em ordem alfabetica
}

unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, MenuController, StdCtrls, ImgList, jpeg, pngimage,
  CadastroTeste, MenuSubItem, MenuParametros, MenuTipos;

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
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure pnEsquerdoClick(Sender: TObject);
    procedure pnPrincipalClick(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure pnTopoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PnPrincipalInternoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    fMenuController: iMenuController;
    fMenuParametros: iMenuParametros;
    FFormAtivo: TForm;
    procedure AbrirCadastro(Sender: TFrame);
    procedure SetMenuController(const Value: iMenuController);
    procedure ClickSubmenuView(Sender: TFrame);
    procedure AbrirFormRegistrado(Sender: TFrame);
    procedure MinimizarMenu;
    procedure MaximizarMenu;
    procedure SetFormAtivo(const Value: TForm);
    function GetFormAtivo: TForm;
    function GetPermissaoAcesso(Menu: String = ''): Boolean;
    procedure GerarMenu;
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
  GerarMenu;
end;

procedure TfrPrincipal.GerarMenu;
begin
  // Parâmetros
  fMenuParametros := TMenuParametros.New
                      .SetAlturaMenu(55)
                      .SetLarguraMenu(200)
                      .SetAlturaSubMenu(50)
                      .SetAbrirMouseEnter(True)
                      .SetEvAfterClickSubmenu(ClickSubmenuView)
                      .SetEvMinimizarMenu(MinimizarMenu)
                      .SetEvMaximizarMenu(MaximizarMenu)
                      .SetFonteNome('Tahoma')
                      .SetFonteTamanho(14)
                      .SetFonteEstilo([])
                      .SetFonteCor(clBlack)
                      .SetCorPadrao(clWhite)
                      .SetCorSelecionado($E8E8E8)
                      .SetAbrirSubmenuTopoZero(False);

  // Criando classe de menu                    
  fMenuController := TMenuController.New(pnEsquerdoInterno, PnPrincipalInterno, fMenuParametros);

  // Criação do menu e submenus
  fMenuController
    .AdicionarMenu('Animal', Image1.Picture, GetPermissaoAcesso('Animal'))
      .AdicionarSubMenu('Animal1', AbrirFormRegistrado, 'TfrCadastroTeste', Image1.Picture, GetPermissaoAcesso('Animal1'))
      .AdicionarSubMenu('Animal2', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Animal3', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Animal4', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Animal5', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
    .AdicionarMenu('Fazenda', Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Fazenda1', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Fazenda2', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso('Fazenda2'))
      .AdicionarSubMenu('Fazenda3', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
    .AdicionarMenu('Mastite', Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Mastite1', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Mastite2', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
    .AdicionarMenu('Utilitários', Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários1', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários2', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários3', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários4', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários5', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários6', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários7', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários8', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários9', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários10', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários11', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários12', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários13', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários14', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários15', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários16', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários17', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários18', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários20', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários21', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários22', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários23', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários24', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários25', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários26', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários27', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários28', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários29', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários30', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários31', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários32', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários33', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários34', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários35', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários36', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários37', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários39', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários40', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários41', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários42', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários43', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários44', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários45', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários46', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários47', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários48', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários49', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários50', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários51', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários52', AbrirCadastro, EmptyStr, Image1.Picture, GetPermissaoAcesso)
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

  frCadastroTeste.Show;
end;

procedure TfrPrincipal.MinimizarMenu;
begin
  pnEsquerdo.Width := MenuMinimizado;
end;

procedure TfrPrincipal.MaximizarMenu;
begin
  pnEsquerdo.Width := MenuMaximizado;
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

function TfrPrincipal.GetPermissaoAcesso(Menu: String = ''): Boolean;
begin
  Result := True;

  if Menu <> EmptyStr then
  begin
    if Menu = 'Fazenda2' then
      Result := False;
  end;
end;

procedure TfrPrincipal.PnPrincipalInternoClick(Sender: TObject);
begin
  fMenuController.EsconderSubMenus;
end;

procedure TfrPrincipal.Button1Click(Sender: TObject);
begin
  fMenuController.EsconderMenus;
  fMenuController.MostrarEsconderMenu('Fazenda', True);
  fMenuController.MostrarEsconderMenu('Utilitários', True);
  //fMenuController.MostrarEsconderMenu('Mastite', True);
end;

procedure TfrPrincipal.Button2Click(Sender: TObject);
begin
  fMenuController.LimparMenu;
end;

procedure TfrPrincipal.Button3Click(Sender: TObject);
begin
  GerarMenu;
end;

initialization
  RegisterClass(TfrCadastroTeste);

finalization
  UnRegisterClass(TfrCadastroTeste);

end.
