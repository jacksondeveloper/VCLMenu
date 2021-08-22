unit MenuTipos;

interface

uses
  Forms;

const
  LarguraSubMenu = 200;

type

  TEvMenuClick = procedure(Sender: TFrame) of object;
  TEvFecharSubMenus = procedure of object;
  TEvMinimizarMenu = procedure(Sender: TFrame) of object;
  TEvMaximizarMenu = procedure(Sender: TFrame) of object;
  TEvClickSubmenuView = procedure(Sender: TFrame) of object;

implementation

end.
