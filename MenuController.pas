unit MenuController;

interface

uses
  Classes, SysUtils, MenuItem, MenuSubItem, Controls, MenuTipos, ExtCtrls, Forms,
  Graphics, Windows;

type

  iMenuController = interface
    ['{1C9623C4-8C0A-44A6-A1F6-9B1F4E279ECA}']
    procedure GerarMenu;
    function AdicionarMenu(Caption: string): iMenuController;
    function AdicionarSubMenu(Caption: string): iMenuController;
    procedure EsconderSubMenus;
  end;

  TMenuController = class(TInterfacedObject, iMenuController)
  private
    fMenuContainer: TWinControl;
    fSubMenuParent: TWinControl;
    fListaMenu: TList;
    fListaSubMenu: TList;
    FListaContainerSubMenu: TList;
    procedure SetContainerSubMenu(const Value: TList);
    function GetContainerSubMenu: TList;
    function GetAlturaMaximaContainer: Integer;
  public
    constructor Create(MenuContainer, SubMenuParent: TWinControl);
    destructor Destroy; override;
    class function New(MenuContainer, SubMenuParent: TWinControl): iMenuController;
    procedure GerarMenu;
    function AdicionarMenu(Caption: string): iMenuController;
    function AdicionarSubMenu(Caption: string): iMenuController;
    procedure MostrarSubMenu(ID: Integer);
    procedure EsconderSubMenus;
    procedure CriarNovoContainer(IDMenuItem, Topo, Largura, Left: Integer);
    property ContainerSubMenu: TList read GetContainerSubMenu write SetContainerSubMenu;
  end;

implementation

uses
  Principal;

{ TMenuController }

function TMenuController.AdicionarMenu(Caption: string): iMenuController;
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
  MenuItem.Visible := False;
  MenuItem.EvClick := MostrarSubMenu;
  MenuItem.Parent := fMenuContainer;
  MenuItem.Width := fMenuContainer.Width;
  MenuItem.Top := TopoMenu;
  MenuItem.lbPrincipal.Caption := Caption;

  fListaMenu.Add(MenuItem);
end;

function TMenuController.AdicionarSubMenu(Caption: string): iMenuController;
var
  SubMenuItem: TfrMenuSubItem;
  ID, NovoTopoContainer: Integer;
begin
  Result := Self;

  { Cria o container para cada menu, onde o id do menu for diferente da tag do panel, para identificar
    quando é necessário criar um novo container para armazenas os submenus }
  if (FListaContainerSubMenu.Count <= 0) or
    (TPanel(FListaContainerSubMenu[Pred(FListaContainerSubMenu.Count)]).Tag <> TfrMenuItem(fListaMenu[Pred(fListaMenu.Count)]).ID) then
  begin
    CriarNovoContainer(TfrMenuItem(fListaMenu[Pred(fListaMenu.Count)]).ID, TfrMenuItem(fListaMenu[Pred(fListaMenu.Count)]).Top, LarguraSubMenu, 0);
  end;

  SubMenuItem := TfrMenuSubItem.Create(nil);
  ID := fListaSubMenu.Count + 1;
  SubMenuItem.Name := 'SubMenuItem' + IntToStr(ID);
  SubMenuItem.ID := ID;
  SubMenuItem.EvFecharSubMenus := EsconderSubMenus;
  SubMenuItem.Parent := TPanel(FListaContainerSubMenu[Pred(FListaContainerSubMenu.Count)]);
  SubMenuItem.IDMenuPai := TfrMenuItem(fListaMenu[Pred(fListaMenu.Count)]).ID; // ultimo menu pai
  SubMenuItem.Visible := False;
  SubMenuItem.Width := LarguraSubMenu;

  // Se forem submenus de outro menu então já volta o topo do submenu para 0 para fica em cima
  if (fListaSubMenu.Count <= 0) or
     (SubMenuItem.IDMenuPai <> TfrMenuSubItem(fListaSubMenu[Pred(fListaSubMenu.Count)]).IDMenuPai) then
  begin
    SubMenuItem.Top := 0;
    SubMenuItem.Left := 0;
  end
  else
  begin
    SubMenuItem.Top := TfrMenuSubItem(fListaSubMenu[Pred(fListaSubMenu.Count)]).Top + TfrMenuSubItem(fListaSubMenu[Pred(fListaSubMenu.Count)]).Height;
    SubMenuItem.Left := TfrMenuSubItem(fListaSubMenu[Pred(fListaSubMenu.Count)]).Left;
  end;

  SubMenuItem.pnContainer.Color := clGreen;
  SubMenuItem.lbPrincipal.Caption := Caption;

  // Se o container chegar no na altura máxima, vai jogando ele pra cima até chegar no topo
  if (TPanel(FListaContainerSubMenu[Pred(FListaContainerSubMenu.Count)]).Top <> 0) and
     (TPanel(FListaContainerSubMenu[Pred(FListaContainerSubMenu.Count)]).Height >= (GetAlturaMaximaContainer)) then
    TPanel(FListaContainerSubMenu[Pred(FListaContainerSubMenu.Count)]).Top := TPanel(FListaContainerSubMenu[Pred(FListaContainerSubMenu.Count)]).Top - SubMenuItem.Height;

  if ((SubMenuItem.Top + SubMenuItem.Height) > GetAlturaMaximaContainer) then
  begin
    // Recalcula o topo do subcontainer caso já seja o segundo subcontainer do mesmo menu, evitar container quebrado no meio
    if (TPanel(FListaContainerSubMenu[Pred(Pred(FListaContainerSubMenu.Count))]).Tag = TPanel(FListaContainerSubMenu[Pred(FListaContainerSubMenu.Count)]).Tag) then
      NovoTopoContainer := TPanel(FListaContainerSubMenu[Pred(Pred(FListaContainerSubMenu.Count))]).Top
    else
      NovoTopoContainer := TfrMenuItem(fListaMenu[Pred(fListaMenu.Count)]).Top;

    // Se encheu o container de submenus então cria um novo 
    if ((TPanel(FListaContainerSubMenu[Pred(FListaContainerSubMenu.Count)]).Parent.Height - TPanel(FListaContainerSubMenu[Pred(FListaContainerSubMenu.Count)]).Height ) > SubMenuItem.Height) then
    begin
      if TPanel(FListaContainerSubMenu[Pred(FListaContainerSubMenu.Count)]).Top <> 0 then
        TPanel(FListaContainerSubMenu[Pred(FListaContainerSubMenu.Count)]).Top := TPanel(FListaContainerSubMenu[Pred(FListaContainerSubMenu.Count)]).Top - SubMenuItem.Height;
    end
    else
    begin
      CriarNovoContainer(TfrMenuItem(fListaMenu[Pred(fListaMenu.Count)]).ID,
                                     NovoTopoContainer, LarguraSubMenu,
                                     TPanel(FListaContainerSubMenu[Pred(FListaContainerSubMenu.Count)]).Left +
                                     TPanel(FListaContainerSubMenu[Pred(FListaContainerSubMenu.Count)]).Width);
      SubMenuItem.Parent := TPanel(FListaContainerSubMenu[Pred(FListaContainerSubMenu.Count)]);
      SubMenuItem.Left := 0;
      SubMenuItem.Top := 0;
    end;
  end;

  // Aumenta altura do subcontainer para caber o item que vai ser adicionado
  TPanel(FListaContainerSubMenu[Pred(FListaContainerSubMenu.Count)]).Height := SubMenuItem.Height + TPanel(FListaContainerSubMenu[Pred(FListaContainerSubMenu.Count)]).Height;

  fListaSubMenu.Add(SubMenuItem);

  DOLog('->' + SubMenuItem.lbPrincipal.Caption + ': Altura ' + IntToStr(SubMenuItem.Height) + ' Topo ' + IntToStr(SubMenuItem.Top));
  DOLog('---->' + TPanel(FListaContainerSubMenu[Pred(FListaContainerSubMenu.Count)]).Name + ': Altura ' + IntToStr(TPanel(FListaContainerSubMenu[Pred(FListaContainerSubMenu.Count)]).Height) + ' Topo: ' + IntToStr(TPanel(FListaContainerSubMenu[Pred(FListaContainerSubMenu.Count)]).Top));
  DOLog('-> TamanhoMáximo: ' + IntToStr(GetAlturaMaximaContainer));
  DOLog('');
end;

procedure TMenuController.MostrarSubMenu(ID: Integer);
var
  contador: Integer;
begin

  for contador := 0 to Pred(fListaSubMenu.Count) do
  begin
    TfrMenuSubItem(fListaSubMenu[contador]).Visible := True;
    TfrMenuSubItem(fListaSubMenu[contador]).BringToFront;
  end;

  for contador := 0 to Pred(FListaContainerSubMenu.Count) do
  begin
    TPanel(FListaContainerSubMenu[contador]).Visible := (TPanel(FListaContainerSubMenu[contador]).Tag = ID)
  end;

end;

procedure TMenuController.EsconderSubMenus;
var
  Contador: integer;
begin
  for Contador := 0 to Pred(FListaContainerSubMenu.Count) do
    TPanel(FListaContainerSubMenu[Contador]).Visible := False;
end;

constructor TMenuController.Create(MenuContainer, SubMenuParent: TWinControl);
begin
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
  for contador := 0 to Pred(fListaMenu.Count) do
  begin
    TfrMenuItem(fListaMenu[contador]).Visible := True;
  end;
end;

function TMenuController.GetContainerSubMenu: TList;
begin
  Result := FListaContainerSubMenu;
end;

class function TMenuController.New(MenuContainer, SubMenuParent: TWinControl): iMenuController;
begin
  Result := Self.Create(MenuContainer, SubMenuParent);
end;

procedure TMenuController.SetContainerSubMenu(const Value: TList);
begin
  FListaContainerSubMenu := Value;
end;

function TMenuController.GetAlturaMaximaContainer: Integer;
begin
  Result := fSubMenuParent.Height - 100;
end;

end.
