unit MenuTipos;

interface

uses
  Forms;

const
  LarguraSubMenu = 200;
  LarguraMenuMinimizado = 70;

type

  TEvMenuClick = procedure(Sender: TObject) of object;
  TEvFecharSubMenus = procedure of object;
  TEvMinimizarMenu = procedure of object;
  TEvClickSubmenuView = procedure(Sender: TFrame) of object;

implementation

end.
