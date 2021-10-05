unit MenuTipos;

interface

uses
  Forms;

const
  MenuMaximizado = 210;
  MenuMinimizado = 65;

type

  TEvMenuClick = procedure(Sender: TFrame) of object;
  TEvFecharSubMenus = procedure of object;
  TEvFecharOutrosSubMenus = procedure(IDMenuItem: Integer) of object;
  TEvMinimizarMenu = procedure of object;
  TEvMaximizarMenu = procedure of object;
  TEvAfterClick = procedure(Sender: TFrame) of object;

implementation

end.
