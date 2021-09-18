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
    FEvAfterClick: TEvAfterClick;
    FCaminhoSubmenu: String;
    FFormRegistrado: String;
    FEvMinimizarMenu: TEvMinimizarMenu;
    procedure SetIDMenuPai(const Value: Integer);
    procedure SetEvFecharSubMenus(const Value: TEvFecharSubMenus);
    procedure SetEvAfterClick(const Value: TEvAfterClick);
    procedure SetCaminhoSubmenu(const Value: String);
    function GetCaminhoSubmenu: String;
    procedure SetFormRegistrado(const Value: String);
    procedure SetEvMinimizarMenu(const Value: TEvMinimizarMenu);
   public
    procedure SetImagemPrincipal(const Value: TPicture);
    property IDMenuPai: Integer read FIDMenuPai write SetIDMenuPai;
    property EvFecharSubMenus: TEvFecharSubMenus read FEvFecharSubMenus write SetEvFecharSubMenus;
    property EvAfterClick: TEvAfterClick read FEvAfterClick write SetEvAfterClick;
    property EvMinimizarMenu: TEvMinimizarMenu read FEvMinimizarMenu write SetEvMinimizarMenu;
    property CaminhoSubmenu: String read GetCaminhoSubmenu write SetCaminhoSubmenu;
    property FormRegistrado: String read FFormRegistrado write SetFormRegistrado;
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
  EvFecharSubMenus;

  if Assigned(EvMinimizarMenu) then
    EvMinimizarMenu;

  inherited;

  if Assigned(EvAfterClick) then
    EvAfterClick(Self);
end;

procedure TfrMenuSubItem.SetImagemPrincipal(const Value: TPicture);
begin
  imgPrincipal.Picture := Value;
end;

procedure TfrMenuSubItem.SetEvAfterClick(const Value: TEvAfterClick);
begin
  FEvAfterClick := Value;
end;

procedure TfrMenuSubItem.SetCaminhoSubmenu(const Value: String);
begin
  FCaminhoSubmenu := Value;
end;

function TfrMenuSubItem.GetCaminhoSubmenu: String;
begin
  Result := FCaminhoSubmenu + ' - ' +  Self.lbPrincipal.Caption;
end;

procedure TfrMenuSubItem.SetFormRegistrado(const Value: String);
begin
  FFormRegistrado := Value;
end;

procedure TfrMenuSubItem.SetEvMinimizarMenu(const Value: TEvMinimizarMenu);
begin
  FEvMinimizarMenu := Value;
end;

end.
