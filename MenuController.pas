unit MenuController;

interface

uses
  Classes, SysUtils, MenuItem, MenuSubItem, Controls, MenuTipos, ExtCtrls, Forms,
  Graphics, Windows;

type

  iMenuParametros = interface
    ['{49D1E290-05CE-4DC6-B4CD-AB7E90C06271}']
    function SetAlturaMenu(Value: Integer): iMenuParametros;
    function GetAlturaMenu: Integer;
    function SetAlturaSubMenu(Value: Integer): iMenuParametros;
    function GetAlturaSubMenu: Integer;
  end;

  TMenuParametros = class(TInterfacedObject, iMenuParametros)
  private
    fAlturaMenu: Integer;
    fAlturaSubMenu: Integer;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iMenuParametros;
    function SetAlturaMenu(Value: Integer): iMenuParametros;
    function GetAlturaMenu: Integer;
    function SetAlturaSubMenu(Value: Integer): iMenuParametros;
    function GetAlturaSubMenu: Integer;
  end;

  iMenuController = interface
    ['{1C9623C4-8C0A-44A6-A1F6-9B1F4E279ECA}']
    procedure GerarMenu;
    function AdicionarMenu(Caption: string; Imagem: TPicture = nil): iMenuController;
    function AdicionarSubMenu(Caption: string; EvSubMenuClick: TEvMenuClick = nil; Imagem: TPicture = nil): iMenuController;
    procedure EsconderSubMenus;
  end;

  TMenuController = class(TInterfacedObject, iMenuController)
  private
    fMenuParametros: iMenuParametros;
    fMenuContainer: TWinControl;
    fSubMenuParent: TWinControl;
    fListaMenu: TList;
    fListaSubMenu: TList;
    fListaContainerSubMenu: TList;
    procedure SetContainerSubMenu(const Value: TList);
    function GetContainerSubMenu: TList;
    function GetAlturaMaximaContainer: Integer;
    procedure MostrarEsconderSubMenusEspecificos(Sender: TObject);
    procedure OrganizarSubmenusNoContainer;
    function BuscarMenu(ID: Integer): TfrMenuItem;
  public
    constructor Create(MenuContainer, SubMenuParent: TWinControl; MenuParametros: iMenuParametros);
    destructor Destroy; override;
    class function New(MenuContainer, SubMenuParent: TWinControl; MenuParametros: iMenuParametros): iMenuController;
    procedure GerarMenu;
    function AdicionarMenu(Caption: string; Imagem: TPicture = nil): iMenuController;
    function AdicionarSubMenu(Caption: string; EvSubMenuClick: TEvMenuClick = nil; Imagem: TPicture = nil): iMenuController;
    procedure EsconderSubMenus;
    procedure CriarNovoContainer(IDMenuItem, Topo, Largura, Left: Integer);
    property ContainerSubMenu: TList read GetContainerSubMenu write SetContainerSubMenu;
  end;

implementation

uses
  Principal;

{ TMenuController }

function TMenuController.AdicionarMenu(Caption: string; Imagem: TPicture = nil): iMenuController;
var
  MenuItem: TfrMenuItem;
  ID, TopoMenu: Integer;
begin
  Result := Self;

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
  MenuItem.EvMenuCLick := MostrarEsconderSubMenusEspecificos;
  MenuItem.Parent := fMenuContainer;

  // Dimensões
  MenuItem.Width := MenuItem.Parent.Width;
  MenuItem.Top := TopoMenu;
  if fMenuParametros.GetAlturaMenu > 0 then
    MenuItem.Height := fMenuParametros.GetAlturaMenu;

  // Visual
  MenuItem.DoubleBuffered := True;
  MenuItem.lbPrincipal.Caption := Caption;
  if Assigned(Imagem) then
    MenuItem.SetImagemPrincipal(Imagem);

  fListaMenu.Add(MenuItem);
end;

function TMenuController.AdicionarSubMenu(Caption: string; EvSubMenuClick: TEvMenuClick = nil; Imagem: TPicture = nil): iMenuController;
var
  SubMenuItem: TfrMenuSubItem;
  ID: Integer;
begin
  Result := Self;

  SubMenuItem := TfrMenuSubItem.Create(nil);

  // Identificador
  ID := fListaSubMenu.Count + 1;
  SubMenuItem.Name := 'SubMenuItem' + IntToStr(ID);
  SubMenuItem.ID := ID;

  // Eventos
  SubMenuItem.pnContainer.Color := clGray;
  SubMenuItem.EvMenuCLick := EvSubMenuClick;
  SubMenuItem.EvFecharSubMenus := EsconderSubMenus;

  // Controles
  SubMenuItem.IDMenuPai := TfrMenuItem(fListaMenu[Pred(fListaMenu.Count)]).ID; // ultimo menu pai
  SubMenuItem.Visible := True;

  // Dimensões
  SubMenuItem.Width := LarguraSubMenu;
  if fMenuParametros.GetAlturaSubMenu > 0 then
    SubMenuItem.Height := fMenuParametros.GetAlturaSubMenu;

  // Visual
  SubMenuItem.DoubleBuffered := True;
  SubMenuItem.lbPrincipal.Caption := Caption;
  if Assigned(Imagem) then
    SubMenuItem.SetImagemPrincipal(Imagem);

  fListaSubMenu.Add(SubMenuItem);
end;

procedure TMenuController.OrganizarSubmenusNoContainer;
var
  Contador: Integer;
  SubMenuAtual: TfrMenuSubItem;
  ContainerAtual: TPanel;
begin
  ContainerAtual := nil; // remove warning

  for Contador := 0 to Pred(fListaSubMenu.Count) do
  begin

    SubMenuAtual := TfrMenuSubItem(fListaSubMenu[Contador]);

    // Se for o primeiro item ou mudar o id do menu pai então deve criar um container novo para esse grupo de submenus
    if (Contador = 0) or (TPanel(fListaContainerSubMenu[Pred(fListaContainerSubMenu.Count)]).Tag <> SubMenuAtual.IDMenuPai) then
    begin
      CriarNovoContainer(SubMenuAtual.IDMenuPai, BuscarMenu(SubMenuAtual.IDMenuPai).Top, SubMenuAtual.Width, 0);
      ContainerAtual := TPanel(fListaContainerSubMenu[Pred(fListaContainerSubMenu.Count)]);
    end;

    // Se o container atingir o tamanho máximo permitido
    if (ContainerAtual.Height + SubMenuAtual.Height) >= GetAlturaMaximaContainer then
    begin

      // Se alcançou o tamanho máximo então já joga o menu para cima para não ficar em baixo e os outros em cima
      if ((ContainerAtual.Height + SubMenuAtual.Height) > GetAlturaMaximaContainer) then
        ContainerAtual.Top := 0;

      // Se alcançou o tamanho máximo e tiver espaço pra cima, vai subindo o menu
      if (ContainerAtual.Top > 0) and (ContainerAtual.Height < GetAlturaMaximaContainer) then
      begin
        ContainerAtual.Top := ContainerAtual.Top - SubMenuAtual.Height;
        ContainerAtual.Height := ContainerAtual.Height + SubMenuAtual.Height;
      end
      else
      begin
        // Cria novo subcontainer do lado direito pois já não cabe mais no atual
        CriarNovoContainer(SubMenuAtual.IDMenuPai, 0, SubMenuAtual.Width, ContainerAtual.Left + ContainerAtual.Width);
        ContainerAtual := TPanel(fListaContainerSubMenu[Pred(fListaContainerSubMenu.Count)]);
        ContainerAtual.Height := ContainerAtual.Height + SubMenuAtual.Height;
      end;

    end
    else
    begin
      // Aumenta o tamanho do container para colocar o menu dentro, caminho feliz
      ContainerAtual.Height := ContainerAtual.Height + SubMenuAtual.Height;
    end;

    SubMenuAtual.Parent := ContainerAtual;
    SubMenuAtual.Top := ContainerAtual.Height - SubMenuAtual.Height;

    DOLog('Container: ' + IntToStr(ContainerAtual.Tag) + ' Top: ' + IntToStr(ContainerAtual.Top) + ' Left: ' + IntToStr(ContainerAtual.Left));
    DOLog('Submenu: ' + SubMenuAtual.lbPrincipal.Caption + ' Top: ' + IntToStr(SubMenuAtual.Top) + ' Left: ' + IntToStr(SubMenuAtual.Left));
    DOLog('');
  end;

end;

procedure TMenuController.EsconderSubMenus;
var
  Contador: integer;
begin
  for Contador := 0 to Pred(FListaContainerSubMenu.Count) do
    TPanel(FListaContainerSubMenu[Contador]).Visible := False;
end;

constructor TMenuController.Create(MenuContainer, SubMenuParent: TWinControl; MenuParametros: iMenuParametros);
begin
  fMenuParametros := MenuParametros;
  fMenuContainer := MenuContainer;
  fSubMenuParent := SubMenuParent;
  fListaMenu := TList.Create;
  fListaSubMenu := TList.Create;
  FListaContainerSubMenu := TList.Create;
end;

procedure TMenuController.CriarNovoContainer(IDMenuItem, Topo, Largura, Left: Integer);
var
  Panel: TPanel;
begin
  Panel := TPanel.Create(Application);
  Panel.DoubleBuffered := True;
  Panel.Tag := IDMenuItem; // Vincula o menu com o container submenu
  Panel.Parent := fSubMenuParent;
  Panel.Name := 'ContainerSub' + IntToStr(FListaContainerSubMenu.Count + 1);
  Panel.Color := clRed;
  Panel.Visible := False;
  Panel.Top := Topo;
  Panel.Left := Left;
  Panel.Height := 0;
  Panel.Width := Largura;
  FListaContainerSubMenu.Add(Panel);
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

procedure TMenuController.MostrarEsconderSubMenusEspecificos(Sender: TObject);
var
  contador: Integer;
begin

  for contador := 0 to Pred(FListaContainerSubMenu.Count) do
  begin
    if (TPanel(FListaContainerSubMenu[contador]).Tag = TfrMenuItem(Sender).ID) then
    begin
      TPanel(FListaContainerSubMenu[contador]).BringToFront;
      TPanel(FListaContainerSubMenu[contador]).Visible := not TPanel(FListaContainerSubMenu[contador]).Visible;
    end
    else
      TPanel(FListaContainerSubMenu[contador]).Visible := False;
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

{ TMenuParametros }

constructor TMenuParametros.Create;
begin
end;

destructor TMenuParametros.Destroy;
begin

  inherited;
end;

function TMenuParametros.GetAlturaMenu: Integer;
begin
  Result := fAlturaMenu;
end;

function TMenuParametros.GetAlturaSubMenu: Integer;
begin
  Result := fAlturaSubMenu;
end;

class function TMenuParametros.New: iMenuParametros;
begin
  Result := Self.Create;
end;

function TMenuParametros.SetAlturaMenu(Value: Integer): iMenuParametros;
begin
  Result := Self;
  fAlturaMenu := Value;
end;

function TMenuParametros.SetAlturaSubMenu(Value: Integer): iMenuParametros;
begin
  Result := Self;
  fAlturaSubMenu := Value;
end;

end.
