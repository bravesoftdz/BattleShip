object Form3: TForm3
  Left = 378
  Top = 165
  Width = 578
  Height = 376
  Caption = 'Form3'
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
    Left = 104
    Top = 16
    Width = 3
    Height = 13
  end
  object StringGrid1: TStringGrid
    Left = 32
    Top = 48
    Width = 233
    Height = 201
    TabOrder = 0
    OnDrawCell = StringGrid1DrawCell
  end
  object StringGrid2: TStringGrid
    Left = 320
    Top = 48
    Width = 225
    Height = 209
    TabOrder = 1
    OnDrawCell = StringGrid2DrawCell
    OnMouseUp = StringGrid2MouseUp
    RowHeights = (
      24
      24
      24
      24
      24)
  end
end
