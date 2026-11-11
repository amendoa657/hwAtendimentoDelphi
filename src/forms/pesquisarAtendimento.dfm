object frmPesquisarAtendimento: TfrmPesquisarAtendimento
  Left = 0
  Top = 0
  HelpContext = 5
  Caption = 'HW Atendimento'
  ClientHeight = 760
  ClientWidth = 1280
  Color = clWhite
  Constraints.MinHeight = 600
  Constraints.MinWidth = 960
  Font.Charset = DEFAULT_CHARSET
  Font.Color = 2630431
  Font.Height = -12
  Font.Name = 'Comfortaa'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  TextHeight = 19
  object pnlCabecalho: TPanel
    Left = 0
    Top = 0
    Width = 1280
    Height = 56
    Align = alTop
    BevelOuter = bvNone
    Color = 1906966
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    object lblAppTitulo: TLabel
      Left = 86
      Top = 16
      Width = 128
      Height = 30
      Caption = 'Atendimento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Comfortaa'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object imgLogo: TImage
      Left = 20
      Top = 10
      Width = 54
      Height = 36
      Center = True
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000360000
        00240806000000C25BC94D000009574944415478DAED590D6C55E5197ECE39F7
        DCBFFE0A4E22A0739BE2C67F5BE61802FE0382C2A2B13371C61087EC4781B698
        E8C252BA449991D232CD167E9610B6980D304298C018AC8A281A7BDBCB802598
        2D751B74826B4BE9EDBDF7DCF3B7E7FBCEEDEDBDED2D14962C35E1346DEE3DF7
        FBBEF33EEFFBBCEFFBBCB70A1A5A5D5CC9E5BA2EF48002DB988755E57FC2A666
        1DCB6798D8D07A2754E5283F978B0045B9A273AFF45254C0B12FC0E73F0CDBDD
        82AA297F4CDBA7F0D1FCF3450526C1F1117A10B04D078EB50D5DFF7A0E758BE3
        02DC171B98B40736FFA8281AAD20D6F1362E9CA9C4A4A4911F982B0D73C0A0CA
        D78AA28D58607D970313C5A374F474BC84EAF2358381099B34E2F08718628BAF
        7D40B277E4462CDB2ECDE7929209D86A792E30EF4311A518DF34C2B64F3149EF
        27D0A799A8231B98679B8D60810623F1F28088B90E23A52219FF016A2A36656E
        D7B76C4241D13348C42C6ED6462C3061BF1E549032DECB022672495318991474
        732CC6DC7101BD9FEAF8F49614AE8B2C84AF602F4C4324AAC212AB8E48607D8C
        73ECB63CC01C0376FC663C7FE7F98CD10D91C5F005F7C04A3972E9C807F68FFC
        C034F726AC2CFFFC1AB06BC0AE01BB066C08606DC303B631F23094E05BB0CC34
        309DD2DA588015E587FAD7B4CC82A31EF13051C109950DA8C47739805C0B27E7
        8E020D97BDD8B35CC51DB08F185481A173B8117B0485A3DF64E3F396FA0340AC
        7321AACAF767AD998B60F1BBE98879638599F494B77C93D7C35E608305B9F78C
        B82BCD1C1A932B1BB14FCFFF391F776960B554CD7514C31B3F1C0F14DE452A7A
        6B7D7EE1D3C37876F267A8ADE59A3AAE69F9126C651E147A5271838CC10C3EE0
        51F88363A4A1C2930369A36A42663B946E7F60709BE55ED79D4383E7F39E2B1D
        3410A00015285078E6097EB28B1FDB8381B9EEA581A587B661F13BDFF57AE456
        D8FEB7086032AC6476E45CCF5C8D2ADB7E02ABCA76E6ECDBD0F20202A1754825
        06445B482621E7EC93D071177E34B56BA8470F0F9888CAD8877379FF4C859503
        5AACDD1CF165DEB7932A7593533C7F3A45F487B01D3F642A298A9CA184584DC6
        0E70C47810B54D3E8C2DF222D35EC108BCA3A2B4E404E9763BE9EC66C049915B
        48911B7F1C55D37F8F8DFB02B8F1410B5D11F5EA805DD5C5BDB5EF68A8BBC762
        04762154F82845B42D673B979E0F8429B6638FA0BA623776B2C854A62925408A
        3DF52D3528285E8FF8453B3D0F3AB21A9BC936D8DA14AC9E16975197D938D8C6
        CBE4583A7F5E8D1670E5387ADD5BAB315F8AAC332C1A710980A446FD071CE002
        E3A0FA68B87911D533FE8D1D3B3454563A6888CE83EEDFEF799F972F280C3C8D
        6EA71C6B2B12D2C08668094A4B935274AFA5B91B4FDC402C2719ACD1722E14C0
        C2451A9DB30655652F65CE16D0D61DBB057AC8CF7473A079557878557143F322
        68815D7C80E501F3F9C8F345A89EFEE7ACAAF86D4EE887E83D95FDEC3C52D65C
        AC2EFF2776EE54716AA28612E32346691AF3C644B0C8CFE1F527A4D33A343142
        77DF6DD38EFD04F177DEFB31769CF4A352D038FA1A23FD2CE23D26E9ACF3F917
        E9C789A8293BCBC2C6C82A6443EB13CCC7D7494F5DE249D79A61026B59C2396D
        37C7166FA9CE729FEA9DCFA81CCC69D09A769413AC838252153D5D3FE74CF7A2
        CC83950B0D34B4FC90807E0923260A420F1D30192BA69E95347A2D3A018E769A
        ADA193D5F6EBE8DCD32199527F7C0A491A61CD50111239D9BB95D15A861D9C09
        1F6304D71F0F43738E335FBF36B0F20E5F796881DD390DDA49CD1FA43C14BC27
        9BAD4F76FF73B0ACA9E8A9E894D4DA7C7A34E2F1280AAFBB91A0B7B3682C452D
        23230ACC86E84F1108FE4C9E9D3296A26ADAB62CA7EE41A8681152711BA6350B
        AB2B22997D0DADCB086AB31C80BDDC1D668E5DADA4725D8B89EF433CB692D4FA
        45865AF5AD8DB87EEC4A74B4CF4675D9FBB24F161F63F8FD1132E21BB259A78C
        0FB86736D6A60B4FE35F1E40E90D07D1D9DE4467DC2BF74847B587D07BAE957D
        F2363249D89553B5F303D359049E9BD871F55A91E55CF76B7CE027B8E0940115
        49D4D198C6D65BE1B8DF4377799D3C4734FFF591FB18AD43D23895555BD31DF6
        BCB9A8AA38264188AB84B9E6BA3B5053FE6E7F948F7F1FA1D01646CB91793D74
        55144D53F4187ADB5226E0F9E96DFF9308163FC10295147A920DF8B7322F2AB3
        5442DFFBFAC83614943C952EEB2E69E743E2E266CAB5E519E593DD2BC5B53912
        424C6961D19890D3E77281B5388394B8E2DE41A33FEEF7CEC74BA08777E70033
        9963D565FDC5637D74367C22C732EA5E7C31249A70336EAA9889539E3EC25F77
        2A98F8982B23B8B1F57A38CA0956D931CCDF742BD0A92CCCF308872761F9ED1D
        A85D4BDBD642D2AFAFDF35469F6685DD3A54B43C0F3446DDECA4F3EE6BDF44D5
        940856ECF763D447264A173FC4E2B1C713B47DC08C0758A10E4BB5D1BED746D1
        9299EC21EF6768ED39CB93404662212BE401CF09542CB5A774CF619127112ADE
        8E448F9DF95256A89210D545A26719736A2B36B9DC03EE611026D1295D5F0DA0
        578D485562E58F9678B4C2AAD34D2D57CC2AE65151D8633BD3C9E7E3FDD587EA
        3E50F426CB2D0DA033FC540D46EF62AA86BD99C2B0BE793E1BE801DECFD27769
        8561184DAC74F7E63CBCB62988D25147A0EB3306D0895555E841EB2442A9999E
        0848B34BC06E687E11C192974957464B1D08AA2F9DBA09AC751F2BCB021EEE48
        1521BE574CA57E8DB05983093DBD88968EE791DBE9A1399E2805E41A2379841E
        781CDD3D9FA3B0781C74ED0D1A340B661EE12A1C611A3C435DC3C6CD1EE6DCCC
        66FE0ACF59C0FE33984E7D922B956C829DAAE1EFDFE053290E024C09FF167E1E
        66BF54F20CB336B150AA250E32C7A2DFE5E2DFB1CCDA99014F3460337996AFDA
        E883C934A094A0FACF114CF307599A939FF1E627BC3189893C9A9473F30E9662
        440984159E11E3EBFF70CD789EE96374078F33FDFEF0C69354C2A20D6DB48DEA
        439F28FC242556FEF9D5669A886AFC1D45F23EAEEC43B8F47EF4769BDCA04B43
        E4CC45B16EA520D5040679D595892E863D738835032C25E529B734CF30D7B9CC
        FAF41E4137AA29AFC7A5B5667EE799543CC4D2F5365BC543DE8257235F26D79B
        285BBE42700E943E4ACB117FE8F1DEFB4F8C73C935033648C1EC1D3EDCEF44D2
        23B9DC96AF027AE911A68C4B5C24657D7338009F5332BDE29563B7B11AFD8A51
        BA4F3E5F4401573F63FE5F2EF98FBF8067A669EC63DE2FC70B33CF88A9C4F35A
        76236C3CF914BBC55226ECB738AE07472C3801CA716250F5A37CF11BAC9AF686
        87C51BB5FE0B93807970E3201BA20000000049454E44AE426082}
      Proportional = True
      Stretch = True
      Transparent = True
    end
    object pnlNovoAtendimentoBorda: TPanel
      AlignWithMargins = True
      Left = 968
      Top = 13
      Width = 140
      Height = 30
      Margins.Left = 0
      Margins.Top = 13
      Margins.Right = 10
      Margins.Bottom = 13
      Align = alRight
      BevelOuter = bvNone
      Color = 6511189
      Padding.Left = 1
      Padding.Top = 1
      Padding.Right = 1
      Padding.Bottom = 1
      ParentBackground = False
      ShowCaption = False
      TabOrder = 0
      object btnNovoAtendimento: TPanel
        Left = 1
        Top = 1
        Width = 138
        Height = 28
        Cursor = crHandPoint
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Novo atendimento'
        Color = 1906966
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        OnClick = btnNovoAtendimentoClick
      end
    end
    object pnlUsuariosBorda: TPanel
      AlignWithMargins = True
      Left = 1180
      Top = 13
      Width = 80
      Height = 30
      Margins.Left = 0
      Margins.Top = 13
      Margins.Right = 20
      Margins.Bottom = 13
      Align = alRight
      BevelOuter = bvNone
      Color = 6511189
      Padding.Left = 1
      Padding.Top = 1
      Padding.Right = 1
      Padding.Bottom = 1
      ParentBackground = False
      ShowCaption = False
      TabOrder = 2
      object btnUsuarios: TPanel
        Left = 1
        Top = 1
        Width = 78
        Height = 28
        Cursor = crHandPoint
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Usu'#225'rios'
        Color = 1906966
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        OnClick = btnUsuariosClick
      end
    end
    object pnlLogBorda: TPanel
      AlignWithMargins = True
      Left = 1118
      Top = 13
      Width = 52
      Height = 30
      Margins.Left = 0
      Margins.Top = 13
      Margins.Right = 10
      Margins.Bottom = 13
      Align = alRight
      BevelOuter = bvNone
      Color = 6511189
      Padding.Left = 1
      Padding.Top = 1
      Padding.Right = 1
      Padding.Bottom = 1
      ParentBackground = False
      ShowCaption = False
      TabOrder = 1
      object btnLog: TPanel
        Left = 1
        Top = 1
        Width = 50
        Height = 28
        Cursor = crHandPoint
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Log'
        Color = 1906966
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        OnClick = btnLogClick
      end
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 696
    Width = 1280
    Height = 64
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    ShowCaption = False
    TabOrder = 2
    Visible = False
    DesignSize = (
      1280
      64)
    object shpLinhaRodape: TShape
      Left = 0
      Top = 0
      Width = 1280
      Height = 1
      Align = alTop
      Brush.Color = 14802136
      Pen.Color = 14802136
    end
    object pnlVoltarBorda: TPanel
      Left = 1180
      Top = 14
      Width = 80
      Height = 36
      Anchors = [akTop, akRight]
      BevelOuter = bvNone
      Color = 13814983
      Padding.Left = 1
      Padding.Top = 1
      Padding.Right = 1
      Padding.Bottom = 1
      ParentBackground = False
      ShowCaption = False
      TabOrder = 0
      object btnVoltar: TPanel
        Left = 1
        Top = 1
        Width = 78
        Height = 34
        Cursor = crHandPoint
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Voltar'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 2630431
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  object pnlConteudo: TPanel
    Left = 0
    Top = 56
    Width = 1280
    Height = 640
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    ShowCaption = False
    TabOrder = 1
    OnResize = pnlConteudoResize
    ExplicitLeft = 8
    ExplicitTop = 59
    DesignSize = (
      1280
      640)
    object lblTitulo: TLabel
      Left = 28
      Top = 20
      Width = 263
      Height = 34
      Caption = 'Pesquisar atendimentos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2630431
      Font.Height = -21
      Font.Name = 'Comfortaa'
      Font.Style = []
      ParentFont = False
    end
    object lblSubtitulo: TLabel
      Left = 28
      Top = 50
      Width = 228
      Height = 18
      Caption = 'Deixe um filtro em branco para ignor'#225'-lo.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7365467
      Font.Height = -11
      Font.Name = 'Comfortaa'
      Font.Style = []
      ParentFont = False
    end
    object lblSecaoFiltros: TLabel
      Left = 28
      Top = 76
      Width = 37
      Height = 19
      Caption = 'Filtros'
    end
    object shpLinhaFiltros: TShape
      Left = 80
      Top = 84
      Width = 1172
      Height = 1
      Anchors = [akLeft, akTop, akRight]
      Brush.Color = 14802136
      Pen.Color = 14802136
    end
    object lblDe: TLabel
      Left = 28
      Top = 102
      Width = 15
      Height = 18
      Caption = 'De'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7365467
      Font.Height = -11
      Font.Name = 'Comfortaa'
      Font.Style = []
      ParentFont = False
    end
    object lblAte: TLabel
      Left = 648
      Top = 102
      Width = 19
      Height = 18
      Caption = 'At'#233
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7365467
      Font.Height = -11
      Font.Name = 'Comfortaa'
      Font.Style = []
      ParentFont = False
    end
    object lblNomeCliente: TLabel
      Left = 28
      Top = 158
      Width = 92
      Height = 18
      Caption = 'Nome do cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7365467
      Font.Height = -11
      Font.Name = 'Comfortaa'
      Font.Style = []
      ParentFont = False
    end
    object lblNumeroSerie: TLabel
      Left = 648
      Top = 158
      Width = 94
      Height = 18
      Caption = 'N'#250'mero de s'#233'rie'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7365467
      Font.Height = -11
      Font.Name = 'Comfortaa'
      Font.Style = []
      ParentFont = False
    end
    object lblDescricao: TLabel
      Left = 28
      Top = 214
      Width = 102
      Height = 18
      Caption = 'Descri'#231#227'o cont'#233'm'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7365467
      Font.Height = -11
      Font.Name = 'Comfortaa'
      Font.Style = []
      ParentFont = False
    end
    object lblTelefone: TLabel
      Left = 648
      Top = 214
      Width = 47
      Height = 18
      Caption = 'Telefone'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7365467
      Font.Height = -11
      Font.Name = 'Comfortaa'
      Font.Style = []
      ParentFont = False
    end
    object lblSecaoResultados: TLabel
      Left = 28
      Top = 372
      Width = 66
      Height = 19
      Caption = 'Resultados'
    end
    object shpLinhaResultados: TShape
      Left = 110
      Top = 380
      Width = 1142
      Height = 1
      Anchors = [akLeft, akTop, akRight]
      Brush.Color = 14802136
      Pen.Color = 14802136
    end
    object dtpDe: TDateTimePicker
      Left = 28
      Top = 120
      Width = 604
      Height = 25
      Date = 46324.00000000000000000
      Time = 0.50000000000000000
      ShowCheckbox = True
      Checked = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2630431
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object dtpAte: TDateTimePicker
      Left = 648
      Top = 120
      Width = 604
      Height = 25
      Date = 46324.00000000000000000
      Time = 0.50000000000000000
      ShowCheckbox = True
      Checked = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2630431
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edtNomeCliente: TEdit
      Left = 28
      Top = 176
      Width = 604
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2630431
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 100
      ParentFont = False
      TabOrder = 2
      TextHint = 'Nome ou parte do nome'
    end
    object edtNumeroSerie: TEdit
      Left = 648
      Top = 176
      Width = 604
      Height = 25
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2630431
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 11
      ParentFont = False
      TabOrder = 3
      TextHint = 'XX000000000'
    end
    object edtDescricao: TEdit
      Left = 28
      Top = 232
      Width = 604
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2630431
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      TextHint = 'Ex.: software'
    end
    object edtTelefone: TEdit
      Left = 648
      Top = 232
      Width = 604
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2630431
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 15
      ParentFont = False
      TabOrder = 5
      TextHint = '(00) 00000-0000'
    end
    object lblModelo: TLabel
      Left = 28
      Top = 270
      Width = 100
      Height = 14
      Caption = 'Modelo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = $0070635B
      Font.Height = -11
      Font.Name = 'Comfortaa'
      Font.Style = []
      ParentFont = False
    end
    object lblSituacao: TLabel
      Left = 648
      Top = 270
      Width = 100
      Height = 14
      Caption = 'Situa'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = $0070635B
      Font.Height = -11
      Font.Name = 'Comfortaa'
      Font.Style = []
      ParentFont = False
    end
    object cbEcg: TCheckBox
      Left = 28
      Top = 290
      Width = 130
      Height = 19
      Caption = 'ECG (V6 e V11)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = $0028231F
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
    end
    object cbErgo: TCheckBox
      Left = 170
      Top = 290
      Width = 90
      Height = 19
      Caption = 'Ergo13'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = $0028231F
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
    end
    object cbErgoMet: TCheckBox
      Left = 272
      Top = 290
      Width = 110
      Height = 19
      Caption = 'ErgoMET13'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = $0028231F
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 13
    end
    object cbErgoCp: TCheckBox
      Left = 394
      Top = 290
      Width = 90
      Height = 19
      Caption = 'ErgoCP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = $0028231F
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 14
    end
    object cbEmAberto: TCheckBox
      Left = 648
      Top = 290
      Width = 260
      Height = 19
      Caption = 'Somente atendimentos em aberto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = $0028231F
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 15
    end
    object btnPesquisar: TPanel
      Left = 28
      Top = 318
      Width = 96
      Height = 36
      Cursor = crHandPoint
      BevelOuter = bvNone
      Caption = 'Pesquisar'
      Color = 1906966
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 6
      OnClick = btnPesquisarClick
    end
    object pnlLimparFiltrosBorda: TPanel
      Left = 134
      Top = 318
      Width = 112
      Height = 36
      BevelOuter = bvNone
      Color = 13814983
      Padding.Left = 1
      Padding.Top = 1
      Padding.Right = 1
      Padding.Bottom = 1
      ParentBackground = False
      ShowCaption = False
      TabOrder = 7
      object btnLimparFiltros: TPanel
        Left = 1
        Top = 1
        Width = 110
        Height = 34
        Cursor = crHandPoint
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Limpar filtros'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 2630431
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        OnClick = btnLimparFiltrosClick
      end
    end
    object lvResultados: TDBGrid
      Left = 28
      Top = 394
      Width = 1224
      Height = 174
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DataSource
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2630431
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = 2630431
      TitleFont.Height = -13
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = [fsBold]
      OnCellClick = lvResultadosCellClick
      OnTitleClick = lvResultadosTitleClick
    end
    object pnlAcoes: TPanel
      Left = 28
      Top = 580
      Width = 400
      Height = 40
      Anchors = [akLeft, akBottom]
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      ShowCaption = False
      TabOrder = 9
      object btnEditar: TPanel
        AlignWithMargins = True
        Left = 0
        Top = 0
        Width = 100
        Height = 40
        Cursor = crHandPoint
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 10
        Margins.Bottom = 0
        Align = alLeft
        BevelOuter = bvNone
        Caption = 'Editar'
        Color = 1906966
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        OnClick = btnEditarClick
      end
      object pnlExcluirBorda: TPanel
        AlignWithMargins = True
        Left = 110
        Top = 0
        Width = 100
        Height = 40
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 10
        Margins.Bottom = 0
        Align = alLeft
        BevelOuter = bvNone
        Color = 2631878
        Padding.Left = 1
        Padding.Top = 1
        Padding.Right = 1
        Padding.Bottom = 1
        ParentBackground = False
        ShowCaption = False
        TabOrder = 1
        object btnExcluir: TPanel
          Left = 1
          Top = 1
          Width = 98
          Height = 38
          Cursor = crHandPoint
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Excluir'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 2631878
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          OnClick = btnExcluirClick
        end
      end
      object pnlAnexosBorda: TPanel
        AlignWithMargins = True
        Left = 220
        Top = 0
        Width = 100
        Height = 40
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 10
        Margins.Bottom = 0
        Align = alLeft
        BevelOuter = bvNone
        Color = 13814983
        Padding.Left = 1
        Padding.Top = 1
        Padding.Right = 1
        Padding.Bottom = 1
        ParentBackground = False
        ShowCaption = False
        TabOrder = 2
        object btnAnexos: TPanel
          Left = 1
          Top = 1
          Width = 98
          Height = 38
          Cursor = crHandPoint
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Anexos'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 2630431
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          OnClick = btnAnexosClick
        end
      end
    end
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 744
    Top = 712
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 640
    Top = 712
  end
  object QuerySql: TFDQuery
    Left = 568
    Top = 712
  end
  object DataSource: TDataSource
    DataSet = QuerySql
    Left = 496
    Top = 712
  end
end
