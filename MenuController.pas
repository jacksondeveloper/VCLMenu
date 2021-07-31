unit MenuController;

interface

uses
  Classes, SysUtils, MenuItem, MenuSubItem, Controls;

type

  iMenuController = interface
    ['{1C9623C4-8C0A-44A6-A1F6-9B1F4E279ECA}']
    procedure GerarMenu;
    function AdicionarMenu(Caption: string): iMenuController;
  end;

  TMenuController = class(TInterfacedObject, iMenuController)
  private
    fMenuContainer: TWinControl;
    fListaMenu: TList;
    fListaSubMenu: TList;
    fListaContainer: TList;
  public
    constructor Create(MenuContainer: TWinControl);
    destructor Destroy; override;
    class function New(MenuContainer: TWinControl): iMenuController;
    procedure GerarMenu;
    function AdicionarMenu(Caption: string): iMenuController;
  end;

implementation

{ TMenuController }

function TMenuController.AdicionarMenu(Caption: string): iMenuController;
var
  MenuItem: TfrMenuItem;
  TopoMenu: Integer;
begin
  Result := Self;

  if fListaMenu.Count > 0 then
    TopoMenu := TfrMenuItem(fListaMenu[Pred(fListaMenu.Count)]).Top +
                TfrMenuItem(fListaMenu[Pred(fListaMenu.Count)]).Height 
  else
    TopoMenu := 0;

  MenuItem:= TfrMenuItem.Create(nil);
  MenuItem.Visible := False;
  MenuItem.Parent := fMenuContainer;
  MenuItem.Width := fMenuContainer.Width;
  MenuItem.Top := TopoMenu;
  MenuItem.lbPrincipal.Caption := Caption;
  MenuItem.Name := 'MenuItem' + IntToStr(fListaMenu.Count + 1);

  fListaMenu.Add(MenuItem);
end;

constructor TMenuController.Create(MenuContainer: TWinControl);
begin
  fMenuContainer:= MenuContainer;
  fListaMenu := TList.Create;
  fListaSubMenu := TList.Create;
  fListaContainer := TList.Create;
end;

destructor TMenuController.Destroy;
begin
  FreeAndNil(fListaMenu);
  FreeAndNil(fListaSubMenu);
  FreeAndNil(fListaContainer);
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

class function TMenuController.New(MenuContainer: TWinControl): iMenuController;
begin
  Result := Self.Create(MenuContainer);
end;

end.
