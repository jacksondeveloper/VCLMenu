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
    procedure MouseEnter(var Msg : TMessage);  Message cm_mouseEnter;
    Procedure MouseLeave (Var MSG: TMessage);  Message cm_mouseLeave;
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

procedure TfrContainerSubMenu.MouseEnter(var Msg: TMessage);
begin
  // necessário, mesmo vazio, isso impede que ao passar o mouse na borda não chame o mouseenter do pai e feche o menu
end;

procedure TfrContainerSubMenu.MouseLeave(var MSG: TMessage);
begin
  // necessário, mesmo vazio, isso impede que ao passar o mouse na borda não chame o mouseenter do pai e feche o menu
end;

end.
