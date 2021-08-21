unit MenuParametros;

interface

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
  end;

  TMenuParametros = class(TInterfacedObject, iMenuParametros)
  private
    fAlturaMenu: Integer;
    fLarguraMenu: Integer;
    fLarguraSubMenu: Integer;
    fAlturaSubMenu: Integer;
    fMenuMargemDireita: Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iMenuParametros;
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

function TMenuParametros.GetAlturaMenu: Integer;
begin
  Result := fAlturaMenu;
end;

function TMenuParametros.GetAlturaSubMenu: Integer;
begin
  Result := fAlturaSubMenu;
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