unit MenuController;

interface

uses
  Classes, SysUtils, MenuItem, MenuSubItem, Controls, MenuTipos, ExtCtrls, Forms,
  Graphics;

type

  iMenuController = interface
    ['{1C9623C4-8C0A-44A6-A1F6-9B1F4E279ECA}']
    procedure GerarMenu;
    function AdicionarMenu(Caption: string): iMenuController;
    function AdicionarSubMenu(Caption: string): iMenuController;
  end;

  TMenuController = class(TInterfacedObject, iMenuController)
  private
    fMenuContainer: TWinControl;
    fSubMenuParent: TWinControl;
    fListaMenu: TList;
    fListaSubMenu: TList;
    FContainerSubMenu: TList;
    procedure SetContainerSubMenu(const Value: TList);
    function GetContainerSubMenu: TList;
  public
    constructor Create(MenuContainer, SubMenuParent: TWinControl);
    destructor Destroy; override;
    class function New(MenuContainer, SubMenuParent: TWinControl): iMenuController;
    procedure GerarMenu;
    function AdicionarMenu(Caption: string): iMenuController;
    function AdicionarSubMenu(Caption: string): iMenuController;
    procedure MostrarSubMenu;
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
  MenuItem.Parent := fMenuContainer;
  MenuItem.Width := fMenuContainer.Width;
  MenuItem.Top := TopoMenu;
  MenuItem.lbPrincipal.Caption := Caption;

  fListaMenu.Add(MenuItem);
end;

function TMenuController.AdicionarSubMenu(Caption: string): iMenuController;
var
  SubMenuItem: TfrMenuSubItem;
  ID, TopoMenu: Integer;
begin
  Result := Self;

  if FContainerSubMenu.Count <= 0 then
    CriarNovoContainer(TfrMenuItem(fListaMenu[Pred(fListaMenu.Count)]).ID, TfrMenuItem(fListaMenu[Pred(fListaMenu.Count)]).Top, LarguraSubMenu);

  if fListaSubMenu.Count > 0 then
    TopoMenu := TfrMenuSubItem(fListaSubMenu[Pred(fListaSubMenu.Count)]).Top +
                TfrMenuSubItem(fListaSubMenu[Pred(fListaSubMenu.Count)]).Height
  else
    TopoMenu := 0;

  SubMenuItem := TfrMenuSubItem.Create(nil);
  ID := fListaSubMenu.Count + 1;
  SubMenuItem.Name := 'SubMenuItem' + IntToStr(ID);
  SubMenuItem.ID := ID;
  SubMenuItem.Parent := TPanel(FContainerSubMenu[Pred(FContainerSubMenu.Count)]);
  SubMenuItem.IDMenuPai := TfrMenuItem(fListaMenu[Pred(fListaMenu.Count)]).ID; // ultimo menu pai
  SubMenuItem.Visible := False;
  SubMenuItem.Width := LarguraSubMenu;
  SubMenuItem.Top := TopoMenu;
  SubMenuItem.pnContainer.Color := clGreen;
  SubMenuItem.lbPrincipal.Caption := Caption;

  TPanel(FContainerSubMenu[Pred(FContainerSubMenu.Count)]).Height := SubMenuItem.Height +
      TPanel(FContainerSubMenu[Pred(FContainerSubMenu.Count)]).Height;

  fListaSubMenu.Add(SubMenuItem);    
end;

procedure TMenuController.MostrarSubMenu;
var
  contador: Integer;
begin

  for contador := 0 to Pred(fListaSubMenu.Count) do
  begin
    TfrMenuSubItem(fListaSubMenu[contador]).Visible := True;
  end;

  for contador := 0 to Pred(FContainerSubMenu.Count) do
  begin
    TPanel(FContainerSubMenu[contador]).Visible := True;
  end;
end;

constructor TMenuController.Create(MenuContainer, SubMenuParent: TWinControl);
begin
  fMenuContainer := MenuContainer;
  fSubMenuParent := SubMenuParent;
  fListaMenu := TList.Create;
  fListaSubMenu := TList.Create;
  FContainerSubMenu := TList.Create;
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
  FContainerSubMenu.Add(Panel);
end;

destructor TMenuController.Destroy;
begin
  FreeAndNil(fListaMenu);
  FreeAndNil(fListaSubMenu);
  FreeAndNil(FContainerSubMenu);
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

  MostrarSubMenu;
end;

function TMenuController.GetContainerSubMenu: TList;
begin
  Result := FContainerSubMenu;
end;

class function TMenuController.New(MenuContainer, SubMenuParent: TWinControl): iMenuController;
begin
  Result := Self.Create(MenuContainer, SubMenuParent);
end;

procedure TMenuController.SetContainerSubMenu(const Value: TList);
begin
  FContainerSubMenu := Value;
end;

end.
