unit MenuParametros;

interface

uses
  MenuTipos;

type

  iMenuParametros = interface
    ['{49D1E290-05CE-4DC6-B4CD-AB7E90C06271}']
    function SetAlturaMenu(Value: Integer): iMenuParametros;
    function GetAlturaMenu: Integer;
    function SetLarguraMenu(Value: Integer): iMenuParametros;
    function GetLarguraMenu: Integer;
    function SetLarguraSubMenu(Value: Integer): iMenuParametros;
    function GetLarguraSubMenu: Integer;
    function SetAlturaSubMenu(Value: Integer): iMenuParametros;
    function GetAlturaSubMenu: Integer;
    function SetMenuMargemDireita(Value: Boolean): iMenuParametros;
    function GetMenuMargemDireita: Boolean;
    function SetEvMinimizarMenu(Value: TEvMinimizarMenu): iMenuParametros;
    function GetEvMinimizarMenu: TEvMinimizarMenu;
    function SetEvMaximizarMenu(Value: TEvMaximizarMenu): iMenuParametros;
    function GetEvMaximizarMenu: TEvMaximizarMenu;
    function SetEvClickSubmenuView(Value: TEvClickSubmenuView): iMenuParametros;
    function GetEvClickSubmenuView: TEvClickSubmenuView;
    function SetAbrirMouseEnter(Value: Boolean): iMenuParametros;
    function GetAbrirMouseEnter: Boolean;
  end;

  TMenuParametros = class(TInterfacedObject, iMenuParametros)
  private
    FAlturaMenu: Integer;
    FLarguraMenu: Integer;
    FLarguraSubMenu: Integer;
    FAlturaSubMenu: Integer;
    FMenuMargemDireita: Boolean;
    FEvMinimizarMenu: TEvMinimizarMenu;
    FEvMaximizarMenu: TEvMaximizarMenu;
    FEvClickSubmenuView: TEvClickSubmenuView;
    FAbrirMouseEnter: Boolean;
    function SetAlturaMenu(Value: Integer): iMenuParametros;
    function GetAlturaMenu: Integer;
    function SetLarguraMenu(Value: Integer): iMenuParametros;
    function GetLarguraMenu: Integer;
    function SetLarguraSubMenu(Value: Integer): iMenuParametros;
    function GetLarguraSubMenu: Integer;
    function SetAlturaSubMenu(Value: Integer): iMenuParametros;
    function GetAlturaSubMenu: Integer;
    function SetMenuMargemDireita(Value: Boolean): iMenuParametros;
    function GetMenuMargemDireita: Boolean;
    function SetEvMinimizarMenu(Value: TEvMinimizarMenu): iMenuParametros;
    function GetEvMinimizarMenu: TEvMinimizarMenu;
    function SetEvMaximizarMenu(Value: TEvMaximizarMenu): iMenuParametros;
    function GetEvMaximizarMenu: TEvMaximizarMenu;
    function SetEvClickSubmenuView(Value: TEvClickSubmenuView): iMenuParametros;
    function GetEvClickSubmenuView: TEvClickSubmenuView;
    function SetAbrirMouseEnter(Value: Boolean): iMenuParametros;
    function GetAbrirMouseEnter: Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iMenuParametros;
  end;

implementation

{ TMenuParametros }

constructor TMenuParametros.Create;
begin
end;

destructor TMenuParametros.Destroy;
begin

  inherited;
end;

function TMenuParametros.GetAbrirMouseEnter: Boolean;
begin
  Result := FAbrirMouseEnter;
end;

function TMenuParametros.GetAlturaMenu: Integer;
begin
  Result := fAlturaMenu;
end;

function TMenuParametros.GetAlturaSubMenu: Integer;
begin
  Result := fAlturaSubMenu;
end;

function TMenuParametros.GetEvClickSubmenuView: TEvClickSubmenuView;
begin
  Result := FEvClickSubmenuView;
end;

function TMenuParametros.GetEvMaximizarMenu: TEvMaximizarMenu;
begin
  Result := FEvMaximizarMenu;
end;

function TMenuParametros.GetEvMinimizarMenu: TEvMinimizarMenu;
begin
  Result := FEvMinimizarMenu;
end;

function TMenuParametros.GetLarguraMenu: Integer;
begin
  Result := fLarguraMenu;
end;

function TMenuParametros.GetLarguraSubMenu: Integer;
begin
  Result := fLarguraSubMenu;
end;

function TMenuParametros.GetMenuMargemDireita: Boolean;
begin
  Result := fMenuMargemDireita;
end;

class function TMenuParametros.New: iMenuParametros;
begin
  Result := Self.Create;
end;

function TMenuParametros.SetAbrirMouseEnter(Value: Boolean): iMenuParametros;
begin
  Result := Self;
  FAbrirMouseEnter := Value;
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

function TMenuParametros.SetEvClickSubmenuView(Value: TEvClickSubmenuView): iMenuParametros;
begin
  Result := Self;
  FEvClickSubmenuView := Value;
end;

function TMenuParametros.SetEvMaximizarMenu(Value: TEvMaximizarMenu): iMenuParametros;
begin
  Result := Self;
  FEvMaximizarMenu := Value;
end;

function TMenuParametros.SetEvMinimizarMenu(Value: TEvMinimizarMenu): iMenuParametros;
begin
  Result := Self;
  FEvMinimizarMenu := Value;
end;

function TMenuParametros.SetLarguraMenu(Value: Integer): iMenuParametros;
begin
  Result := Self;
  fLarguraMenu := Value;
end;

function TMenuParametros.SetLarguraSubMenu(Value: Integer): iMenuParametros;
begin
  Result := Self;
  fLarguraSubMenu := Value;
end;

function TMenuParametros.SetMenuMargemDireita(Value: Boolean): iMenuParametros;
begin
  Result := Self;
  fMenuMargemDireita := Value;
end;

end.
