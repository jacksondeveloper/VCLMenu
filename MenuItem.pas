unit MenuItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MenuItemBase, ExtCtrls, StdCtrls, MenuTipos;

type
  TfrMenuItem = class(TfrMenuItemBase)
    pnEsquerdo: TPanel;
    pnPrincipal: TPanel;
    lbPrincipal: TLabel;
    imgPrincipal: TImage;
    pnSeparadorEsquerdo: TPanel;
    procedure pnContainerClick(Sender: TObject);
  private
    FEvAfterClick: TEvAfterClick;
    FEvMaximizarMenu: TEvMaximizarMenu;
    FAbrirMouseEnter: Boolean;
    FLarguraMenu: Integer;
    FPossuiSubmenu: Boolean;
    procedure SetEvMaximizarMenu(const Value: TEvMaximizarMenu);
    procedure SetAbrirMouseEnter(const Value: Boolean);
    procedure SetEvAfterClick(const Value: TEvAfterClick);
    procedure SetPossuiSubmenu(const Value: Boolean);
  public
    procedure SetImagemPrincipal(const Value: TPicture);
    procedure MouseEnter(var Msg : TMessage);  Message cm_mouseEnter;
    Procedure MouseLeave (Var MSG: TMessage);  Message cm_mouseLeave;
    property EvAfterClick: TEvAfterClick read FEvAfterClick write SetEvAfterClick;
    property AbrirMouseEnter: Boolean read FAbrirMouseEnter write SetAbrirMouseEnter;
    property EvMaximizarMenu: TEvMaximizarMenu read FEvMaximizarMenu write SetEvMaximizarMenu;
    property PossuiSubmenu: Boolean read FPossuiSubmenu write SetPossuiSubmenu;
  end;

var
  frMenuItem: TfrMenuItem;

implementation

{$R *.dfm}

procedure TfrMenuItem.SetImagemPrincipal(const Value: TPicture);
begin
  imgPrincipal.Picture := Value;
end;

procedure TfrMenuItem.MouseEnter(var Msg: TMessage);
begin
  inherited;
  if AbrirMouseEnter then
    if Assigned(EvMenuCLick) then
    begin
      if Assigned(EvMaximizarMenu) then
        EvMaximizarMenu;
        
      EvMenuCLick(Self);
    end;
end;

procedure TfrMenuItem.MouseLeave(var MSG: TMessage);
begin
  inherited;
end;

procedure TfrMenuItem.SetEvMaximizarMenu(const Value: TEvMaximizarMenu);
begin
  FEvMaximizarMenu := Value;
end;

procedure TfrMenuItem.pnContainerClick(Sender: TObject);
begin
  if Assigned(EvMaximizarMenu) then
    EvMaximizarMenu;
    
  inherited;

  if Assigned(EvAfterClick) then
    EvAfterClick(Self);
end;

procedure TfrMenuItem.SetAbrirMouseEnter(const Value: Boolean);
begin
  FAbrirMouseEnter := Value;
end;

procedure TfrMenuItem.SetEvAfterClick(const Value: TEvAfterClick);
begin
  FEvAfterClick := Value;
end;

procedure TfrMenuItem.SetPossuiSubmenu(const Value: Boolean);
begin
  FPossuiSubmenu := Value;
end;

end.
