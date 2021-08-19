object frCadastroTeste: TfrCadastroTeste
  Left = 310
  Top = 171
  BorderStyle = bsNone
  Caption = 'frCadastroTeste'
  ClientHeight = 501
  ClientWidth = 1028
  Color = cl3DLight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  DesignSize = (
    1028
    501)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 392
    Top = 208
    Width = 219
    Height = 37
    Caption = 'Cadastro Teste'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 840
    Top = 424
    Width = 171
    Height = 57
    Anchors = [akRight, akBottom]
    Caption = 'Fechar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 504
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 1
  end
end
