unit CadastroTeste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrCadastroTeste = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frCadastroTeste: TfrCadastroTeste;

implementation

uses
  Principal;

{$R *.dfm}

procedure TfrCadastroTeste.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrCadastroTeste.Button1Click(Sender: TObject);
begin
  frPrincipal.Label1.Caption := '';
  Close;
end;

end.



