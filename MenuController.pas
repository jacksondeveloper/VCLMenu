unit MenuController;

interface

uses
  Classes, SysUtils, MenuItem, MenuSubItem, Controls, MenuTipos, ExtCtrls, Forms,
  Graphics, Windows, MenuParametros, MenuContainerSubMenu;

type

  iMenuController = interface
    ['{1C9623C4-8C0A-44A6-A1F6-9B1F4E279ECA}']
    procedure GerarMenu;
    function AdicionarMenu(Caption: string; Imagem: TPicture = nil; VisibilidadeMenu: Boolean = True): iMenuController;
    function AdicionarSubMenu(Caption: string;
                              EvSubMenuClick: TEvMenuClick = nil;
                              FormRegistrado: String = '';
                              Imagem: TPicture = nil;
                              Visibilidade: Boolean = True): iMenuController;
    procedure EsconderSubMenus;
  end;

  TMenuController = class(TInterfacedObject, iMenuController)
  private
    fVisibilidadeUltimoMenu: Boolean;
    fMenuParametros: iMenuParametros;
    fMenuContainer: TWinControl;
    fSubMenuParent: TWinControl;
    fListaMenu: TList;
    fListaSubMenu: TList;
    fListaContainerSubMenu: TList;
    procedure SetContainerSubMenu(const Value: TList);
    function GetContainerSubMenu: TList;
    function GetAlturaMaximaContainer: Integer;
    procedure MostrarEsconderSubMenusEspecificos(Sender: TFrame);
    procedure OrganizarSubmenusNoContainer;
    function BuscarMenu(ID: Integer): TfrMenuItem;
  public
    constructor Create(MenuContainer, SubMenuParent: TWinControl; MenuParametros: iMenuParametros);
    destructor Destroy; override;
    class function New(MenuContainer, SubMenuParent: TWinControl; MenuParametros: iMenuParametros): iMenuController;
    procedure GerarMenu;
    function AdicionarMenu(Caption: string; Imagem: TPicture = nil; VisibilidadeMenu: Boolean = True): iMenuController;
    function AdicionarSubMenu(Caption: string;
                              EvSubMenuClick: TEvMenuClick = nil;
                              FormRegistrado: String = '';
                              Imagem: TPicture = nil;
                              Visibilidade: Boolean = True): iMenuController;
    procedure EsconderSubMenus;
    procedure CriarNovoContainer(IDMenuItem, Topo, Largura, Left: Integer);
    property ContainerSubMenu: TList read GetContainerSubMenu write SetContainerSubMenu;
  end;

implementation

{ TMenuController }

function TMenuController.AdicionarMenu(Caption: string; Imagem: TPicture = nil; VisibilidadeMenu: Boolean = True): iMenuController;
var
  MenuItem: TfrMenuItem;
  ID, TopoMenu: Integer;
begin
  Result := Self;
  Self.fVisibilidadeUltimoMenu := VisibilidadeMenu;

  if not VisibilidadeMenu then // Permissão de acesso
    Exit;

  if fListaMenu.Count > 0 then
    TopoMenu := TfrMenuItem(fListaMenu[Pred(fListaMenu.Count)]).Top +
                TfrMenuItem(fListaMenu[Pred(fListaMenu.Count)]).Height
  else
    TopoMenu := 0;

  MenuItem:= TfrMenuItem.Create(nil);
  ID := fListaMenu.Count + 1;
  MenuItem.Name := 'MenuItem' + IntToStr(ID);
  MenuItem.ID := ID;
  MenuItem.Visible := True;
  MenuItem.Parent := fMenuContainer;

  // Eventos
  MenuItem.AbrirMouseEnter := fMenuParametros.GetAbrirMouseEnter;
  MenuItem.EvMenuCLick := MostrarEsconderSubMenusEspecificos;
  MenuItem.EvMaximizarMenu := fMenuParametros.GetEvMaximizarMenu;

  // Dimensões
  if fMenuParametros.GetAlturaMenu > 0 then
    MenuItem.Height :=  fMenuParametros.GetAlturaMenu;
  MenuItem.Width := MenuItem.Parent.Width;
  MenuItem.Top := TopoMenu;
  if fMenuParametros.GetAlturaMenu > 0 then
    MenuItem.Height := fMenuParametros.GetAlturaMenu;

  // Visual
  MenuItem.DoubleBuffered := True;
  MenuItem.pnMargemDireita.Visible := fMenuParametros.GetMenuMargemDireita;
  MenuItem.lbPrincipal.Caption := Caption;
  if Assigned(Imagem) then
    MenuItem.SetImagemPrincipal(Imagem);

  fListaMenu.Add(MenuItem);

end;

function TMenuController.AdicionarSubMenu(Caption: string;
                                          EvSubMenuClick: TEvMenuClick = nil;
                                          FormRegistrado: String = '';
                                          Imagem: TPicture = nil;
                                          Visibilidade: Boolean = True): iMenuController;
var
  SubMenuItem: TfrMenuSubItem;
  ID: Integer;
begin
  Result := Self;

  if (not Self.fVisibilidadeUltimoMenu) or (not Visibilidade) then // Permissão de acesso
    Exit;

  SubMenuItem := TfrMenuSubItem.Create(nil);

  // Identificador
  ID := fListaSubMenu.Count + 1;
  SubMenuItem.Name := 'SubMenuItem' + IntToStr(ID);
  SubMenuItem.ID := ID;
  SubMenuItem.CaminhoSubmenu := TfrMenuItem(fListaMenu[Pred(fListaMenu.Count)]).lbPrincipal.Caption;

  // Eventos
  SubMenuItem.pnContainer.Color := clWhite;
  SubMenuItem.EvMenuCLick := EvSubMenuClick;
  SubMenuItem.EvFecharSubMenus := EsconderSubMenus;
  SubMenuItem.EvMinimizarMenu := fMenuParametros.GetEvMinimizarMenu;
  SubMenuItem.EvClickSubmenuView := fMenuParametros.GetEvClickSubmenuView;

  // Controles
  SubMenuItem.IDMenuPai := TfrMenuItem(fListaMenu[Pred(fListaMenu.Count)]).ID; // ultimo menu pai
  SubMenuItem.Visible := True;

  // Dimensões
  SubMenuItem.Width := LarguraSubMenu;
  if fMenuParametros.GetAlturaSubMenu > 0 then
    SubMenuItem.Height := fMenuParametros.GetAlturaSubMenu;
  if fMenuParametros.GetLarguraSubMenu > 0 then
    SubMenuItem.Width := fMenuParametros.GetLarguraSubMenu;

  // Visual
  SubMenuItem.DoubleBuffered := True;
  SubMenuItem.lbPrincipal.Caption := Caption;
  if Assigned(Imagem) then
    SubMenuItem.SetImagemPrincipal(Imagem)
  else
    SubMenuItem.pnEsquerdo.Visible := False;

  // Nome da classe que vai abrir o form registrado usado pela view
  SubMenuItem.FormRegistrado := FormRegistrado;

  fListaSubMenu.Add(SubMenuItem);
end;

procedure TMenuController.OrganizarSubmenusNoContainer;
var
  Contador: Integer;
  SubMenuAtual: TfrMenuSubItem;
  ContainerAtual: TfrContainerSubMenu;
begin
  ContainerAtual := nil; // remove warning

  for Contador := 0 to Pred(fListaSubMenu.Count) do
  begin

    SubMenuAtual := TfrMenuSubItem(fListaSubMenu[Contador]);

    // Se for o primeiro item ou mudar o id do menu pai então deve criar um container novo para esse grupo de submenus
    if (Contador = 0) or (TfrContainerSubMenu(fListaContainerSubMenu[Pred(fListaContainerSubMenu.Count)]).Tag <> SubMenuAtual.IDMenuPai) then
    begin
      CriarNovoContainer(SubMenuAtual.IDMenuPai, BuscarMenu(SubMenuAtual.IDMenuPai).Top, SubMenuAtual.Width, 0);
      ContainerAtual := TfrContainerSubMenu(fListaContainerSubMenu[Pred(fListaContainerSubMenu.Count)]);
    end;

    // Se o container atingir o tamanho máximo permitido
    if (ContainerAtual.GetAltura + SubMenuAtual.Height) >= GetAlturaMaximaContainer then
    begin

      // Se alcançou o tamanho máximo então já joga o container para cima para não ficar em baixo e os outros em cima
      if ((ContainerAtual.GetAltura + SubMenuAtual.Height) > GetAlturaMaximaContainer) then
        ContainerAtual.Top := 0;

      // Se alcançou o tamanho máximo e tiver espaço pra cima, vai subindo o menu
      if (ContainerAtual.Top > 0) and (ContainerAtual.GetAltura < GetAlturaMaximaContainer) then
      begin
        ContainerAtual.Top := ContainerAtual.Top - SubMenuAtual.Height;
        ContainerAtual.SetAltura(ContainerAtual.GetAltura + SubMenuAtual.Height);
      end
      else
      begin
        // Cria novo subcontainer do lado direito pois já não cabe mais no atual
        CriarNovoContainer(SubMenuAtual.IDMenuPai, 0, SubMenuAtual.Width, ContainerAtual.Left + ContainerAtual.Width);
        ContainerAtual := TfrContainerSubMenu(fListaContainerSubMenu[Pred(fListaContainerSubMenu.Count)]);
        ContainerAtual.SetAltura(ContainerAtual.GetAltura + SubMenuAtual.Height);
      end;

    end
    else
    begin
      // Aumenta o tamanho do container para colocar o menu dentro, caminho feliz
      ContainerAtual.SetAltura(ContainerAtual.GetAltura + SubMenuAtual.Height);
    end;

    ContainerAtual.pnMargemSuperior.Visible := (ContainerAtual.Top >= 0);
    SubMenuAtual.Parent := ContainerAtual.pnPrincipal;
    SubMenuAtual.Top := ContainerAtual.GetAltura - SubMenuAtual.Height;
  end;

end;

procedure TMenuController.EsconderSubMenus;
var
  Contador: integer;
begin
  for Contador := 0 to Pred(FListaContainerSubMenu.Count) do
    TfrContainerSubMenu(FListaContainerSubMenu[Contador]).Visible := False;
end;

constructor TMenuController.Create(MenuContainer, SubMenuParent: TWinControl; MenuParametros: iMenuParametros);
begin
  fVisibilidadeUltimoMenu := True;
  fMenuParametros := MenuParametros;
  fMenuContainer := MenuContainer;
  fSubMenuParent := SubMenuParent;
  fListaMenu := TList.Create;
  fListaSubMenu := TList.Create;
  FListaContainerSubMenu := TList.Create;

  if MenuParametros.GetLarguraMenu > 0 then
    MenuContainer.Parent.Width := MenuParametros.GetLarguraMenu;
end;

procedure TMenuController.CriarNovoContainer(IDMenuItem, Topo, Largura, Left: Integer);
var
  Container: TfrContainerSubMenu;
begin
  Container := TfrContainerSubMenu.Create(Application);
  Container.DoubleBuffered := True;
  Container.Tag := IDMenuItem; // Vincula o menu com o container submenu
  Container.Parent := fSubMenuParent;
  Container.Name := 'ContainerSub' + IntToStr(FListaContainerSubMenu.Count + 1);
  Container.Color := clRed;
  Container.Visible := False;
  Container.Top := Topo;
  Container.Left := Left;
  Container.Height := 0;
  Container.Width := Largura;
  Container.pnMargemInferior.Visible := True;
  Container.pnMargemDireita.Visible := True;
  FListaContainerSubMenu.Add(Container);
end;

destructor TMenuController.Destroy;
begin
  FreeAndNil(fListaMenu);
  FreeAndNil(fListaSubMenu);
  FreeAndNil(FListaContainerSubMenu);
  inherited;
end;

procedure TMenuController.GerarMenu;
var
  contador: Integer;
begin
  OrganizarSubmenusNoContainer;
  for contador := 0 to Pred(fListaMenu.Count) do
  begin
    TfrMenuItem(fListaMenu[contador]).Visible := True;
  end;
end;

function TMenuController.GetContainerSubMenu: TList;
begin
  Result := FListaContainerSubMenu;
end;

class function TMenuController.New(MenuContainer, SubMenuParent: TWinControl; MenuParametros: iMenuParametros): iMenuController;
begin
  Result := Self.Create(MenuContainer, SubMenuParent, MenuParametros);
end;

procedure TMenuController.SetContainerSubMenu(const Value: TList);
begin
  FListaContainerSubMenu := Value;
end;

function TMenuController.GetAlturaMaximaContainer: Integer;
var
  PaddingBottom: Integer;
begin
  PaddingBottom := 130;
  Result := fSubMenuParent.Height - PaddingBottom;
end;

procedure TMenuController.MostrarEsconderSubMenusEspecificos(Sender: TFrame);
var
  contador: Integer;
begin

  for contador := 0 to Pred(FListaContainerSubMenu.Count) do
  begin
    if (TfrContainerSubMenu(FListaContainerSubMenu[contador]).Tag = TfrMenuItem(Sender).ID) then
    begin
      if not TfrContainerSubMenu(FListaContainerSubMenu[contador]).Visible then
      begin
        TfrContainerSubMenu(FListaContainerSubMenu[contador]).BringToFront;
        TfrContainerSubMenu(FListaContainerSubMenu[contador]).Visible := not TfrContainerSubMenu(FListaContainerSubMenu[contador]).Visible;
      end;
    end
    else
    begin
      if TfrContainerSubMenu(FListaContainerSubMenu[contador]).Visible then
        TfrContainerSubMenu(FListaContainerSubMenu[contador]).Visible := False;
    end;
  end;
end;

function TMenuController.BuscarMenu(ID: Integer): TfrMenuItem;
var
  Contador: Integer;
begin
  Result := nil;

  for Contador := 0 to Pred(fListaMenu.Count) do
  begin
    if TfrMenuItem(fListaMenu[Contador]).ID = ID then
    begin
      Result := TfrMenuItem(fListaMenu[Contador]);
      Break;
    end;
  end;

end;

end.
