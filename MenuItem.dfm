inherited frMenuItem: TfrMenuItem
  inherited pnContainer: TPanel
    ParentColor = True
    object pnEsquerdo: TPanel
      Left = 0
      Top = 0
      Width = 65
      Height = 46
      Align = alLeft
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      object imgPrincipal: TImage
        Left = 0
        Top = 0
        Width = 65
        Height = 46
        Align = alClient
        Stretch = True
        Transparent = True
        OnClick = pnContainerClick
      end
    end
    object pnPrincipal: TPanel
      Left = 65
      Top = 0
      Width = 140
      Height = 46
      Align = alClient
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      object lbPrincipal: TLabel
        Left = 12
        Top = 0
        Width = 128
        Height = 46
        Align = alClient
        AutoSize = False
        Caption = 'lbPrincipal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        OnClick = pnContainerClick
      end
      object pnSeparadorEsquerdo: TPanel
        Left = 0
        Top = 0
        Width = 12
        Height = 46
        Align = alLeft
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 0
        OnClick = pnContainerClick
      end
    end
  end
end
