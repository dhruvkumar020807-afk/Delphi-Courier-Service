object FrmStaffHub: TFrmStaffHub
  Left = 0
  Top = 0
  Caption = 'FrmStaffHub'
  ClientHeight = 470
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -21
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 25
  object ImgStaffHub: TImage
    Left = 672
    Top = 360
    Width = 120
    Height = 102
  end
  object LblStaffHub: TLabel
    Left = 304
    Top = 32
    Width = 206
    Height = 45
    Caption = 'STAFF HUB'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
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
    TabOrder = 0
    OnClick = BtnCloseClick
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
    TabOrder = 1
    OnClick = BtnHelpClick
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
  object BtnAccount: TButton
    Left = 248
    Top = 278
    Width = 313
    Height = 49
    Caption = 'VIEW CUSTOMERS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = BtnAccountClick
  end
  object BtnViewOrders: TButton
    Left = 248
    Top = 168
    Width = 313
    Height = 49
    Caption = 'VIEW ALL ORDERS'
    TabOrder = 4
    OnClick = BtnViewOrdersClick
  end
  object BtnCustomerHub: TButton
    Left = 248
    Top = 333
    Width = 313
    Height = 49
    Caption = 'CUSTOMER HUB'
    TabOrder = 5
    OnClick = BtnCustomerHubClick
  end
  object BtnViewMyOrder: TButton
    Left = 248
    Top = 223
    Width = 313
    Height = 49
    Caption = 'VIEW MY ORDER'
    TabOrder = 6
    OnClick = BtnViewMyOrderClick
  end
  object BtnViewAccount: TButton
    Left = 248
    Top = 113
    Width = 313
    Height = 49
    Caption = 'VIEW MY ACCOUNT'
    TabOrder = 7
    OnClick = BtnViewAccountClick
  end
  object TTime: TTimer
    OnTimer = TTimeTimer
    Left = 136
    Top = 8
  end
end
