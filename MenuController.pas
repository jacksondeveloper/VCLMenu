unit MenuController;

interface

type

  iMenuController = interface
    ['{1C9623C4-8C0A-44A6-A1F6-9B1F4E279ECA}']
  end;

  TMenuController = class(TInterfacedObject, iMenuController)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iMenuController;
  end;

implementation

{ TMenuController }

constructor TMenuController.Create;
begin

end;

destructor TMenuController.Destroy;
begin

  inherited;
end;

class function TMenuController.New: iMenuController;
begin
  Result := Self.Create;
end;

end.
