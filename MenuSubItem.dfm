inherited frMenuSubItem: TfrMenuSubItem
  Width = 212
  inherited pnContainer: TPanel
    Width = 208
    object pnEsquerdo: TPanel
      Left = 0
      Top = 0
      Width = 65
      Height = 60
      Align = alLeft
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      DesignSize = (
        65
        60)
      object imgPrincipal: TImage
        Left = 5
        Top = 4
        Width = 55
        Height = 50
        Anchors = [akLeft, akTop, akRight, akBottom]
        Stretch = True
        Transparent = True
        OnClick = pnContainerClick
      end
    end
    object pnPrincipal: TPanel
      Left = 65
      Top = 0
      Width = 143
      Height = 60
      Align = alClient
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      object lbPrincipal: TLabel
        Left = 17
        Top = 0
        Width = 126
        Height = 60
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
        Height = 60
        Align = alLeft
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 0
        OnClick = pnContainerClick
      end
    end
  end
  inherited pnMargemDireita: TPanel
    Left = 210
  end
  inherited pnMargemSuperior: TPanel
    Width = 212
  end
  inherited pnMargemInferior: TPanel
    Width = 212
  end
end
