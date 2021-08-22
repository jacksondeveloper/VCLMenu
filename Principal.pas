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
  // Par�metros
  fMenuParametros := TMenuParametros.New
                      .SetAlturaMenu(55)
                      .SetLarguraMenu(260)
                      .SetAlturaSubMenu(50)
                      .SetEvMinimizarMenu(MinimizarMenu)
                      .SetEvMaximizarMenu(MaximizarMenu)
                      ;
  fMenuController := TMenuController.New(pnEsquerdoInterno, PnPrincipalInterno, fMenuParametros);
  fMenuController.SetEvClickSubmenuView(ClickSubmenuView);

  // Cria��o do menu
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
    .AdicionarMenu('Utilit�rios', Image1.Picture)
      .AdicionarSubMenu('Utilit�rios1', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios2', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios3', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios4', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios5', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios6', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios7', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios8', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios9', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios10', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios11', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios12', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios13', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios14', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios15', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios16', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios17', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios18', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios19', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios20', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios21', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios22', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios23', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios24', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios25', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios26', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios27', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios28', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios29', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios30', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios31', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios32', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios33', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios34', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios35', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios36', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios37', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios39', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios40', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios41', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios42', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios43', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios44', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios45', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios46', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios47', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios48', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios49', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios50', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios51', AbrirCadastro, EmptyStr, Image1.Picture)
      .AdicionarSubMenu('Utilit�rios52', AbrirCadastro, EmptyStr, Image1.Picture)
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
    MessageDlg('Form n�o registrado!', mtError, [mbOK], 0)
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
