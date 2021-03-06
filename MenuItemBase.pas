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
    FEvMenuCLick: TEvMenuClick;
    FCorPadrao: TColor;
    FCorSelecionado: TColor;
    procedure SetID(const Value: Integer);
    procedure SetEvMenuCLick(const Value: TEvMenuClick);
    procedure SetCorPadrao(const Value: TColor);
    procedure SetCorSelecionado(const Value: TColor);
  public
    property ID: Integer read FID write SetID;
    property EvMenuCLick: TEvMenuClick read FEvMenuCLick write SetEvMenuCLick;
    property CorPadrao: TColor read FCorPadrao write SetCorPadrao;
    property CorSelecionado: TColor read FCorSelecionado write SetCorSelecionado;
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
  if CorSelecionado <> 0 then
    if pnContainer.Color <> CorSelecionado then
      pnContainer.Color := CorSelecionado;
end;

procedure TfrMenuItemBase.MouseLeave(var MSG: TMessage);
begin
  if CorPadrao <> 0 then 
    if pnContainer.Color <> CorPadrao then
      pnContainer.Color := CorPadrao;
end;

procedure TfrMenuItemBase.SetCorPadrao(const Value: TColor);
begin
  pnContainer.Color := Value;
  FCorPadrao := Value;
end;

procedure TfrMenuItemBase.SetCorSelecionado(const Value: TColor);
begin
  FCorSelecionado := Value;
end;

end.
