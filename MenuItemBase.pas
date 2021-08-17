unit MenuItemBase;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, MenuTipos;

type
  TfrMenuItemBase = class(TFrame)
    pnContainer: TPanel;
    pnMargemEsquerda: TPanel;
    pnMargemDireita: TPanel;
    pnMargemSuperior: TPanel;
    pnMargemInferior: TPanel;
    procedure pnContainerClick(Sender: TObject);
  private
    FID: Integer;
    FEvCLick: TEvMenuClick;
    FEvMenuCLick: TEvMenuClick;
    procedure SetID(const Value: Integer);
    procedure SetEvMenuCLick(const Value: TEvMenuClick);
  public
    property ID: Integer read FID write SetID;
    property EvMenuCLick: TEvMenuClick read FEvMenuCLick write SetEvMenuCLick;
    procedure MouseEnter(var Msg : TMessage);  Message cm_mouseEnter;
    Procedure MouseLeave (Var MSG: TMessage);  Message cm_mouseLeave;
  end;

implementation

{$R *.dfm}

{ TfrMenuItemBase }

procedure TfrMenuItemBase.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TfrMenuItemBase.pnContainerClick(Sender: TObject);
begin
  if Assigned(EvMenuCLick) then
    EvMenuCLick(Self);
end;

procedure TfrMenuItemBase.SetEvMenuCLick(const Value: TEvMenuClick);
begin
  FEvMenuCLick := Value;
end;

procedure TfrMenuItemBase.MouseEnter(var Msg: TMessage);
begin
  pnContainer.Color := clGray;
end;

procedure TfrMenuItemBase.MouseLeave(var MSG: TMessage);
begin
  pnContainer.Color := clWhite;
  OutputDebugString('passou no mouseleave');
end;

end.
