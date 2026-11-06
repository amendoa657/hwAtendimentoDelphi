object frmEditarAtendimento: TfrmEditarAtendimento
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Editar atendimento'
  ClientHeight = 672
  ClientWidth = 640
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = $0028231F
  Font.Height = -12
  Font.Name = 'Comfortaa'
  Font.Style = []
  Position = poOwnerFormCenter
  HelpContext = 8
  OnShow = FormShow
  TextHeight = 15
  object lblTitulo: TLabel
    Left = 28
    Top = 20
    Width = 200
    Height = 26
    Caption = 'Editar atendimento'
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
    Caption = 'Altere as datas e a descri'#231#227'o do atendimento.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = $0070635B
    Font.Height = -11
    Font.Name = 'Comfortaa'
    Font.Style = []
    ParentFont = False
  end
  object lblSecaoEquipamento: TLabel
    Left = 28
    Top = 76
    Width = 70
    Height = 15
    Anchors = [akLeft, akTop]
    Caption = 'Equipamento e cliente'
  end
  object shpLinhaEquipamento: TShape
    Left = 184
    Top = 84
    Width = 428
    Height = 1
    Anchors = [akLeft, akTop]
    Brush.Color = $00E1DCD8
    Pen.Color = $00E1DCD8
  end
  object lblNumeroSerie: TLabel
    Left = 28
    Top = 102
    Width = 100
    Height = 14
    Caption = 'N'#186' de s'#233'rie'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = $0070635B
    Font.Height = -11
    Font.Name = 'Comfortaa'
    Font.Style = []
    ParentFont = False
  end
  object lblNumeroSerieValor: TLabel
    Left = 28
    Top = 120
    Width = 100
    Height = 17
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = $0028231F
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblModelo: TLabel
    Left = 330
    Top = 102
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
  object lblModeloValor: TLabel
    Left = 330
    Top = 120
    Width = 100
    Height = 17
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = $0028231F
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblCliente: TLabel
    Left = 28
    Top = 150
    Width = 100
    Height = 14
    Caption = 'Cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = $0070635B
    Font.Height = -11
    Font.Name = 'Comfortaa'
    Font.Style = []
    ParentFont = False
  end
  object lblClienteValor: TLabel
    Left = 28
    Top = 168
    Width = 100
    Height = 17
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = $0028231F
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblTelefone: TLabel
    Left = 330
    Top = 150
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
  object lblTelefoneValor: TLabel
    Left = 330
    Top = 168
    Width = 100
    Height = 17
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = $0028231F
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblSecaoAtendimento: TLabel
    Left = 28
    Top = 206
    Width = 70
    Height = 15
    Anchors = [akLeft, akTop]
    Caption = 'Atendimento'
  end
  object shpLinhaAtendimento: TShape
    Left = 120
    Top = 214
    Width = 492
    Height = 1
    Anchors = [akLeft, akTop]
    Brush.Color = $00E1DCD8
    Pen.Color = $00E1DCD8
  end
  object lblInicio: TLabel
    Left = 28
    Top = 232
    Width = 100
    Height = 14
    Caption = 'In'#237'cio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = $0070635B
    Font.Height = -11
    Font.Name = 'Comfortaa'
    Font.Style = []
    ParentFont = False
  end
  object lblTermino: TLabel
    Left = 330
    Top = 232
    Width = 100
    Height = 14
    Caption = 'T'#233'rmino (desmarcado = em aberto)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = $0070635B
    Font.Height = -11
    Font.Name = 'Comfortaa'
    Font.Style = []
    ParentFont = False
  end
  object lblDescricao: TLabel
    Left = 28
    Top = 290
    Width = 100
    Height = 14
    Caption = 'Descri'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = $0070635B
    Font.Height = -11
    Font.Name = 'Comfortaa'
    Font.Style = []
    ParentFont = False
  end
  object dtpInicioData: TDateTimePicker
    Left = 28
    Top = 250
    Width = 190
    Height = 25
    Date = 46324.000000000000000000
    Time = 0.500000000000000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = $0028231F
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object dtpInicioHora: TDateTimePicker
    Left = 226
    Top = 250
    Width = 80
    Height = 25
    Date = 46324.000000000000000000
    Format = 'HH:mm'
    Time = 0.500000000000000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = $0028231F
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    Kind = dtkTime
    TabOrder = 1
  end
  object dtpTerminoData: TDateTimePicker
    Left = 330
    Top = 250
    Width = 190
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
    TabOrder = 2
  end
  object dtpTerminoHora: TDateTimePicker
    Left = 528
    Top = 250
    Width = 84
    Height = 25
    Date = 46324.000000000000000000
    Format = 'HH:mm'
    Time = 0.500000000000000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = $0028231F
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    Kind = dtkTime
    TabOrder = 3
  end
  object memDescricao: TMemo
    Left = 28
    Top = 308
    Width = 584
    Height = 100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = $0028231F
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 4
  end
  object lblSecaoAnexos: TLabel
    Left = 28
    Top = 420
    Width = 70
    Height = 15
    Anchors = [akLeft, akTop]
    Caption = 'Anexos'
  end
  object shpLinhaAnexos: TShape
    Left = 90
    Top = 428
    Width = 522
    Height = 1
    Anchors = [akLeft, akTop]
    Brush.Color = $00E1DCD8
    Pen.Color = $00E1DCD8
  end
  object lvAnexos: TDBGrid
    Left = 28
    Top = 442
    Width = 584
    Height = 110
    DataSource = dsAnexos
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
  object btnAnexar: TPanel
    Left = 28
    Top = 562
    Width = 90
    Height = 30
    Cursor = crHandPoint
    Anchors = [akLeft, akTop]
    BevelOuter = bvNone
    Caption = 'Anexar'
    Color = $001D1916
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ParentBackground = False
    TabOrder = 7
    OnClick = btnAnexarClick
  end
  object pnlAbrirAnexoBorda: TPanel
    Left = 126
    Top = 562
    Width = 90
    Height = 30
    Anchors = [akLeft, akTop]
    BevelOuter = bvNone
    Color = $00D2CCC7
    Padding.Left = 1
    Padding.Top = 1
    Padding.Right = 1
    Padding.Bottom = 1
    ParentBackground = False
    ShowCaption = False
    TabOrder = 8
    object btnAbrirAnexo: TPanel
      Left = 1
      Top = 1
      Width = 88
      Height = 28
      Cursor = crHandPoint
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Abrir'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = $0028231F
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentBackground = False
      TabOrder = 0
      OnClick = btnAbrirAnexoClick
    end
  end
  object pnlSalvarAnexoBorda: TPanel
    Left = 224
    Top = 562
    Width = 110
    Height = 30
    Anchors = [akLeft, akTop]
    BevelOuter = bvNone
    Color = $00D2CCC7
    Padding.Left = 1
    Padding.Top = 1
    Padding.Right = 1
    Padding.Bottom = 1
    ParentBackground = False
    ShowCaption = False
    TabOrder = 9
    object btnSalvarAnexo: TPanel
      Left = 1
      Top = 1
      Width = 108
      Height = 28
      Cursor = crHandPoint
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Salvar como'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = $0028231F
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentBackground = False
      TabOrder = 0
      OnClick = btnSalvarAnexoClick
    end
  end
  object pnlRemoverAnexoBorda: TPanel
    Left = 342
    Top = 562
    Width = 100
    Height = 30
    Anchors = [akLeft, akTop]
    BevelOuter = bvNone
    Color = $002828C6
    Padding.Left = 1
    Padding.Top = 1
    Padding.Right = 1
    Padding.Bottom = 1
    ParentBackground = False
    ShowCaption = False
    TabOrder = 10
    object btnRemoverAnexo: TPanel
      Left = 1
      Top = 1
      Width = 98
      Height = 28
      Cursor = crHandPoint
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Remover'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = $002828C6
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentBackground = False
      TabOrder = 0
      OnClick = btnRemoverAnexoClick
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 608
    Width = 640
    Height = 64
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    ShowCaption = False
    TabOrder = 5
    object shpLinhaRodape: TShape
      Left = 0
      Top = 0
      Width = 640
      Height = 1
      Align = alTop
      Brush.Color = $00E1DCD8
      Pen.Color = $00E1DCD8
    end
    object pnlCancelarBorda: TPanel
      Left = 372
      Top = 14
      Width = 88
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
        Font.Color = $0028231F
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentBackground = False
        TabOrder = 0
        OnClick = btnCancelarClick
      end
    end
    object btnSalvar: TPanel
      Left = 470
      Top = 14
      Width = 150
      Height = 36
      Cursor = crHandPoint
      Anchors = [akLeft, akTop]
      BevelOuter = bvNone
      Caption = 'Salvar altera'#231#245'es'
      Color = $00C27E1A
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentBackground = False
      TabOrder = 1
      OnClick = btnSalvarClick
    end
  end
  object QueryAnexos: TFDQuery
    Left = 40
    Top = 620
  end
  object dsAnexos: TDataSource
    DataSet = QueryAnexos
    Left = 104
    Top = 620
  end
  object dlgAbrirAnexo: TOpenDialog
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Title = 'Escolha o arquivo para anexar'
    Left = 168
    Top = 620
  end
  object dlgSalvarAnexo: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Salvar anexo como'
    Left = 232
    Top = 620
  end
end
