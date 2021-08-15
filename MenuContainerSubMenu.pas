unit MenuContainerSubMenu;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls;

type
  TfrContainerSubMenu = class(TFrame)
    pnContainer: TPanel;
    pnMargemDireita: TPanel;
    pnMargemInferior: TPanel;
    pnPrincipal: TPanel;
    pnMargemSuperior: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
