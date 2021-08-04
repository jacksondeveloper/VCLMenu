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
    procedure CriarNovoContainer(IDMenuItem, Topo, Largura: Integer);
    property ContainerSubMenu: TList read GetContainerSubMenu write SetContainerSubMenu;
  end;

implementation

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
  ID, TopoSubMenu: Integer;
begin
  Result := Self;

  if fListaSubMenu.Count > 0 then
    TopoSubMenu := TfrMenuSubItem(fListaSubMenu[Pred(fListaSubMenu.Count)]).Top +
                TfrMenuSubItem(fListaSubMenu[Pred(fListaSubMenu.Count)]).Height
  else
    TopoSubMenu := 0;

  { Cria o container para cada menu, onde o id do menu for diferente da tag do panel, para identificar
    quando é necessário criar um novo container para armazenas os submenus }
  if (FListaContainerSubMenu.Count <= 0) or
    (TPanel(FListaContainerSubMenu[Pred(FListaContainerSubMenu.Count)]).Tag <> TfrMenuItem(fListaMenu[Pred(fListaMenu.Count)]).ID) then
  begin
    TopoSubMenu := 0;
    CriarNovoContainer(TfrMenuItem(fListaMenu[Pred(fListaMenu.Count)]).ID, TfrMenuItem(fListaMenu[Pred(fListaMenu.Count)]).Top, LarguraSubMenu);
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
  SubMenuItem.Top := TopoSubMenu;
  SubMenuItem.pnContainer.Color := clGreen;
  SubMenuItem.lbPrincipal.Caption := Caption;

  if (TPanel(FListaContainerSubMenu[Pred(FListaContainerSubMenu.Count)]).Top <> 0) and
     (TPanel(FListaContainerSubMenu[Pred(FListaContainerSubMenu.Count)]).Height >= (GetAlturaMaximaContainer)) then
    TPanel(FListaContainerSubMenu[Pred(FListaContainerSubMenu.Count)]).Top := TPanel(FListaContainerSubMenu[Pred(FListaContainerSubMenu.Count)]).Top - SubMenuItem.Height;

  if (TPanel(FListaContainerSubMenu[Pred(FListaContainerSubMenu.Count)]).Top = 0) and
     (TPanel(FListaContainerSubMenu[Pred(FListaContainerSubMenu.Count)]).Height >= (GetAlturaMaximaContainer)) then
  begin
    TPanel(FListaContainerSubMenu[Pred(FListaContainerSubMenu.Count)]).Width := TPanel(FListaContainerSubMenu[Pred(FListaContainerSubMenu.Count)]).Width +
                                                                                SubMenuItem.Width;
  end
  else
  begin
    TPanel(FListaContainerSubMenu[Pred(FListaContainerSubMenu.Count)]).Height := SubMenuItem.Height +
        TPanel(FListaContainerSubMenu[Pred(FListaContainerSubMenu.Count)]).Height;
  end;

  fListaSubMenu.Add(SubMenuItem);
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

procedure TMenuController.CriarNovoContainer(IDMenuItem, Topo, Largura: Integer);
var
  Panel: TPanel;
begin
  Panel := TPanel.Create(Application);
  Panel.Tag := IDMenuItem; // Vincula o menu com o container submenu
  Panel.Parent := fSubMenuParent;
  Panel.Color := clRed;
  Panel.Visible := False;
  Panel.Top := Topo;
  Panel.Left := 0;
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
