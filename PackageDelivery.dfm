object FrmPackageDelivery: TFrmPackageDelivery
  Left = 0
  Top = 0
  Caption = 'FrmPackageDelivery'
  ClientHeight = 470
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ImgPackage: TImage
    Left = 661
    Top = 17
    Width = 116
    Height = 74
    ParentCustomHint = False
  end
  object LblPackage: TLabel
    Left = 232
    Top = 32
    Width = 377
    Height = 45
    Caption = 'PACKAGE DELIVERY'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblName: TLabel
    Left = 42
    Top = 139
    Width = 98
    Height = 16
    Caption = 'Account Name:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblHeight: TLabel
    Left = 292
    Top = 139
    Width = 77
    Height = 16
    Caption = 'Height(cm):'
    Color = 15790320
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object LblWidth: TLabel
    Left = 297
    Top = 193
    Width = 73
    Height = 16
    Caption = 'Width(cm):'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblLength: TLabel
    Left = 290
    Top = 166
    Width = 80
    Height = 16
    Caption = 'Length(cm):'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblInfo: TLabel
    Left = 40
    Top = 100
    Width = 204
    Height = 25
    Caption = 'DELIVERY DETAILS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object LblWeight: TLabel
    Left = 292
    Top = 220
    Width = 79
    Height = 16
    Caption = 'Weight(Kg):'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblTo: TLabel
    Left = 11
    Top = 166
    Width = 128
    Height = 16
    Caption = 'Delivery To (Name):'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblPackageInfo: TLabel
    Left = 295
    Top = 99
    Width = 197
    Height = 25
    Caption = 'PACKAGE DETAILS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object ImgRectangle: TImage
    Left = 286
    Top = 274
    Width = 212
    Height = 87
  end
  object LblReciept: TLabel
    Left = 608
    Top = 97
    Width = 92
    Height = 25
    Caption = 'RECIEPT'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object LblTime: TLabel
    Left = 8
    Top = 8
    Width = 46
    Height = 14
    Caption = 'LblTime'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BtnHelp: TButton
    Left = 720
    Top = 8
    Width = 33
    Height = 33
    Caption = '?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = BtnHelpClick
  end
  object BtnClose: TButton
    Left = 759
    Top = 8
    Width = 33
    Height = 33
    Caption = 'X'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = BtnCloseClick
  end
  object BtnBack: TButton
    Left = 8
    Top = 429
    Width = 89
    Height = 33
    Caption = 'Back'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = BtnBackClick
  end
  object EdtName: TEdit
    Left = 149
    Top = 138
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'EdtName'
  end
  object EdtHeight: TEdit
    Left = 378
    Top = 138
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'EdtHeight'
  end
  object EdtLength: TEdit
    Left = 376
    Top = 165
    Width = 123
    Height = 21
    TabOrder = 5
    Text = 'EdtLength'
  end
  object EdtWidth: TEdit
    Left = 376
    Top = 192
    Width = 123
    Height = 21
    TabOrder = 6
    Text = 'EdtWidth'
  end
  object EdtWeight: TEdit
    Left = 377
    Top = 219
    Width = 121
    Height = 21
    TabOrder = 7
    Text = 'EdtWeight'
  end
  object BtnLoad: TButton
    Left = 8
    Top = 385
    Width = 505
    Height = 38
    Caption = 'LOAD ORDER'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = BtnLoadClick
  end
  object RedDisplay: TRichEdit
    Left = 532
    Top = 128
    Width = 245
    Height = 209
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'RedDisplay')
    ParentFont = False
    TabOrder = 9
  end
  object CmbTo: TComboBox
    Left = 34
    Top = 337
    Width = 228
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    Text = 'Select Delivery Zone'
    OnChange = CmbToChange
  end
  object BtnConfirm: TButton
    Left = 544
    Top = 343
    Width = 209
    Height = 34
    Caption = 'CONFIRM ORDER'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    OnClick = BtnConfirmClick
  end
  object BtnReset: TButton
    Left = 608
    Top = 415
    Width = 92
    Height = 25
    Caption = 'RESET'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
    OnClick = BtnResetClick
  end
  object RgpDistance: TRadioGroup
    Left = 34
    Top = 226
    Width = 228
    Height = 105
    Caption = 'Delivery Type'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Items.Strings = (
      'Local: 5 Km - 100 Km'
      'Domestic: 100 Km - 1000 Km'
      'International: 1000+ Km')
    ParentFont = False
    TabOrder = 13
    OnClick = RgpDistanceClick
  end
  object EdtTo: TEdit
    Left = 149
    Top = 165
    Width = 121
    Height = 21
    TabOrder = 14
    Text = 'EdtTo'
  end
  object RbtnFragile: TRadioButton
    Left = 323
    Top = 246
    Width = 175
    Height = 17
    Caption = 'Fragile Package?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 15
  end
  object CmbFrom: TComboBox
    Left = 34
    Top = 196
    Width = 228
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 16
    Text = 'Select Collection Zone'
  end
  object BitBtnHint1: TBitBtn
    Left = 8
    Top = 102
    Width = 30
    Height = 25
    DoubleBuffered = True
    Kind = bkIgnore
    ParentDoubleBuffered = False
    TabOrder = 17
    OnClick = BitBtnHint1Click
  end
  object BitBtnHint2: TBitBtn
    Left = 265
    Top = 102
    Width = 28
    Height = 25
    DoubleBuffered = True
    Kind = bkIgnore
    ParentDoubleBuffered = False
    TabOrder = 18
    OnClick = BitBtnHint2Click
  end
  object BtnPrint: TButton
    Left = 560
    Top = 383
    Width = 177
    Height = 26
    Caption = 'PRINT RECIEPT'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 19
    OnClick = BtnPrintClick
  end
  object Ttimer: TTimer
    OnTimer = TtimerTimer
    Left = 120
    Top = 8
  end
end
