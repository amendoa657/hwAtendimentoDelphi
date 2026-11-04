object frmUsuarios: TfrmUsuarios
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
      Left = 964
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
      end
    end
    object pnlLogBorda: TPanel
      Left = 1058
      Top = 13
      Width = 52
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
      object btnLog: TPanel
        Left = 1
        Top = 1
        Width = 50
        Height = 28
        Cursor = crHandPoint
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Log'
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
      TabOrder = 4
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
      Width = 90
      Height = 26
      Caption = 'Usu'#225'rios'
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
      Caption = 'Usu'#225'rios desativados n'#227'o aparecem no login, mas o hist'#243'rico deles '#233' mantido.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = $0070635B
      Font.Height = -11
      Font.Name = 'Comfortaa'
      Font.Style = []
      ParentFont = False
    end
    object lblSecaoCadastrados: TLabel
      Left = 28
      Top = 76
      Width = 70
      Height = 15
      Anchors = [akLeft, akTop]
      Caption = 'Cadastrados'
    end
    object shpLinhaCadastrados: TShape
      Left = 112
      Top = 84
      Width = 816
      Height = 1
      Anchors = [akLeft, akTop, akRight]
      Brush.Color = $00E1DCD8
      Pen.Color = $00E1DCD8
    end
    object lblSecaoNovoUsuario: TLabel
      Left = 952
      Top = 76
      Width = 70
      Height = 15
      Anchors = [akTop, akRight]
      Caption = 'Novo usu'#225'rio'
    end
    object shpLinhaNovoUsuario: TShape
      Left = 1044
      Top = 84
      Width = 208
      Height = 1
      Anchors = [akTop, akRight]
      Brush.Color = $00E1DCD8
      Pen.Color = $00E1DCD8
    end
    object lblNome: TLabel
      Left = 952
      Top = 102
      Width = 100
      Height = 14
      Anchors = [akTop, akRight]
      Caption = 'Nome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = $0070635B
      Font.Height = -11
      Font.Name = 'Comfortaa'
      Font.Style = []
      ParentFont = False
    end
    object lblSenha: TLabel
      Left = 952
      Top = 158
      Width = 100
      Height = 14
      Anchors = [akTop, akRight]
      Caption = 'Senha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = $0070635B
      Font.Height = -11
      Font.Name = 'Comfortaa'
      Font.Style = []
      ParentFont = False
    end
    object lvUsuarios: TListView
      Left = 28
      Top = 98
      Width = 900
      Height = 470
      Anchors = [akLeft, akTop, akRight, akBottom]
      Columns = <
        item
          Caption = 'Nome'
          Width = 300
        end
        item
          Caption = 'Admin'
          Width = 300
        end
        item
          Caption = 'Ativo'
          Width = 280
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
      TabOrder = 0
      ViewStyle = vsReport
    end
    object btnAtivarDesativar: TPanel
      Left = 28
      Top = 580
      Width = 140
      Height = 40
      Cursor = crHandPoint
      Anchors = [akLeft, akBottom]
      BevelOuter = bvNone
      Caption = 'Ativar / Desativar'
      Color = $001D1916
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentBackground = False
      TabOrder = 1
    end
    object edtNome: TEdit
      Left = 952
      Top = 120
      Width = 300
      Height = 25
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = $0028231F
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      MaxLength = 50
      TabOrder = 2
    end
    object edtSenha: TEdit
      Left = 952
      Top = 176
      Width = 300
      Height = 25
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = $0028231F
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 3
    end
    object chkAdministrador: TCheckBox
      Left = 952
      Top = 214
      Width = 150
      Height = 19
      Anchors = [akTop, akRight]
      Caption = 'Administrador'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = $0028231F
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object btnCadastrar: TPanel
      Left = 952
      Top = 244
      Width = 300
      Height = 38
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      BevelOuter = bvNone
      Caption = 'Cadastrar'
      Color = $00C27E1A
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentBackground = False
      TabOrder = 5
    end
  end
end
