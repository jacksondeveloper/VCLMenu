object frPrincipal: TfrPrincipal
  Left = 358
  Top = 210
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
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object pnContainer: TPanel
    Left = 0
    Top = 0
    Width = 1028
    Height = 488
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
      Color = clWhite
      TabOrder = 0
      OnClick = pnTopoClick
      DesignSize = (
        1028
        65)
      object Label1: TLabel
        Left = 24
        Top = 24
        Width = 96
        Height = 29
        Caption = 'Caminho'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -23
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Image1: TImage
        Left = 952
        Top = 0
        Width = 64
        Height = 64
        Anchors = [akTop, akRight]
        Picture.Data = {
          0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000004000
          0000400806000000AA6971DE0000000473424954080808087C08648800000009
          70485973000001D8000001D801FA5CA6720000001974455874536F6674776172
          65007777772E696E6B73636170652E6F72679BEE3C1A000003D44944415478DA
          ED9B5768145114864F34965890880623B607B11151B1614FC4028982466C28A8
          F860416C4F0AFAA4823EF864C30745B18288227651B145256248C15E22884645
          8D052CD8FE9F73C38E4BA29B253B6DEF818F0D77B2B373BFB973E6DE33BB2992
          E491E2F501C4110D406FF018BC4B0601E960B06128E80FD2C07E30238C023A9B
          CE0E31F4701CE70F500CFA82E3607CD005A482AEA6A33CBB234007C7F6CFA6C3
          57C13570197C350452407330D074B6EA0CA739B6BF747496AF45E057D43E1A05
          49405B899C5DBEF601F5CCB69FE0BEFC7D76CB63D8A76F05C4339C3FC4F139BE
          11103D9C99B89A38B6C7329CE3094F054C074B414790E1783F3BF6023C131DC6
          7CFD58079DAD2E38D2D682BB607735DB4F81924409780B5A26A8637515E7C098
          4409A8042DCC07FCF6B093ADC127D14BC11927C175D1FC9350015ECF1F6A0A0A
          B9690558015680156005F85400D7019C40710AFC259904B4031BC04489ACFE9E
          884E67B7817B6116C0B5C279D010949ACE721DD10FB4129D46EF05CB45679AA1
          137011649BBF9F8395601FA80F72C16A23A3024C02056112C033CDC2E56D7016
          2C316DA7C154D10513F3C262B05E747ACDF6636111D01DDC015BC0229069FE66
          2E2831075A69FE371B1C018D45D71A57C2208005112E8DB96C9DEDF8CC8D6099
          E8D2759C44EA04C3C119D1854E16781D7401BCCE99D8787D778BFADCC3A22361
          0ED8E5D8B65074941C0253822E8071004C030340A1A39DF38147A2730296C2BF
          398E89E532569958FE2E0ABA8061A6431CEEB951DBD68055A29787B3BA93032E
          809D606ED0053098F5C78299A2B7C0AA68235A427B087A49241770FF4F4153D1
          91126BF1C5B702980C4BCDFB7870CE61BD49F40E311F6C77B4F3D1176B90BC73
          54045D00230F1C154D8A1C0DC5A63DC3C869660EFC9669DF0A16802EA22324F0
          0218B3C00ED167043CE3074DFB6870C2B44F169D3A5F122DB5A79BF6500860B0
          96BFC7EC87F7FC75A2CF0D2688E607D6FD9933983059E4CCABC5BE032180C19C
          B059220F3698F0F80025D5B431F97D073DC183300AA80A2E82E6817C893C6FE0
          9D802B462E9A6ABB26089C0067B0D6CFE53133FEFB38F7116801751156801560
          05782780C58F2C973A5A26FA78DC57029CB5BF44073F6BA4DF0470D232C82501
          2C9C96F94D801FC20AB0023C14D049B4B6E746B09658EE3701497F1760D537C7
          25012C981656D36E7380156005782780357EB7D602AC22BFF29B002626B79220
          ABC6A3FC26205BF4DBE36EC40DD1B2B9AF04F821AC002BC00AB0025C11B0C2EB
          9ED610FC294D412205F07741995EF7F23FC16F9AE5274A407BD16F7EBEF1BA97
          FF08AE1263FE399E5FAF65D7E20F8DD95550997E5EE30000000049454E44AE42
          6082}
        Visible = False
      end
    end
    object pnPrincipal: TPanel
      Left = 171
      Top = 65
      Width = 637
      Height = 423
      Align = alClient
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 1
      OnClick = pnPrincipalClick
      object Panel2: TPanel
        Left = 0
        Top = 2
        Width = 2
        Height = 421
        Align = alLeft
        BevelOuter = bvNone
        Color = clSilver
        TabOrder = 0
        OnClick = pnPrincipalClick
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 637
        Height = 2
        Align = alTop
        BevelOuter = bvNone
        Color = clSilver
        TabOrder = 1
        OnClick = pnPrincipalClick
      end
      object PnPrincipalInterno: TPanel
        Left = 2
        Top = 2
        Width = 635
        Height = 421
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 2
      end
    end
    object pnEsquerdo: TPanel
      Left = 0
      Top = 65
      Width = 171
      Height = 423
      Align = alLeft
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 2
      OnClick = pnEsquerdoClick
      object pnEsquerdoInterno: TPanel
        Left = 0
        Top = 2
        Width = 171
        Height = 421
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 0
        OnClick = pnEsquerdoClick
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 171
        Height = 2
        Align = alTop
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 1
        OnClick = pnPrincipalClick
      end
    end
    object Panel3: TPanel
      Left = 808
      Top = 65
      Width = 220
      Height = 423
      Align = alRight
      BevelOuter = bvNone
      Color = clSilver
      TabOrder = 3
      OnClick = pnPrincipalClick
      object Memo1: TMemo
        Left = 0
        Top = 0
        Width = 220
        Height = 423
        Align = alClient
        TabOrder = 0
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 488
    Width = 1028
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    Color = clActiveBorder
    TabOrder = 1
    OnClick = Panel1Click
  end
end
