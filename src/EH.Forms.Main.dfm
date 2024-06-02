object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Everything Helper'
  ClientHeight = 721
  ClientWidth = 994
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object edSearchFilter: TEdit
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 988
    Height = 23
    Align = alTop
    TabOrder = 0
    Text = 'NGFramework.Tokenizer .pas'
    OnKeyDown = edSearchFilterKeyDown
  end
  object sgResults: TStringGrid
    AlignWithMargins = True
    Left = 3
    Top = 32
    Width = 988
    Height = 686
    Align = alClient
    ColCount = 7
    DoubleBuffered = True
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goRowSelect, goFixedRowDefAlign]
    ParentDoubleBuffered = False
    TabOrder = 1
  end
end
