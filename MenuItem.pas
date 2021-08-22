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
    FEvMaximizarMenu: TEvMaximizarMenu;
    procedure SetEvMaximizarMenu(const Value: TEvMaximizarMenu);
  public
    procedure SetImagemPrincipal(const Value: TPicture);
    procedure MouseEnter(var Msg : TMessage);  Message cm_mouseEnter;
    Procedure MouseLeave (Var MSG: TMessage);  Message cm_mouseLeave;
    property EvMaximizarMenu: TEvMaximizarMenu read FEvMaximizarMenu write SetEvMaximizarMenu;
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
  //if Assigned(EvMenuCLick) then
  //  EvMenuCLick(Self);
end;

procedure TfrMenuItem.MouseLeave(var MSG: TMessage);
begin
  //if Assigned(EvMenuCLick) then
  //  EvMenuCLick(Self);
end;

procedure TfrMenuItem.SetEvMaximizarMenu(const Value: TEvMaximizarMenu);
begin
  FEvMaximizarMenu := Value;
end;

procedure TfrMenuItem.pnContainerClick(Sender: TObject);
begin
  if Assigned(EvMaximizarMenu) then
    EvMaximizarMenu(Self);
    
  inherited;
end;

end.
