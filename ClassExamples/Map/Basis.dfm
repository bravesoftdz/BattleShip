object Form1: TForm1
  Left = 649
  Top = 218
  Width = 573
  Height = 388
  Caption = 'Form1'
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
  object Label1: TLabel
    Left = 416
    Top = 48
    Width = 37
    Height = 13
    Caption = #1053#1072#1095#1072#1083#1086
  end
  object Label2: TLabel
    Left = 496
    Top = 48
    Width = 31
    Height = 13
    Caption = #1050#1086#1085#1077#1094
  end
  object StringGrid1: TStringGrid
    Left = 64
    Top = 32
    Width = 273
    Height = 217
    TabOrder = 0
    OnMouseUp = StringGrid1MouseUp
  end
  object Button1: TButton
    Left = 408
    Top = 104
    Width = 129
    Height = 33
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1086#1088#1072#1073#1083#1100
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 408
    Top = 72
    Width = 57
    Height = 21
    TabOrder = 2
  end
  object Edit2: TEdit
    Left = 480
    Top = 72
    Width = 57
    Height = 21
    TabOrder = 3
  end
  object Button2: TButton
    Left = 416
    Top = 216
    Width = 105
    Height = 33
    Caption = #1053#1072#1095#1072#1090#1100' '#1089#1085#1072#1095#1072#1083#1072
    TabOrder = 4
    OnClick = Button2Click
  end
end
