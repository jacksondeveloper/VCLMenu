object frPrincipal: TfrPrincipal
  Left = 315
  Top = 201
  Width = 1044
  Height = 556
  Caption = 'frPrincipal'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object pnContainer: TPanel
    Left = 0
    Top = 0
    Width = 1028
    Height = 452
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pnTopo: TPanel
      Left = 0
      Top = 0
      Width = 1028
      Height = 65
      Align = alTop
      BevelOuter = bvNone
      Color = clActiveBorder
      TabOrder = 0
    end
    object pnPrincipal: TPanel
      Left = 321
      Top = 65
      Width = 707
      Height = 387
      Align = alClient
      BevelOuter = bvNone
      Color = clSilver
      TabOrder = 1
    end
    object pnEsquerdo: TPanel
      Left = 0
      Top = 65
      Width = 321
      Height = 387
      Align = alLeft
      BevelOuter = bvNone
      Color = clGray
      TabOrder = 2
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 452
    Width = 1028
    Height = 65
    Align = alBottom
    BevelOuter = bvNone
    Color = clActiveBorder
    TabOrder = 1
  end
end
