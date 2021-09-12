unit MenuController;

interface

uses
  Classes, SysUtils, MenuItem, MenuSubItem, Controls, MenuTipos, ExtCtrls, Forms,
  Graphics, Windows, MenuParametros, MenuContainerSubMenu;

type

  iMenuController = interface
    ['{1C9623C4-8C0A-44A6-A1F6-9B1F4E279ECA}']
    procedure GerarMenu;
    function AdicionarMenu(Caption: string; Imagem: TPicture = nil; VisibilidadeMenu: Boolean = True; EvMenuClick: TEvMenuClick = nil): iMenuController;
    function AdicionarSubMenu(Caption: string;
                              EvSubMenuClick: TEvMenuClick = nil;
                              FormRegistrado: String = '';
                              Imagem: TPicture = nil;
                              Visibilidade: Boolean = True): iMenuController;
    procedure EsconderSubMenus;
    procedure EsconderMenus;
    procedure MostrarEsconderMenu(Caption: String; Mostrar: Boolean);
    procedure ReorganizarMenus;
    procedure LimparMenu;
    function BuscarSubMenu(Caption: String): TFrame;
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
    function BuscarMenu(ID: Integer): TfrMenuItem; overload;
    function BuscarMenu(Caption: String): TFrame; overload;
    function BuscarSubMenu(Caption: String): TFrame;
    procedure ReorganizarSubmenus;
    procedure CriarListas;
    procedure LimparContainerMenu;
  public
    constructor Create(MenuContainer, SubMenuParent: TWinControl; MenuParametros: iMenuParametros);
    destructor Destroy; override;
    class function New(MenuContainer, SubMenuParent: TWinControl; MenuParametros: iMenuParametros): iMenuController;
    procedure GerarMenu;
    function AdicionarMenu(Caption: string; Imagem: TPicture = nil; VisibilidadeMenu: Boolean = True; EvMenuClick: TEvMenuClick = nil): iMenuController;
    function AdicionarSubMenu(Caption: string;
                              EvSubMenuClick: TEvMenuClick = nil;
                              FormRegistrado: String = '';
                              Imagem: TPicture = nil;
                              Visibilidade: Boolean = True): iMenuController;
    procedure EsconderSubMenus;
    procedure EsconderMenus;
    procedure MostrarEsconderMenu(Caption: String; Mostrar: Boolean);
    procedure ReorganizarMenus;
    procedure LimparMenu;
    procedure CriarNovoContainer(IDMenuItem, Topo, Largura, Left: Integer);
    property ContainerSubMenu: TList read GetContainerSubMenu write SetContainerSubMenu;
  end;

implementation

{ TMenuController }

function TMenuController.AdicionarMenu(Caption: string; Imagem: TPicture = nil; VisibilidadeMenu: Boolean = True; EvMenuClick: TEvMenuClick = nil): iMenuController;
var
  MenuItem: TfrMenuItem;
  ID, TopoMenu: Integer;
begin
  Result := Self;

  LimparContainerMenu; // corrige bug de recriar instancia via interface

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
  MenuItem.Parent := fMenuContainer;
  MenuItem.PossuiSubmenu := False;

  // Eventos
  if Assigned(EvMenuClick) then
    MenuItem.EvMenuCLick := EvMenuClick
  else
    MenuItem.EvMenuCLick := MostrarEsconderSubMenusEspecificos;
  MenuItem.AbrirMouseEnter := fMenuParametros.GetAbrirMouseEnter;
  MenuItem.EvMaximizarMenu := fMenuParametros.GetEvMaximizarMenu;
  MenuItem.EvAfterClick := fMenuParametros.GetEvAfterClickMenu;

  // Dimensões
  if fMenuParametros.GetAlturaMenu > 0 then
    MenuItem.Height :=  fMenuParametros.GetAlturaMenu;
  MenuItem.Width := MenuItem.Parent.Width;
  MenuItem.Top := TopoMenu;
  if fMenuParametros.GetAlturaMenu > 0 then
    MenuItem.Height := fMenuParametros.GetAlturaMenu;
  if fMenuParametros.GetLarguraMenu > 0 then
    MenuItem.Width := fMenuParametros.GetLarguraMenu;

  // Visual
  MenuItem.DoubleBuffered := True;
  MenuItem.lbPrincipal.Caption := Caption;
  if Assigned(Imagem) then
    MenuItem.SetImagemPrincipal(Imagem);

  // Fonte
  MenuItem.lbPrincipal.Font.Name := fMenuparametros.GetFonteNome;
  if fMenuParametros.GetFonteTamanho > 0 then
    MenuItem.lbPrincipal.Font.Size := fMenuParametros.GetFonteTamanho;
  if fMenuParametros.GetFonteEstilo <> [] then
    MenuItem.lbPrincipal.Font.Style := fMenuParametros.GetFonteEstilo;
  if fMenuParametros.GetFonteCor > 0 then
  MenuItem.lbPrincipal.Font.Color := fMenuParametros.GetFonteCor;

  // Cores
  MenuItem.CorPadrao := fMenuParametros.getCorPadrao;
  MenuItem.CorSelecionado := fMenuParametros.GetCorSelecionado;

  MenuItem.Visible := True;
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

  SubMenuItem := TfrMenuSubItem.Create(Nil);
  TfrMenuItem(fListaMenu[Pred(fListaMenu.Count)]).PossuiSubmenu := True;

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
  SubMenuItem.EvAfterClick := fMenuParametros.GetEvAfterClickSubmenu;

  // Controles
  SubMenuItem.IDMenuPai := TfrMenuItem(fListaMenu[Pred(fListaMenu.Count)]).ID; // ultimo menu pai
  SubMenuItem.Visible := True;

  // Dimensões
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

  // Fonte
  SubMenuItem.lbPrincipal.Font.Name := fMenuparametros.GetFonteNome;
  if fMenuParametros.GetFonteTamanho > 0 then
    SubMenuItem.lbPrincipal.Font.Size := fMenuParametros.GetFonteTamanho;
  if fMenuParametros.GetFonteEstilo <> [] then
    SubMenuItem.lbPrincipal.Font.Style := fMenuParametros.GetFonteEstilo;
  if fMenuParametros.GetFonteCor > 0 then
  SubMenuItem.lbPrincipal.Font.Color := fMenuParametros.GetFonteCor;

  // Cores
  SubMenuItem.CorPadrao := fMenuParametros.getCorPadrao;
  SubMenuItem.CorSelecionado := fMenuParametros.GetCorSelecionado;

  fListaSubMenu.Add(SubMenuItem);
end;

procedure TMenuController.OrganizarSubmenusNoContainer;
var
  Contador: Integer;
  SubMenuAtual: TfrMenuSubItem;
  ContainerAtual: TfrContainerSubMenu;
  TopoInicialContainer: Integer;
begin
  ContainerAtual := nil; // remove warning

  for Contador := 0 to Pred(fListaSubMenu.Count) do
  begin

    SubMenuAtual := TfrMenuSubItem(fListaSubMenu[Contador]);

    if not BuscarMenu(SubMenuAtual.IDMenuPai).Visible then
      Continue;
    if not SubMenuAtual.Visible then
      Continue;

    // Se for o primeiro item ou mudar o id do menu pai então deve criar um container novo para esse grupo de submenus
    if (Contador = 0) or (TfrContainerSubMenu(fListaContainerSubMenu[Pred(fListaContainerSubMenu.Count)]).Tag <> SubMenuAtual.IDMenuPai) then
    begin
      if fMenuParametros.GetAbrirSubmenuTopoZero then
        TopoInicialContainer := 0
      else
        TopoInicialContainer := BuscarMenu(SubMenuAtual.IDMenuPai).Top;

      CriarNovoContainer(SubMenuAtual.IDMenuPai, TopoInicialContainer, SubMenuAtual.Width, 0);
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
  CriarListas;
end;

procedure TMenuController.CriarNovoContainer(IDMenuItem, Topo, Largura, Left: Integer);
var
  Container: TfrContainerSubMenu;
begin
  Container := TfrContainerSubMenu.Create(Nil);
  Container.Top := -500; // Evita lag ao setar parent
  Container.Parent := fSubMenuParent;
  Container.Visible := False;
  Container.Top := Topo; // Evita lag ao setar parent
  Container.DoubleBuffered := True;
  Container.Tag := IDMenuItem; // Vincula o menu com o container submenu
  Container.Name := 'ContainerSub' + IntToStr(FListaContainerSubMenu.Count + 1);
  Container.Left := Left;
  Container.Height := 0;
  Container.Width := Largura;
  Container.pnMargemInferior.Visible := True;
  Container.pnMargemDireita.Visible := True;
  FListaContainerSubMenu.Add(Container);
end;

destructor TMenuController.Destroy;
begin
  if Assigned(fListaMenu) then
    FreeAndNil(fListaMenu);
  if Assigned(fListaSubMenu) then
    FreeAndNil(fListaSubMenu);
  if Assigned(FListaContainerSubMenu) then
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
      TfrContainerSubMenu(FListaContainerSubMenu[contador]).BringToFront;
      if not TfrContainerSubMenu(FListaContainerSubMenu[contador]).Visible then
      begin
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

procedure TMenuController.ReorganizarMenus;
var
  MenuItem: TfrMenuItem;
  Contador, TopoMenu: Integer;
begin
  TopoMenu := 0;

  for Contador := 0 to Pred(fListaMenu.Count) do
  begin
    MenuItem := TfrMenuItem(fListaMenu[Contador]);

    if not MenuItem.Visible then
      Continue;

    MenuItem.Top := TopoMenu;
    TopoMenu := TopoMenu + MenuItem.Height;

  end; 
end;

function TMenuController.BuscarMenu(Caption: String): TFrame;
var
  contador: Integer;
begin
  Result := nil;

  for contador := 0 to Pred(fListaMenu.Count) do
  begin
    if TfrMenuSubItem(fListaMenu[contador]).lbPrincipal.Caption = Caption then
    begin
      Result := TfrMenuSubItem(fListaMenu[contador]);
      Break;
    end;
  end;
end;

function TMenuController.BuscarSubMenu(Caption: String): TFrame;
var
  contador: Integer;
begin
  Result := nil;

  for contador := 0 to Pred(fListaSubMenu.Count) do
  begin
    if TfrMenuSubItem(fListaSubMenu[contador]).lbPrincipal.Caption = Caption then
    begin
      Result := TfrMenuSubItem(fListaSubMenu[contador]);
      Break;
    end;
  end;
end;

procedure TMenuController.EsconderMenus;
var
  contador: Integer;
begin
  if Assigned(fListaMenu) and (fListaMenu.Count > 0) then
    for contador := 0 to Pred(fListaMenu.Count) do
      TfrMenuItem(fListaMenu[contador]).Visible := False;
end;

procedure TMenuController.MostrarEsconderMenu(Caption: String; Mostrar: Boolean);
var
  contador: Integer;
begin
  if Assigned(fListaMenu) and (fListaMenu.Count > 0) then
  begin
    for contador := 0 to Pred(fListaMenu.Count) do
    begin
      if TfrMenuItem(fListaMenu[contador]).lbPrincipal.Caption = Caption then
      begin
        TfrMenuItem(fListaMenu[contador]).Visible := Mostrar;
        Break;
      end;
    end;
    ReorganizarMenus;
    ReorganizarSubmenus;
  end;
end;

procedure TMenuController.ReorganizarSubmenus;
var
  Contador1, Contador2: Integer;
  MenuAtual: TfrMenuItem;
begin
  if fMenuParametros.GetAbrirSubmenuTopoZero then
    Exit;

  for Contador1 := 0 to Pred(fListaMenu.Count) do
  begin

    MenuAtual := TfrMenuItem(fListaMenu[Contador1]);

    if not MenuAtual.Visible then
      Continue;

    for Contador2 := 0 to Pred(fListaContainerSubMenu.Count) do
    begin
      if TfrContainerSubMenu(fListaContainerSubMenu[Contador2]).Tag = MenuAtual.ID then
      begin
        TfrContainerSubMenu(fListaContainerSubMenu[Contador2]).Top := MenuAtual.Top;
      end;
    end;

  end;

end;

procedure TMenuController.LimparMenu;
var
  Contador: Integer;
begin

  if Assigned(fListaMenu) then
  begin
    for Contador := 0 to Pred(fListaMenu.Count) do
    begin
      if Assigned(TfrMenuItem(fListaMenu[Contador])) then
        TfrMenuItem(fListaMenu[Contador]).Free;
    end;

    fListaMenu.Clear;
    FreeAndNil(fListaMenu);
  end;

  if Assigned(fListaSubMenu) then
  begin
    for Contador := 0 to Pred(fListaSubMenu.Count) do
    begin
      if Assigned(TfrMenuSubItem(fListaSubMenu[Contador])) then
        TfrMenuSubItem(fListaSubMenu[Contador]).Free;
    end;

    fListaSubMenu.Clear;
    FreeAndNil(fListaSubMenu);
  end;

  if Assigned(fListaContainerSubMenu) then
  begin
    for Contador := 0 to Pred(fListaContainerSubMenu.Count) do
    begin
      if Assigned(TfrContainerSubMenu(fListaContainerSubMenu[Contador])) then
        TfrContainerSubMenu(fListaContainerSubMenu[Contador]).Free;
    end;

    fListaContainerSubMenu.Clear;
    FreeAndNil(fListaContainerSubMenu);
  end;
end;

procedure TMenuController.CriarListas;
begin
  if not Assigned(fListaMenu) then
    fListaMenu := TList.Create;
  if not Assigned(fListaSubMenu) then
    fListaSubMenu := TList.Create;
  if not Assigned(FListaContainerSubMenu) then
    FListaContainerSubMenu := TList.Create;
end;

procedure TMenuController.LimparContainerMenu;
var
  Contador: Integer;
begin
  if fListaMenu.Count = 0 then
    begin
      for Contador := 0 to Pred(fMenuContainer.ComponentCount) do
      begin
        if (fMenuContainer.Components[Contador] is TfrMenuItem) then
          (fMenuContainer.Components[Contador] as TfrMenuItem).Free;
      end;
    end;
end;

end.
