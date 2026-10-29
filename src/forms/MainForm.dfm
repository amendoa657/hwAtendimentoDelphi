object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'HWatendimento'
  ClientHeight = 160
  ClientWidth = 320
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object lblHello: TLabel
    Left = 16
    Top = 24
    Width = 87
    Height = 15
    Caption = 'Press the button'
  end
  object btnHello: TButton
    Left = 16
    Top = 64
    Width = 96
    Height = 25
    Caption = 'Hello'
    TabOrder = 0
    OnClick = btnHelloClick
    OnEnter = btnHelloEnter
  end
end
