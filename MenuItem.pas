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
  public
    procedure SetImagemPrincipal(const Value: TPicture);
    procedure MouseEnter(var Msg : TMessage);  Message cm_mouseEnter;
    Procedure MouseLeave (Var MSG: TMessage);  Message cm_mouseLeave;
  end;

var
  frMenuItem: TfrMenuItem;

implementation

{$R *.dfm}

procedure TfrMenuItem.SetImagemPrincipal(const Value: TPicture);
begin
  imgPrincipal.Picture := Value;
end;

procedure TfrMenuItem.pnContainerClick(Sender: TObject);
begin
  if Self.Parent.Width = LarguraMenuMinimizado then
    Self.Parent.Width := Self.Width
  else
    inherited;  
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

end.
