object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'HW Atendimento'
  ClientHeight = 420
  ClientWidth = 400
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = $0028231F
  Font.Height = -12
  Font.Name = 'Comfortaa'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  TextHeight = 15
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 400
    Height = 110
    Align = alTop
    BevelOuter = bvNone
    Color = $001D1916
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    object lblAppTitulo: TLabel
      Left = 170
      Top = 43
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
      Left = 118
      Top = 39
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
  end
  object lblTitulo: TLabel
    Left = 40
    Top = 136
    Width = 200
    Height = 26
    Caption = 'Entrar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = $0028231F
    Font.Height = -21
    Font.Name = 'Comfortaa'
    Font.Style = []
    ParentFont = False
  end
  object lblSubtitulo: TLabel
    Left = 40
    Top = 168
    Width = 100
    Height = 14
    Caption = 'Informe seu usu'#225'rio e senha para continuar.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = $0070635B
    Font.Height = -11
    Font.Name = 'Comfortaa'
    Font.Style = []
    ParentFont = False
  end
  object lblUsuario: TLabel
    Left = 40
    Top = 200
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
  object lblSenha: TLabel
    Left = 40
    Top = 258
    Width = 100
    Height = 14
    Caption = 'Senha'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = $0070635B
    Font.Height = -11
    Font.Name = 'Comfortaa'
    Font.Style = []
    ParentFont = False
  end
  object lblErroLogin: TLabel
    Left = 40
    Top = 314
    Width = 100
    Height = 14
    Caption = #10006' Usu'#225'rio ou senha inv'#225'lidos.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = $002828C6
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object edtUsuario: TEdit
    Left = 40
    Top = 218
    Width = 320
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = $0028231F
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    MaxLength = 50
    TabOrder = 1
  end
  object edtSenha: TEdit
    Left = 40
    Top = 276
    Width = 320
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = $0028231F
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 2
  end
  object btnEntrar: TPanel
    Left = 40
    Top = 342
    Width = 320
    Height = 40
    Cursor = crHandPoint
    Anchors = [akLeft, akTop]
    BevelOuter = bvNone
    Caption = 'Entrar'
    Color = $00C27E1A
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ParentBackground = False
    TabOrder = 3
    OnClick = btnEntrarClick
  end
end
