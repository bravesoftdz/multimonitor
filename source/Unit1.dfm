object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Form1'
  ClientHeight = 212
  ClientWidth = 253
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 27
    Width = 43
    Height = 13
    Caption = 'Monitor :'
  end
  object Label2: TLabel
    Left = 32
    Top = 64
    Width = 61
    Height = 13
    Caption = 'Orientation :'
  end
  object Label3: TLabel
    Left = 120
    Top = 93
    Width = 51
    Height = 13
    Caption = 'Landscape'
  end
  object Label4: TLabel
    Left = 120
    Top = 117
    Width = 36
    Height = 13
    Caption = 'Portrait'
  end
  object Label5: TLabel
    Left = 120
    Top = 141
    Width = 88
    Height = 13
    Caption = 'Landscape Flipped'
  end
  object Label6: TLabel
    Left = 120
    Top = 165
    Width = 73
    Height = 13
    Caption = 'Portrait Flipped'
  end
  object cbMonitor: TComboBox
    Left = 80
    Top = 24
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 0
  end
  object Button1: TButton
    Tag = 1
    Left = 24
    Top = 88
    Width = 75
    Height = 25
    Caption = '0'
    TabOrder = 1
    OnClick = BtnOrientationClick
  end
  object Button2: TButton
    Tag = 2
    Left = 24
    Top = 112
    Width = 75
    Height = 25
    Caption = '90'
    TabOrder = 2
    OnClick = BtnOrientationClick
  end
  object Button3: TButton
    Tag = 3
    Left = 24
    Top = 136
    Width = 75
    Height = 25
    Caption = '180'
    TabOrder = 3
    OnClick = BtnOrientationClick
  end
  object Button4: TButton
    Tag = 4
    Left = 24
    Top = 160
    Width = 75
    Height = 25
    Caption = '270'
    TabOrder = 4
    OnClick = BtnOrientationClick
  end
end
