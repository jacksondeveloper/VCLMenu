unit MenuItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MenuItemBase, ExtCtrls, StdCtrls;

type
  TfrMenuItem = class(TfrMenuItemBase)
    lbPrincipal: TLabel;
    procedure lbPrincipalClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
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

end.
