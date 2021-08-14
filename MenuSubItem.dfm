inherited frMenuSubItem: TfrMenuSubItem
  Width = 226
  inherited pnContainer: TPanel
    Width = 226
    object pnEsquerdo: TPanel
      Left = 0
      Top = 0
      Width = 65
      Height = 50
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object imgPrincipal: TImage
        Left = 0
        Top = 0
        Width = 65
        Height = 50
        Align = alClient
        Stretch = True
        Transparent = True
        OnClick = pnContainerClick
      end
    end
    object pnPrincipal: TPanel
      Left = 65
      Top = 0
      Width = 161
      Height = 50
      Align = alClient
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      object lbPrincipal: TLabel
        Left = 17
        Top = 0
        Width = 144
        Height = 50
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
      object PnSeparadorEsquerdo: TPanel
        Left = 0
        Top = 0
        Width = 17
        Height = 50
        Align = alLeft
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 0
        OnClick = pnContainerClick
      end
    end
  end
end
