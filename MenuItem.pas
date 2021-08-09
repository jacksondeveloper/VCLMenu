unit MenuItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MenuItemBase, ExtCtrls, StdCtrls;

type
  TfrMenuItem = class(TfrMenuItemBase)
    pnEsquerdo: TPanel;
    pnPrincipal: TPanel;
    lbPrincipal: TLabel;
    imgPrincipal: TImage;
    pnSeparadorEsquerdo: TPanel;
    procedure lbPrincipalClick(Sender: TObject);
  private
  public
    procedure SetImagemPrincipal(const Value: TPicture);
  end;

var
  frMenuItem: TfrMenuItem;

implementation

{$R *.dfm}

procedure TfrMenuItem.lbPrincipalClick(Sender: TObject);
begin
  inherited;
  pnContainer.OnClick(lbPrincipal);
end;

procedure TfrMenuItem.SetImagemPrincipal(const Value: TPicture);
begin
  imgPrincipal.Picture := Value;
end;

end.
