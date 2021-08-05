unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, MenuController, StdCtrls;

type
  TfrPrincipal = class(TForm)
    pnContainer: TPanel;
    pnTopo: TPanel;
    pnPrincipal: TPanel;
    Panel1: TPanel;
    pnEsquerdo: TPanel;
    Panel2: TPanel;
    Memo1: TMemo;
    procedure pnEsquerdoClick(Sender: TObject);
    procedure pnPrincipalClick(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure pnTopoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    fMenuController: iMenuController;
  public
    { Public declarations }
  end;

var
  frPrincipal: TfrPrincipal;

procedure DOLog(Value: String);

implementation

procedure DOLog(Value: String);
begin
  // Para teste
  frPrincipal.Memo1.Lines.Add(Value);
end;

{$R *.dfm}

procedure TfrPrincipal.pnEsquerdoClick(Sender: TObject);
begin
  fMenuController.EsconderSubMenus;
end;

procedure TfrPrincipal.pnPrincipalClick(Sender: TObject);
begin
  fMenuController.EsconderSubMenus;
end;

procedure TfrPrincipal.Panel1Click(Sender: TObject);
begin
  fMenuController.EsconderSubMenus;
end;

procedure TfrPrincipal.pnTopoClick(Sender: TObject);
begin
  fMenuController.EsconderSubMenus;
end;

procedure TfrPrincipal.FormActivate(Sender: TObject);
begin
  fMenuController := TMenuController.New(pnEsquerdo, pnPrincipal);

  fMenuController
    .AdicionarMenu('Animal')
      .AdicionarSubMenu('Animal1')
      .AdicionarSubMenu('Animal2')
      .AdicionarSubMenu('Animal3')
      .AdicionarSubMenu('Animal4')
      .AdicionarSubMenu('Animal5')
    .AdicionarMenu('Fazenda')
      .AdicionarSubMenu('Fazenda1')
      .AdicionarSubMenu('Fazenda2')  
    .AdicionarMenu('Mastite')
      .AdicionarSubMenu('Mastite1')
      .AdicionarSubMenu('Mastite2')
    .AdicionarMenu('Utilitários')
      .AdicionarSubMenu('Utilitários1')
      .AdicionarSubMenu('Utilitários2')
      .AdicionarSubMenu('Utilitários3')
      .AdicionarSubMenu('Utilitários4')
      .AdicionarSubMenu('Utilitários5')
      .AdicionarSubMenu('Utilitários6')
      .AdicionarSubMenu('Utilitários7')
      .AdicionarSubMenu('Utilitários8')
      .AdicionarSubMenu('Utilitários9')
      .AdicionarSubMenu('Utilitários10')
      .AdicionarSubMenu('Utilitários11')
      .AdicionarSubMenu('Utilitários12')
      .AdicionarSubMenu('Utilitários13')
      .AdicionarSubMenu('Utilitários14')
      .AdicionarSubMenu('Utilitários15')
      .AdicionarSubMenu('Utilitários16')
      .AdicionarSubMenu('Utilitários17')
      .AdicionarSubMenu('Utilitários18')
      .AdicionarSubMenu('Utilitários19')
      .AdicionarSubMenu('Utilitários20')
      .AdicionarSubMenu('Utilitários21')
      .AdicionarSubMenu('Utilitários22')
      .AdicionarSubMenu('Utilitários23')
      .AdicionarSubMenu('Utilitários24')
      .AdicionarSubMenu('Utilitários25')
      .AdicionarSubMenu('Utilitários26')
      .AdicionarSubMenu('Utilitários27')
      .AdicionarSubMenu('Utilitários28')
      .AdicionarSubMenu('Utilitários29')
      .AdicionarSubMenu('Utilitários30')
      .AdicionarSubMenu('Utilitários31')
      .AdicionarSubMenu('Utilitários32')
      .AdicionarSubMenu('Utilitários33')
      .AdicionarSubMenu('Utilitários34')
      .AdicionarSubMenu('Utilitários35')
      .AdicionarSubMenu('Utilitários36')
      .AdicionarSubMenu('Utilitários37')
      .AdicionarSubMenu('Utilitários38') 
  .GerarMenu;
end;

end.
