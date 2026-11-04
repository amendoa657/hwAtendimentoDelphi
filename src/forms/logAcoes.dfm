object frmLog: TfrmLog
  Left = 0
  Top = 0
  Caption = 'HW Atendimento'
  ClientHeight = 760
  ClientWidth = 1280
  Color = clWhite
  Constraints.MinHeight = 600
  Constraints.MinWidth = 960
  Font.Charset = DEFAULT_CHARSET
  Font.Color = $0028231F
  Font.Height = -12
  Font.Name = 'Comfortaa'
  Font.Style = []
  Position = poScreenCenter
  WindowState = wsMaximized
  TextHeight = 15
  object pnlCabecalho: TPanel
    Left = 0
    Top = 0
    Width = 1280
    Height = 56
    Align = alTop
    BevelOuter = bvNone
    Color = $001D1916
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    DesignSize = (
      1280
      56)
    object lblAppTitulo: TLabel
      Left = 74
      Top = 16
      Width = 112
      Height = 22
      Caption = 'Atendimento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Comfortaa'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object pnlLogo: TPanel
      Left = 20
      Top = 12
      Width = 42
      Height = 32
      BevelOuter = bvNone
      Caption = 'hw'
      Color = $00C47F1C
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ParentBackground = False
      TabOrder = 0
    end
    object pnlPesquisarBorda: TPanel
      Left = 936
      Top = 13
      Width = 84
      Height = 30
      Anchors = [akTop, akRight]
      BevelOuter = bvNone
      Color = $00635A55
      Padding.Left = 1
      Padding.Top = 1
      Padding.Right = 1
      Padding.Bottom = 1
      ParentBackground = False
      ShowCaption = False
      TabOrder = 1
      object btnPesquisar: TPanel
        Left = 1
        Top = 1
        Width = 82
        Height = 28
        Cursor = crHandPoint
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Pesquisar'
        Color = $001D1916
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentBackground = False
        TabOrder = 0
        OnClick = btnPesquisarClick
      end
    end
    object pnlUsuariosBorda: TPanel
      Left = 1030
      Top = 13
      Width = 80
      Height = 30
      Anchors = [akTop, akRight]
      BevelOuter = bvNone
      Color = $00635A55
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
        Color = $001D1916
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentBackground = False
        TabOrder = 0
        OnClick = btnUsuariosClick
      end
    end
    object pnlNovoAtendimentoBorda: TPanel
      Left = 1120
      Top = 13
      Width = 140
      Height = 30
      Anchors = [akTop, akRight]
      BevelOuter = bvNone
      Color = $00635A55
      Padding.Left = 1
      Padding.Top = 1
      Padding.Right = 1
      Padding.Bottom = 1
      ParentBackground = False
      ShowCaption = False
      TabOrder = 3
      object btnNovoAtendimento: TPanel
        Left = 1
        Top = 1
        Width = 138
        Height = 28
        Cursor = crHandPoint
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Novo atendimento'
        Color = $001D1916
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentBackground = False
        TabOrder = 0
        OnClick = btnNovoAtendimentoClick
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
    DesignSize = (
      1280
      64)
    object shpLinhaRodape: TShape
      Left = 0
      Top = 0
      Width = 1280
      Height = 1
      Align = alTop
      Brush.Color = $00E1DCD8
      Pen.Color = $00E1DCD8
    end
    object pnlVoltarBorda: TPanel
      Left = 1180
      Top = 14
      Width = 80
      Height = 36
      Anchors = [akTop, akRight]
      BevelOuter = bvNone
      Color = $00D2CCC7
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
        Font.Color = $0028231F
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentBackground = False
        TabOrder = 0
        OnClick = btnVoltarClick
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
    DesignSize = (
      1280
      640)
    object lblTitulo: TLabel
      Left = 28
      Top = 20
      Width = 200
      Height = 26
      Caption = 'Log'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = $0028231F
      Font.Height = -21
      Font.Name = 'Comfortaa'
      Font.Style = []
      ParentFont = False
    end
    object lblSubtitulo: TLabel
      Left = 28
      Top = 50
      Width = 100
      Height = 14
      Caption = 'Hist'#243'rico das a'#231#245'es realizadas no sistema. Deixe um filtro em branco para ignor'#225'-lo.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = $0070635B
      Font.Height = -11
      Font.Name = 'Comfortaa'
      Font.Style = []
      ParentFont = False
    end
    object lblSecaoFiltros: TLabel
      Left = 28
      Top = 76
      Width = 70
      Height = 15
      Anchors = [akLeft, akTop]
      Caption = 'Filtros'
    end
    object shpLinhaFiltros: TShape
      Left = 80
      Top = 84
      Width = 1172
      Height = 1
      Anchors = [akLeft, akTop, akRight]
      Brush.Color = $00E1DCD8
      Pen.Color = $00E1DCD8
    end
    object lblDe: TLabel
      Left = 28
      Top = 102
      Width = 100
      Height = 14
      Caption = 'De'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = $0070635B
      Font.Height = -11
      Font.Name = 'Comfortaa'
      Font.Style = []
      ParentFont = False
    end
    object lblAte: TLabel
      Left = 648
      Top = 102
      Width = 100
      Height = 14
      Caption = 'At'#233
      Font.Charset = DEFAULT_CHARSET
      Font.Color = $0070635B
      Font.Height = -11
      Font.Name = 'Comfortaa'
      Font.Style = []
      ParentFont = False
    end
    object lblUsuario: TLabel
      Left = 28
      Top = 158
      Width = 100
      Height = 14
      Caption = 'Usu'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = $0070635B
      Font.Height = -11
      Font.Name = 'Comfortaa'
      Font.Style = []
      ParentFont = False
    end
    object lblAcao: TLabel
      Left = 648
      Top = 158
      Width = 100
      Height = 14
      Caption = 'A'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = $0070635B
      Font.Height = -11
      Font.Name = 'Comfortaa'
      Font.Style = []
      ParentFont = False
    end
    object lblSecaoResultados: TLabel
      Left = 28
      Top = 274
      Width = 70
      Height = 15
      Anchors = [akLeft, akTop]
      Caption = 'Resultados'
    end
    object shpLinhaResultados: TShape
      Left = 110
      Top = 282
      Width = 1142
      Height = 1
      Anchors = [akLeft, akTop, akRight]
      Brush.Color = $00E1DCD8
      Pen.Color = $00E1DCD8
    end
    object dtpDe: TDateTimePicker
      Left = 28
      Top = 120
      Width = 604
      Height = 25
      Date = 46324.000000000000000000
      Time = 0.500000000000000000
      Checked = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = $0028231F
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowCheckbox = True
      TabOrder = 0
    end
    object dtpAte: TDateTimePicker
      Left = 648
      Top = 120
      Width = 604
      Height = 25
      Date = 46324.000000000000000000
      Time = 0.500000000000000000
      Checked = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = $0028231F
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowCheckbox = True
      TabOrder = 1
    end
    object cbxUsuario: TComboBox
      Left = 28
      Top = 176
      Width = 604
      Height = 25
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = $0028231F
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object cbxAcao: TComboBox
      Left = 648
      Top = 176
      Width = 604
      Height = 25
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = $0028231F
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Items.Strings = (
        'Todas'
        'Login'
        'Criou'
        'Editou'
        'Excluiu')
    end
    object btnPesquisarLog: TPanel
      Left = 28
      Top = 220
      Width = 96
      Height = 36
      Cursor = crHandPoint
      Anchors = [akLeft, akTop]
      BevelOuter = bvNone
      Caption = 'Pesquisar'
      Color = $001D1916
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentBackground = False
      TabOrder = 4
    end
    object pnlLimparFiltrosBorda: TPanel
      Left = 134
      Top = 220
      Width = 112
      Height = 36
      Anchors = [akLeft, akTop]
      BevelOuter = bvNone
      Color = $00D2CCC7
      Padding.Left = 1
      Padding.Top = 1
      Padding.Right = 1
      Padding.Bottom = 1
      ParentBackground = False
      ShowCaption = False
      TabOrder = 5
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
        Font.Color = $0028231F
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentBackground = False
        TabOrder = 0
      end
    end
    object lvLog: TDBGrid
      Left = 28
      Top = 296
      Width = 1224
      Height = 324
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = $0028231F
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 6
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = $0028231F
      TitleFont.Height = -13
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = [fsBold]
    end
  end
end
