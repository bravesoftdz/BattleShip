object Form2: TForm2
  Left = 363
  Top = 323
  Width = 573
  Height = 376
  Caption = #1056#1072#1089#1089#1090#1072#1085#1086#1074#1082#1072' '#1082#1086#1088#1072#1073#1083#1077#1081
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 312
    Top = 48
    Width = 73
    Height = 13
    Caption = #1054#1076#1085#1086#1087#1072#1083#1091#1073#1085#1080#1082
  end
  object lbl2: TLabel
    Left = 448
    Top = 48
    Width = 72
    Height = 13
    Caption = #1044#1074#1091#1093#1087#1072#1083#1091#1073#1085#1080#1082
  end
  object lbl3: TLabel
    Left = 320
    Top = 160
    Width = 71
    Height = 13
    Caption = #1058#1088#1105#1093#1087#1072#1083#1091#1073#1085#1080#1082
  end
  object lbl4: TLabel
    Left = 440
    Top = 160
    Width = 91
    Height = 13
    Caption = #1063#1077#1090#1099#1088#1105#1093#1087#1072#1083#1091#1073#1085#1080#1082
  end
  object Label9: TLabel
    Left = 336
    Top = 208
    Width = 32
    Height = 13
    Caption = 'Label9'
  end
  object Label7: TLabel
    Left = 336
    Top = 80
    Width = 32
    Height = 13
    Caption = 'Label9'
  end
  object Label8: TLabel
    Left = 464
    Top = 80
    Width = 32
    Height = 13
    Caption = 'Label9'
  end
  object Label10: TLabel
    Left = 464
    Top = 208
    Width = 32
    Height = 13
    Caption = 'Label9'
  end
  object Label1: TLabel
    Left = 264
    Top = 296
    Width = 63
    Height = 20
    Caption = #1046#1076#1080#1090#1077'...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label2: TLabel
    Left = 99
    Top = 8
    Width = 3
    Height = 13
  end
  object StringGrid1: TStringGrid
    Left = 24
    Top = 40
    Width = 233
    Height = 201
    TabOrder = 0
    OnDrawCell = StringGrid1DrawCell
    OnMouseUp = StringGrid1MouseUp
  end
  object btn1: TButton
    Left = 80
    Top = 288
    Width = 89
    Height = 49
    Caption = #1057#1073#1088#1086#1089
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 376
    Top = 280
    Width = 113
    Height = 49
    Caption = #1071' '#1075#1086#1090#1086#1074'!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btn2Click
  end
end
