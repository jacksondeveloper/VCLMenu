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
    Button3: TButton;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure pnEsquerdoClick(Sender: TObject);
    procedure pnPrincipalClick(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure pnTopoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PnPrincipalInternoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
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
    procedure Sair(Sender: TFrame);
    procedure Mensagem(Sender: TFrame);
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
  if Assigned(fMenuController) then
    fMenuController.LimparMenu;
  fMenuController := TMenuController.New(pnEsquerdoInterno, PnPrincipalInterno, fMenuParametros);

  // Criação do menu e submenus
  fMenuController
    .AdicionarMenu('Cadastros', Image1.Picture, GetPermissaoAcesso('Animal'))
      .AdicionarSubMenu('Produto', AbrirFormRegistrado, Image1.Picture, GetPermissaoAcesso('Animal1'), 'TfrCadastroTeste', )
      .AdicionarSubMenu('Marca', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Grupo', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Fornecedor', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Cliente', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Pessoa', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Tributação', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('ICMS', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('PIS', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
    .AdicionarMenu('Venda', Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('NF-e', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('NFC-e', AbrirCadastro, Image1.Picture, GetPermissaoAcesso('Fazenda2'))
      .AdicionarSubMenu('SAT', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
    .AdicionarMenu('PAFECF', Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Leitura X', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Redução Z', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
    .AdicionarMenu('Utilitários', Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Converter', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Backup', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Restaurar', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Registro', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Termos', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Formatar', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Exportar', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('XML', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('XLS', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Documento', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Chat', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('On-line', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Inverter', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Naruto', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Goku', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários16', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários17', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários18', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários20', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários21', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários22', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários23', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários24', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários25', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários26', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários27', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários28', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários29', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários30', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários31', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários32', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários33', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários34', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários35', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários36', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários37', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários39', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários40', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários41', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários42', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários43', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários44', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários45', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários46', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários47', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários48', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários49', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários50', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários51', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
      .AdicionarSubMenu('Utilitários52', AbrirCadastro, Image1.Picture, GetPermissaoAcesso)
    .AdicionarMenu('Mensagem', Image1.Picture, True, Mensagem)
    .AdicionarMenu('Sair', Image1.Picture, True, Sair)
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
  fMenuController.MostrarEsconderMenu('Cadastros', False);
  fMenuController.MostrarEsconderMenu('Utilitários', False);
end;

procedure TfrPrincipal.Button2Click(Sender: TObject);
begin
  fMenuController.LimparMenu;
end;

procedure TfrPrincipal.Button3Click(Sender: TObject);
begin
  GerarMenu;
end;

procedure TfrPrincipal.Sair(Sender: TFrame);
begin
  Close;
end;

procedure TfrPrincipal.Mensagem(Sender: TFrame);
begin
  ShowMessage('Trolei');
end;

procedure TfrPrincipal.Button4Click(Sender: TObject);
begin
  fMenuController.EsconderMenus;
end;

procedure TfrPrincipal.Button5Click(Sender: TObject);
begin
  fMenuController.MostrarEsconderMenu('Cadastros', True);
  fMenuController.MostrarEsconderMenu('Utilitários', True);
end;

initialization
  RegisterClass(TfrCadastroTeste);

finalization
  UnRegisterClass(TfrCadastroTeste);

end.
