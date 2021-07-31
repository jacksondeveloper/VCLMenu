program Menu;

uses
  Forms,
  Principal in 'Principal.pas' {frPrincipal},
  MenuController in 'MenuController.pas',
  ItemBase in 'ItemBase.pas' {frItemBase: TFrame},
  ItemMenu in 'ItemMenu.pas' {frItemMenu: TFrame},
  ItemSubMenu in 'ItemSubMenu.pas' {frItemSubMenu: TFrame},
  MenuTipos in 'MenuTipos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrPrincipal, frPrincipal);
  Application.Run;
end.
