unit MenuController;

interface

uses
  Classes, SysUtils, ItemMenu, ItemSubMenu, Controls;

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
  ItemMenu: TfrItemMenu;
  TopoMenu: Integer;
begin
  Result := Self;

  if fListaMenu.Count > 0 then
    TopoMenu := TfrItemMenu(fListaMenu[Pred(fListaMenu.Count)]).Top +
                TfrItemMenu(fListaMenu[Pred(fListaMenu.Count)]).Height 
  else
    TopoMenu := 0;

  ItemMenu:= TfrItemMenu.Create(nil);
  ItemMenu.Visible := False;
  ItemMenu.Parent := fMenuContainer;
  ItemMenu.Width := fMenuContainer.Width;
  ItemMenu.Top := TopoMenu;
  ItemMenu.lbPrincipal.Caption := Caption;
  ItemMenu.Name := 'ItemMenu' + IntToStr(fListaMenu.Count + 1);

  fListaMenu.Add(ItemMenu);
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
    TfrItemMenu(fListaMenu[contador]).Visible := True;
  end;
end;

class function TMenuController.New(MenuContainer: TWinControl): iMenuController;
begin
  Result := Self.Create(MenuContainer);
end;

end.
