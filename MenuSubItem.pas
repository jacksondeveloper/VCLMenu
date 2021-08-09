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
    procedure lbPrincipalClick(Sender: TObject);
    procedure pnContainerClick(Sender: TObject);
  private
    FIDMenuPai: Integer;
    FEvFecharSubMenus: TEvFecharSubMenus;
    procedure SetIDMenuPai(const Value: Integer);
    procedure SetEvFecharSubMenus(const Value: TEvFecharSubMenus);
   public
    property IDMenuPai: Integer read FIDMenuPai write SetIDMenuPai;
    property EvFecharSubMenus: TEvFecharSubMenus read FEvFecharSubMenus write SetEvFecharSubMenus;
    procedure SetImagemPrincipal(const Value: TPicture);
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

procedure TfrMenuSubItem.lbPrincipalClick(Sender: TObject);
begin
  inherited;
  pnContainer.OnClick(lbPrincipal);
end;

procedure TfrMenuSubItem.SetEvFecharSubMenus(const Value: TEvFecharSubMenus);
begin
  FEvFecharSubMenus := Value;
end;

procedure TfrMenuSubItem.pnContainerClick(Sender: TObject);
begin
  if Assigned(EvFecharSubMenus) then
    EvFecharSubMenus;
    
  inherited;
end;

procedure TfrMenuSubItem.SetImagemPrincipal(const Value: TPicture);
begin
  imgPrincipal.Picture := Value;
end;

end.
