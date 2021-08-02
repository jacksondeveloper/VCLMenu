unit MenuItemBase;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, MenuTipos;

type
  TfrMenuItemBase = class(TFrame)
    pnContainer: TPanel;
    procedure pnContainerClick(Sender: TObject);
  private
    FID: Integer;
    FEvCLick: TEvClick;
    procedure SetID(const Value: Integer);
    procedure SetEvCLick(const Value: TEvClick);
  public
    property ID: Integer read FID write SetID;
    property EvCLick: TEvClick read FEvCLick write SetEvCLick;
  end;

implementation

{$R *.dfm}

{ TfrMenuItemBase }

procedure TfrMenuItemBase.SetEvCLick(const Value: TEvClick);
begin
  FEvCLick := Value;
end;

procedure TfrMenuItemBase.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TfrMenuItemBase.pnContainerClick(Sender: TObject);
begin
  if Assigned(EvCLick) then
    EvCLick(Self.ID);
end;

end.
