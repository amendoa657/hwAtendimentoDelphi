object frmPesquisarAtendimento: TfrmPesquisarAtendimento
  Left = 0
  Top = 0
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
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
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
    DesignSize = (
      1280
      56)
    object lblAppTitulo: TLabel
      Left = 74
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
    object pnlLogo: TPanel
      Left = 20
      Top = 12
      Width = 42
      Height = 32
      BevelOuter = bvNone
      Caption = 'hw'
      Color = 12877596
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object pnlNovoAtendimentoBorda: TPanel
      Left = 968
      Top = 13
      Width = 140
      Height = 30
      Anchors = [akTop, akRight]
      BevelOuter = bvNone
      Color = 6511189
      Padding.Left = 1
      Padding.Top = 1
      Padding.Right = 1
      Padding.Bottom = 1
      ParentBackground = False
      ShowCaption = False
      TabOrder = 1
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
      Left = 1180
      Top = 13
      Width = 80
      Height = 30
      Anchors = [akTop, akRight]
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
      Left = 1118
      Top = 13
      Width = 52
      Height = 30
      Anchors = [akTop, akRight]
      BevelOuter = bvNone
      Color = 6511189
      Padding.Left = 1
      Padding.Top = 1
      Padding.Right = 1
      Padding.Bottom = 1
      ParentBackground = False
      ShowCaption = False
      TabOrder = 3
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
    OnResize = pnlConteudoResize
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
      Top = 330
      Width = 66
      Height = 19
      Caption = 'Resultados'
    end
    object shpLinhaResultados: TShape
      Left = 110
      Top = 338
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
    object btnPesquisar: TPanel
      Left = 28
      Top = 276
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
      Top = 276
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
      end
    end
    object lvResultados: TDBGrid
      Left = 28
      Top = 352
      Width = 1224
      Height = 216
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
    end
    object btnEditar: TPanel
      Left = 28
      Top = 580
      Width = 100
      Height = 40
      Cursor = crHandPoint
      Anchors = [akLeft, akBottom]
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
      TabOrder = 9
      OnClick = btnEditarClick
    end
    object pnlExcluirBorda: TPanel
      Left = 138
      Top = 580
      Width = 100
      Height = 40
      Anchors = [akLeft, akBottom]
      BevelOuter = bvNone
      Color = 2631878
      Padding.Left = 1
      Padding.Top = 1
      Padding.Right = 1
      Padding.Bottom = 1
      ParentBackground = False
      ShowCaption = False
      TabOrder = 10
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
