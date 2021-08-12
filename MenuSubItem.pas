unit MenuSubItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MenuItemBase, ExtCtrls, StdCtrls, MenuTipos;

type
  TfrMenuSubItem = class(TfrMenuItemBase)
    pnEsquerdo: TPanel;
    pnPrincipal: TPanel;
    lbPrincipal: TLabel;
    PnSeparadorEsquerdo: TPanel;
    imgPrincipal: TImage;
    procedure pnContainerClick(Sender: TObject);
  private
    FIDMenuPai: Integer;
    FEvFecharSubMenus: TEvFecharSubMenus;
    FEvMinimizarMenus: TEvMinimizarMenu;
    procedure SetIDMenuPai(const Value: Integer);
    procedure SetEvFecharSubMenus(const Value: TEvFecharSubMenus);
    procedure SetEvMinimizarMenus(const Value: TEvMinimizarMenu);
   public
    procedure SetImagemPrincipal(const Value: TPicture);
    property IDMenuPai: Integer read FIDMenuPai write SetIDMenuPai;
    property EvFecharSubMenus: TEvFecharSubMenus read FEvFecharSubMenus write SetEvFecharSubMenus;
    property EvMinimizarMenus: TEvMinimizarMenu read FEvMinimizarMenus write SetEvMinimizarMenus;
  end;

var
  frMenuSubItem: TfrMenuSubItem;

implementation

{$R *.dfm}

{ TfrMenuSubItem }

procedure TfrMenuSubItem.SetIDMenuPai(const Value: Integer);
begin
  FIDMenuPai := Value;
end;

procedure TfrMenuSubItem.SetEvFecharSubMenus(const Value: TEvFecharSubMenus);
begin
  FEvFecharSubMenus := Value;
end;

procedure TfrMenuSubItem.pnContainerClick(Sender: TObject);
begin
  if Assigned(EvFecharSubMenus) then
    EvFecharSubMenus;

  if Assigned(EvMinimizarMenus) then
    EvMinimizarMenus;

  inherited;
end;

procedure TfrMenuSubItem.SetImagemPrincipal(const Value: TPicture);
begin
  imgPrincipal.Picture := Value;
end;

procedure TfrMenuSubItem.SetEvMinimizarMenus(const Value: TEvMinimizarMenu);
begin
  FEvMinimizarMenus := Value;
end;

end.
