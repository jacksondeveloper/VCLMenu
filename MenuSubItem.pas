unit MenuSubItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MenuItemBase, ExtCtrls, StdCtrls;

type
  TfrMenuSubItem = class(TfrMenuItemBase)
    lbPrincipal: TLabel;
    procedure lbPrincipalClick(Sender: TObject);
  private
    FIDMenuPai: Integer;
    procedure SetIDMenuPai(const Value: Integer);
    { Private declarations }
  public
    property IDMenuPai: Integer read FIDMenuPai write SetIDMenuPai;
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

end.
