object Form1: TForm1
  Left = 792
  Top = 56
  Width = 505
  Height = 376
  Caption = #1052#1086#1088#1089#1082#1086#1081' '#1041#1086#1081
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 168
    Top = 72
    Width = 139
    Height = 20
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1089#1074#1086#1105' '#1080#1084#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 136
    Top = 288
    Width = 225
    Height = 20
    Caption = #1054#1090#1087#1088#1072#1074#1082#1072' '#1076#1072#1085#1085#1099#1093' '#1085#1072' '#1089#1077#1088#1074#1077#1088'...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object edt1: TEdit
    Left = 160
    Top = 136
    Width = 153
    Height = 21
    TabOrder = 0
  end
  object btn1: TButton
    Left = 184
    Top = 224
    Width = 105
    Height = 41
    Caption = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1100#1089#1103
    TabOrder = 1
    OnClick = btn1Click
  end
  object ClientSocket1: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnConnect = ClientSocket1Connect
    Left = 80
    Top = 72
  end
end
