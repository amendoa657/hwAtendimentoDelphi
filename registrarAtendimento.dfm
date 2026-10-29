object frmRegistrarAtendimento: TfrmRegistrarAtendimento
  Left = 0
  Top = 0
  Caption = 'HW Atendimento'
  ClientHeight = 760
  ClientWidth = 1280
  Color = 15986925
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
    object pnlPesquisarBorda: TPanel
      Left = 1086
      Top = 13
      Width = 84
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
      object btnPesquisar: TPanel
        Left = 1
        Top = 1
        Width = 82
        Height = 28
        Cursor = crHandPoint
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Pesquisar'
        Color = 1906966
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
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
    TabOrder = 3
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
    object pnlCancelarBorda: TPanel
      Left = 1012
      Top = 14
      Width = 88
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
      object btnCancelar: TPanel
        Left = 1
        Top = 1
        Width = 86
        Height = 34
        Cursor = crHandPoint
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Cancelar'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 2630431
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        OnClick = btnCancelarClick
      end
    end
    object btnSalvar: TPanel
      Left = 1110
      Top = 14
      Width = 150
      Height = 36
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      BevelOuter = bvNone
      Caption = 'Salvar atendimento'
      Color = 12746266
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      OnClick = btnSalvarClick
    end
  end
  object pnlHistorico: TPanel
    Left = 970
    Top = 56
    Width = 310
    Height = 640
    Align = alRight
    BevelOuter = bvNone
    Color = 16447735
    ParentBackground = False
    ShowCaption = False
    TabOrder = 2
    ExplicitTop = 62
    DesignSize = (
      310
      640)
    object shpSeparadorHistorico: TShape
      Left = 0
      Top = 0
      Width = 1
      Height = 640
      Align = alLeft
      Brush.Color = 14802136
      Pen.Color = 14802136
    end
    object lblHistoricoTitulo: TLabel
      Left = 21
      Top = 24
      Width = 222
      Height = 26
      Caption = 'Hist'#243'rico do equipamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2630431
      Font.Height = -16
      Font.Name = 'Comfortaa'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object shpLinhaHistorico: TShape
      Left = 21
      Top = 54
      Width = 269
      Height = 1
      Anchors = [akLeft, akTop, akRight]
      Brush.Color = 14802136
      Pen.Color = 14802136
    end
    object lblHistoricoInfo: TLabel
      Left = 21
      Top = 70
      Width = 269
      Height = 51
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'Busque um n'#250'mero de s'#233'rie para ver os atendimentos anteriores.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7365467
      Font.Height = -11
      Font.Name = 'Comfortaa'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
    end
    object lvHistorico: TListView
      Left = 21
      Top = 127
      Width = 269
      Height = 493
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderStyle = bsNone
      Color = 16447735
      Columns = <
        item
          Caption = 'Data'
          Width = 70
        end
        item
          Caption = 'Cliente'
          Width = 100
        end
        item
          Caption = 'Descri'#231#227'o'
          Width = 200
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2630431
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ReadOnly = True
      RowSelect = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      ViewStyle = vsReport
      Visible = False
    end
  end
  object sbxConteudo: TScrollBox
    Left = 0
    Top = 56
    Width = 970
    Height = 640
    HorzScrollBar.Visible = False
    VertScrollBar.Tracking = True
    Align = alClient
    BorderStyle = bsNone
    Color = 15986925
    ParentColor = False
    TabOrder = 1
    object pnlFormulario: TPanel
      Left = 0
      Top = 0
      Width = 970
      Height = 640
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      ShowCaption = False
      TabOrder = 0
      OnResize = pnlFormularioResize
      DesignSize = (
        970
        640)
      object lblNovoAtendimento: TLabel
        Left = 28
        Top = 24
        Width = 201
        Height = 34
        Caption = 'Novo atendimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 2630431
        Font.Height = -21
        Font.Name = 'Comfortaa'
        Font.Style = []
        ParentFont = False
      end
      object lblSubtitulo: TLabel
        Left = 28
        Top = 60
        Width = 267
        Height = 18
        Caption = 'Comece pelo n'#250'mero de s'#233'rie do equipamento.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7365467
        Font.Height = -11
        Font.Name = 'Comfortaa'
        Font.Style = []
        ParentFont = False
      end
      object lblNumeroSerie: TLabel
        Left = 28
        Top = 86
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
      object lblErroSerie: TLabel
        Left = 28
        Top = 138
        Width = 146
        Height = 13
        Caption = #10006' N'#250'mero de s'#233'rie inv'#225'lido!'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 2631878
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object lblSecaoEquipamento: TLabel
        Left = 28
        Top = 164
        Width = 82
        Height = 19
        Caption = 'Equipamento'
      end
      object shpLinhaEquipamento: TShape
        Left = 118
        Top = 172
        Width = 824
        Height = 1
        Anchors = [akLeft, akTop, akRight]
        Brush.Color = 14802136
        Pen.Color = 14802136
      end
      object lblModelo: TLabel
        Left = 28
        Top = 192
        Width = 43
        Height = 18
        Caption = 'Modelo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7365467
        Font.Height = -11
        Font.Name = 'Comfortaa'
        Font.Style = []
        ParentFont = False
      end
      object lblSecaoCliente: TLabel
        Left = 28
        Top = 254
        Width = 42
        Height = 19
        Caption = 'Cliente'
      end
      object shpLinhaCliente: TShape
        Left = 80
        Top = 262
        Width = 862
        Height = 1
        Anchors = [akLeft, akTop, akRight]
        Brush.Color = 14802136
        Pen.Color = 14802136
      end
      object lblEmpresa: TLabel
        Left = 28
        Top = 312
        Width = 51
        Height = 18
        Caption = 'Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7365467
        Font.Height = -11
        Font.Name = 'Comfortaa'
        Font.Style = []
        ParentFont = False
      end
      object lblNome: TLabel
        Left = 28
        Top = 372
        Width = 33
        Height = 18
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7365467
        Font.Height = -11
        Font.Name = 'Comfortaa'
        Font.Style = []
        ParentFont = False
      end
      object lblTelefone: TLabel
        Left = 493
        Top = 372
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
      object lblSecaoAtendimento: TLabel
        Left = 28
        Top = 434
        Width = 78
        Height = 19
        Caption = 'Atendimento'
      end
      object shpLinhaAtendimento: TShape
        Left = 116
        Top = 442
        Width = 826
        Height = 1
        Anchors = [akLeft, akTop, akRight]
        Brush.Color = 14802136
        Pen.Color = 14802136
      end
      object lblInicio: TLabel
        Left = 28
        Top = 462
        Width = 30
        Height = 18
        Caption = 'In'#237'cio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7365467
        Font.Height = -11
        Font.Name = 'Comfortaa'
        Font.Style = []
        ParentFont = False
      end
      object lblTermino: TLabel
        Left = 493
        Top = 462
        Width = 195
        Height = 18
        Caption = 'T'#233'rmino (desmarcado = em aberto)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7365467
        Font.Height = -11
        Font.Name = 'Comfortaa'
        Font.Style = []
        ParentFont = False
      end
      object lblDescricao: TLabel
        Left = 28
        Top = 524
        Width = 356
        Height = 18
        Caption = 
          'Descri'#231#227'o (o que foi verificado e o que foi feito no atendimento' +
          ')'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7365467
        Font.Height = -11
        Font.Name = 'Comfortaa'
        Font.Style = []
        ParentFont = False
      end
      object edtNumeroSerie: TEdit
        Left = 28
        Top = 104
        Width = 826
        Height = 27
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 2630431
        Font.Height = -16
        Font.Name = 'Consolas'
        Font.Style = []
        MaxLength = 11
        ParentFont = False
        TabOrder = 0
        TextHint = 'XX000000000'
        OnChange = edtNumeroSerieChange
        OnKeyPress = edtNumeroSerieKeyPress
      end
      object btnBuscar: TPanel
        Left = 862
        Top = 104
        Width = 80
        Height = 27
        Cursor = crHandPoint
        Anchors = [akTop, akRight]
        BevelOuter = bvNone
        Caption = 'Buscar'
        Color = 1906966
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        OnClick = btnBuscarClick
      end
      object cbxModelo: TComboBox
        Left = 28
        Top = 210
        Width = 914
        Height = 25
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 2630431
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Items.Strings = (
          'ECGV6'
          'ECGV11'
          'Ergo13'
          'ErgoMET13'
          'ErgoCP')
      end
      object rbPessoaFisica: TRadioButton
        Left = 28
        Top = 282
        Width = 110
        Height = 19
        Caption = 'Pessoa f'#237'sica'
        Checked = True
        TabOrder = 3
        TabStop = True
        OnClick = TipoPessoaClick
      end
      object rbPessoaJuridica: TRadioButton
        Left = 146
        Top = 282
        Width = 120
        Height = 19
        Caption = 'Pessoa jur'#237'dica'
        TabOrder = 4
        OnClick = TipoPessoaClick
      end
      object edtEmpresa: TEdit
        Left = 28
        Top = 330
        Width = 914
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        Color = 16447735
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 2630431
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        TextHint = 'Somente para pessoa jur'#237'dica'
      end
      object edtNome: TEdit
        Left = 28
        Top = 390
        Width = 449
        Height = 25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 2630431
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 100
        ParentFont = False
        TabOrder = 6
        TextHint = 'Insira o nome do cliente'
      end
      object edtTelefone: TEdit
        Left = 493
        Top = 390
        Width = 449
        Height = 25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 2630431
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 15
        ParentFont = False
        TabOrder = 7
        TextHint = '(00) 00000-0000'
        OnChange = edtTelefoneChange
      end
      object dtpInicioData: TDateTimePicker
        Left = 28
        Top = 480
        Width = 361
        Height = 25
        Date = 46324.00000000000000000
        Time = 0.50000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 2630431
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
      object dtpInicioHora: TDateTimePicker
        Left = 397
        Top = 480
        Width = 80
        Height = 25
        Date = 46324.00000000000000000
        Format = 'HH:mm'
        Time = 0.50000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 2630431
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        Kind = dtkTime
        ParentFont = False
        TabOrder = 9
      end
      object dtpTerminoData: TDateTimePicker
        Left = 493
        Top = 480
        Width = 361
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
        TabOrder = 10
        OnChange = dtpTerminoDataChange
      end
      object dtpTerminoHora: TDateTimePicker
        Left = 862
        Top = 480
        Width = 80
        Height = 25
        Date = 46324.00000000000000000
        Format = 'HH:mm'
        Time = 0.50000000000000000
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 2630431
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        Kind = dtkTime
        ParentFont = False
        TabOrder = 11
      end
      object memDescricao: TMemo
        Left = 28
        Top = 542
        Width = 914
        Height = 70
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 2630431
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 12
      end
    end
  end
end
