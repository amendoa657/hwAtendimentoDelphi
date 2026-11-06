object frmAnexosAtendimento: TfrmAnexosAtendimento
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Anexos do atendimento'
  ClientHeight = 384
  ClientWidth = 560
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = $0028231F
  Font.Height = -12
  Font.Name = 'Comfortaa'
  Font.Style = []
  Position = poOwnerFormCenter
  HelpContext = 13
  OnShow = FormShow
  TextHeight = 15
  object lblTitulo: TLabel
    Left = 28
    Top = 20
    Width = 200
    Height = 26
    Caption = 'Anexos do atendimento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = $0028231F
    Font.Height = -21
    Font.Name = 'Comfortaa'
    Font.Style = []
    ParentFont = False
  end
  object lblAtendimento: TLabel
    Left = 28
    Top = 52
    Width = 100
    Height = 14
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = $0070635B
    Font.Height = -11
    Font.Name = 'Comfortaa'
    Font.Style = []
    ParentFont = False
  end
  object lvAnexos: TDBGrid
    Left = 28
    Top = 80
    Width = 504
    Height = 220
    DataSource = dsAnexos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = $0028231F
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = $0028231F
    TitleFont.Height = -13
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 320
    Width = 560
    Height = 64
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    ShowCaption = False
    TabOrder = 1
    object shpLinhaRodape: TShape
      Left = 0
      Top = 0
      Width = 560
      Height = 1
      Align = alTop
      Brush.Color = $00E1DCD8
      Pen.Color = $00E1DCD8
    end
    object btnAbrirAnexo: TPanel
      Left = 232
      Top = 14
      Width = 90
      Height = 36
      Cursor = crHandPoint
      Anchors = [akLeft, akTop]
      BevelOuter = bvNone
      Caption = 'Abrir'
      Color = $001D1916
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentBackground = False
      TabOrder = 0
      OnClick = btnAbrirAnexoClick
    end
    object pnlSalvarAnexoBorda: TPanel
      Left = 332
      Top = 14
      Width = 110
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
      TabOrder = 1
      object btnSalvarAnexo: TPanel
        Left = 1
        Top = 1
        Width = 108
        Height = 34
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
    object pnlFecharBorda: TPanel
      Left = 452
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
      TabOrder = 2
      object btnFechar: TPanel
        Left = 1
        Top = 1
        Width = 86
        Height = 34
        Cursor = crHandPoint
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Fechar'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = $0028231F
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentBackground = False
        TabOrder = 0
        OnClick = btnFecharClick
      end
    end
  end
  object QueryAnexos: TFDQuery
    Left = 40
    Top = 330
  end
  object dsAnexos: TDataSource
    DataSet = QueryAnexos
    Left = 104
    Top = 330
  end
  object dlgSalvarAnexo: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Salvar anexo como'
    Left = 168
    Top = 330
  end
end
