object frMenuItemBase: TfrMenuItemBase
  Left = 0
  Top = 0
  Width = 209
  Height = 64
  TabOrder = 0
  object pnContainer: TPanel
    Left = 2
    Top = 2
    Width = 205
    Height = 60
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    OnClick = pnContainerClick
  end
  object pnMargemEsquerda: TPanel
    Left = 0
    Top = 2
    Width = 2
    Height = 60
    Align = alLeft
    BevelOuter = bvNone
    Color = clGray
    TabOrder = 1
    Visible = False
    OnClick = pnContainerClick
  end
  object pnMargemDireita: TPanel
    Left = 207
    Top = 2
    Width = 2
    Height = 60
    Align = alRight
    BevelOuter = bvNone
    Color = clGray
    TabOrder = 2
    Visible = False
    OnClick = pnContainerClick
  end
  object pnMargemSuperior: TPanel
    Left = 0
    Top = 0
    Width = 209
    Height = 2
    Align = alTop
    BevelOuter = bvNone
    Color = clGray
    TabOrder = 3
    Visible = False
    OnClick = pnContainerClick
  end
  object pnMargemInferior: TPanel
    Left = 0
    Top = 62
    Width = 209
    Height = 2
    Align = alBottom
    BevelOuter = bvNone
    Color = clGray
    TabOrder = 4
    Visible = False
    OnClick = pnContainerClick
  end
end
