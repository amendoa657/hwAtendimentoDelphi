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
    object pnlNovoAtendimentoBorda: TPanel
      Left = 1030
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
        Color = $001D1916
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentBackground = False
        TabOrder = 0
      end
    end
    object pnlUsuariosBorda: TPanel
      Left = 1180
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
      Width = 230
      Height = 26
      Caption = 'Pesquisar atendimentos'
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
      Caption = 'Deixe um filtro em branco para ignor'#225'-lo.'
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
      Width = 50
      Height = 15
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
    object lblNomeCliente: TLabel
      Left = 28
      Top = 158
      Width = 100
      Height = 14
      Caption = 'Nome do cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = $0070635B
      Font.Height = -11
      Font.Name = 'Comfortaa'
      Font.Style = []
      ParentFont = False
    end
    object lblNumeroSerie: TLabel
      Left = 648
      Top = 158
      Width = 100
      Height = 14
      Caption = 'N'#250'mero de s'#233'rie'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = $0070635B
      Font.Height = -11
      Font.Name = 'Comfortaa'
      Font.Style = []
      ParentFont = False
    end
    object lblDescricao: TLabel
      Left = 28
      Top = 214
      Width = 100
      Height = 14
      Caption = 'Descri'#231#227'o cont'#233'm'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = $0070635B
      Font.Height = -11
      Font.Name = 'Comfortaa'
      Font.Style = []
      ParentFont = False
    end
    object lblTelefone: TLabel
      Left = 648
      Top = 214
      Width = 100
      Height = 14
      Caption = 'Telefone'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = $0070635B
      Font.Height = -11
      Font.Name = 'Comfortaa'
      Font.Style = []
      ParentFont = False
    end
    object lblSecaoResultados: TLabel
      Left = 28
      Top = 330
      Width = 50
      Height = 15
      Caption = 'Resultados'
    end
    object shpLinhaResultados: TShape
      Left = 110
      Top = 338
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
    object edtNomeCliente: TEdit
      Left = 28
      Top = 176
      Width = 604
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = $0028231F
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      MaxLength = 100
      TabOrder = 2
      TextHint = 'Nome ou parte do nome'
    end
    object edtNumeroSerie: TEdit
      Left = 648
      Top = 176
      Width = 604
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = $0028231F
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      CharCase = ecUpperCase
      MaxLength = 11
      TabOrder = 3
      TextHint = 'XX000000000'
    end
    object edtDescricao: TEdit
      Left = 28
      Top = 232
      Width = 604
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = $0028231F
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
      Font.Color = $0028231F
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      MaxLength = 15
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
      Color = $001D1916
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentBackground = False
      TabOrder = 6
    end
    object pnlLimparFiltrosBorda: TPanel
      Left = 134
      Top = 276
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
        Font.Color = $0028231F
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentBackground = False
        TabOrder = 0
      end
    end
    object lvResultados: TListView
      Left = 28
      Top = 352
      Width = 1224
      Height = 268
      Anchors = [akLeft, akTop, akRight, akBottom]
      Columns = <
        item
          Caption = 'In'#237'cio'
          Width = 140
        end
        item
          Caption = 'Modelo'
          Width = 110
        end
        item
          Caption = 'N'#186' de s'#233'rie'
          Width = 120
        end
        item
          Caption = 'Cliente'
          Width = 200
        end
        item
          Caption = 'Telefone'
          Width = 130
        end
        item
          Caption = 'Dura'#231#227'o'
          Width = 90
        end
        item
          Caption = 'Descri'#231#227'o'
          Width = 410
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = $0028231F
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      GridLines = True
      ReadOnly = True
      RowSelect = True
      TabOrder = 8
      ViewStyle = vsReport
    end
  end
end
