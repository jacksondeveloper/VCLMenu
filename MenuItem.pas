unit MenuItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MenuItemBase, ExtCtrls, StdCtrls;

type
  TfrMenuItem = class(TfrMenuItemBase)
    lbPrincipal: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frMenuItem: TfrMenuItem;

implementation

{$R *.dfm}

end.
