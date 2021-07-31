program Menu;

uses
  Forms,
  Principal in 'Principal.pas' {frPrincipal},
  MenuController in 'MenuController.pas',
  MenuItemBase in 'MenuItemBase.pas' {frMenuItemBase: TFrame},
  MenuItem in 'MenuItem.pas' {frMenuItem: TFrame},
  MenuSubItem in 'MenuSubItem.pas' {frMenuSubItem: TFrame},
  MenuTipos in 'MenuTipos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrPrincipal, frPrincipal);
  Application.Run;
end.
