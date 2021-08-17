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
  public
    procedure SetAltura(Value: Integer);
    function GetAltura: Integer;
  end;

implementation

{$R *.dfm}

{ TfrContainerSubMenu }

procedure TfrContainerSubMenu.SetAltura(Value: Integer);
begin
  Self.Height := Value + pnMargemSuperior.Height + pnMargemInferior.Height;
end;

function TfrContainerSubMenu.GetAltura: Integer;
begin
  Result := pnPrincipal.Height;
end;

end.
