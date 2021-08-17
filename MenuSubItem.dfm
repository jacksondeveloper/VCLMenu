inherited frMenuSubItem: TfrMenuSubItem
  Width = 226
  inherited pnContainer: TPanel
    Width = 222
    object pnEsquerdo: TPanel
      Left = 0
      Top = 0
      Width = 65
      Height = 46
      Align = alLeft
      BevelOuter = bvNone
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
      Width = 157
      Height = 46
      Align = alClient
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      object lbPrincipal: TLabel
        Left = 17
        Top = 0
        Width = 140
        Height = 46
        Align = alClient
        Alignment = taCenter
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
        Height = 46
        Align = alLeft
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 0
        OnClick = pnContainerClick
      end
    end
  end
  inherited pnMargemDireita: TPanel
    Left = 224
  end
  inherited pnMargemSuperior: TPanel
    Width = 226
  end
  inherited pnMargemInferior: TPanel
    Width = 226
  end
end
