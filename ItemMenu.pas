unit ItemMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ItemBase, ExtCtrls, StdCtrls;

type
  TfrItemMenu = class(TfrItemBase)
    lbPrincipal: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frItemMenu: TfrItemMenu;

implementation

{$R *.dfm}

end.
