unit MenuItemBase;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, MenuTipos;

type
  TfrMenuItemBase = class(TFrame)
    pnContainer: TPanel;
    procedure pnContainerEnter(Sender: TObject);
    procedure pnContainerExit(Sender: TObject);
  private
    FID: Integer;
    FEvMenuEnter: TEvMenuEnter;
    FEvMenuExit: TEvMenuExit;
    procedure SetID(const Value: Integer);
    procedure SetEvMenuEnter(const Value: TEvMenuEnter);
    procedure SetEvMenuExit(const Value: TEvMenuExit);
    { Private declarations }
  public
    property ID: Integer read FID write SetID;
    property EvMenuEnter: TEvMenuEnter read FEvMenuEnter write SetEvMenuEnter;
    property EvMenuExit: TEvMenuExit read FEvMenuExit write SetEvMenuExit;
  end;

implementation

{$R *.dfm}

{ TfrMenuItemBase }

procedure TfrMenuItemBase.SetEvMenuEnter(const Value: TEvMenuEnter);
begin
  FEvMenuEnter := Value;
end;

procedure TfrMenuItemBase.SetEvMenuExit(const Value: TEvMenuExit);
begin
  FEvMenuExit := Value;
end;

procedure TfrMenuItemBase.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TfrMenuItemBase.pnContainerEnter(Sender: TObject);
begin
  //if Assigned(EvMenuEnter) then
  //  EvMenuEnter;
end;

procedure TfrMenuItemBase.pnContainerExit(Sender: TObject);
begin
  //if Assigned(EvMenuExit) then
   // EvMenuExit;
end;

end.
