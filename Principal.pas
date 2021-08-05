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
    .AdicionarMenu('Utilit�rios')
      .AdicionarSubMenu('Utilit�rios1')
      .AdicionarSubMenu('Utilit�rios2')
      .AdicionarSubMenu('Utilit�rios3')
      .AdicionarSubMenu('Utilit�rios4')
      .AdicionarSubMenu('Utilit�rios5')
      .AdicionarSubMenu('Utilit�rios6')
      .AdicionarSubMenu('Utilit�rios7')
      .AdicionarSubMenu('Utilit�rios8')
      .AdicionarSubMenu('Utilit�rios9')
      .AdicionarSubMenu('Utilit�rios10')
      .AdicionarSubMenu('Utilit�rios11')
      .AdicionarSubMenu('Utilit�rios12')
      .AdicionarSubMenu('Utilit�rios13')
      .AdicionarSubMenu('Utilit�rios14')
      .AdicionarSubMenu('Utilit�rios15')
      .AdicionarSubMenu('Utilit�rios16')
      .AdicionarSubMenu('Utilit�rios17')
      .AdicionarSubMenu('Utilit�rios18')
      .AdicionarSubMenu('Utilit�rios19')
      .AdicionarSubMenu('Utilit�rios20')
      .AdicionarSubMenu('Utilit�rios21')
      .AdicionarSubMenu('Utilit�rios22')
      .AdicionarSubMenu('Utilit�rios23')
      .AdicionarSubMenu('Utilit�rios24')
      .AdicionarSubMenu('Utilit�rios25')
      .AdicionarSubMenu('Utilit�rios26')
      .AdicionarSubMenu('Utilit�rios27')
      .AdicionarSubMenu('Utilit�rios28')
      .AdicionarSubMenu('Utilit�rios29')
      .AdicionarSubMenu('Utilit�rios30')
      .AdicionarSubMenu('Utilit�rios31')
      .AdicionarSubMenu('Utilit�rios32')
      .AdicionarSubMenu('Utilit�rios33')
      .AdicionarSubMenu('Utilit�rios34')
      .AdicionarSubMenu('Utilit�rios35')
      .AdicionarSubMenu('Utilit�rios36')
      .AdicionarSubMenu('Utilit�rios37')
      .AdicionarSubMenu('Utilit�rios38') 
  .GerarMenu;
end;

end.
