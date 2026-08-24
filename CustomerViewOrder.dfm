object FrmCustomerViewOrder: TFrmCustomerViewOrder
  Left = 0
  Top = 0
  Caption = 'FrmCustomerViewOrder'
  ClientHeight = 471
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
  object ImgViewOrder: TImage
    Left = 688
    Top = 60
    Width = 88
    Height = 78
  end
  object LblViewOrder: TLabel
    Left = 274
    Top = 24
    Width = 234
    Height = 45
    Caption = 'Order Status'
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
  object LblFrom: TLabel
    Left = 226
    Top = 144
    Width = 121
    Height = 19
    Caption = 'Package From:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblTo: TLabel
    Left = 245
    Top = 174
    Width = 101
    Height = 19
    Caption = 'Package To:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblCustomerCode: TLabel
    Left = 217
    Top = 116
    Width = 130
    Height = 19
    Caption = 'Customer Code:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblDeliveryType: TLabel
    Left = 229
    Top = 230
    Width = 118
    Height = 19
    Caption = 'Delivery Type:'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object LblAssignedStaff: TLabel
    Left = 204
    Top = 257
    Width = 143
    Height = 19
    Caption = 'Pick-Up Location:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ShowAccelChar = False
  end
  object LblPackageDestination: TLabel
    Left = 173
    Top = 289
    Width = 174
    Height = 19
    Caption = 'Package Destination:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblStaffAssigned: TLabel
    Left = 224
    Top = 323
    Width = 123
    Height = 19
    Caption = 'Staff Assigned:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblOrderPlaced: TLabel
    Left = 206
    Top = 378
    Width = 83
    Height = 16
    Caption = 'Order Placed'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblPackageShipped: TLabel
    Left = 326
    Top = 378
    Width = 109
    Height = 16
    Caption = 'Package Shipped'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblPackageOnRoute: TLabel
    Left = 465
    Top = 378
    Width = 120
    Height = 16
    Caption = 'Package On-Route'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblPackageDelivered: TLabel
    Left = 603
    Top = 378
    Width = 119
    Height = 16
    Caption = 'Package Delivered'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblOrderCanceled: TLabel
    Left = 79
    Top = 378
    Width = 99
    Height = 16
    Caption = 'Order Canceled'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
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
  object PGLoading: TProgressBar
    Left = 127
    Top = 400
    Width = 551
    Height = 25
    TabOrder = 3
  end
  object EdtCustomerCode: TEdit
    Left = 353
    Top = 111
    Width = 155
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    Text = 'EdtCustomerCode'
  end
  object EdtFrom: TEdit
    Left = 353
    Top = 141
    Width = 155
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    Text = 'EdtFrom'
  end
  object EdtTo: TEdit
    Left = 353
    Top = 171
    Width = 155
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    Text = 'EdtTo'
  end
  object EdtDeliveryType: TEdit
    Left = 353
    Top = 224
    Width = 155
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    Text = 'EdtDeliveryType'
  end
  object EdtPickUp: TEdit
    Left = 353
    Top = 254
    Width = 155
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    Text = 'EdtPickUp'
  end
  object EdtDestination: TEdit
    Left = 353
    Top = 287
    Width = 155
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    Text = 'EdtDestination'
  end
  object EdtStaffID: TEdit
    Left = 353
    Top = 320
    Width = 155
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    Text = 'EdtStaffID'
  end
  object RbtnFragile: TRadioButton
    Left = 292
    Top = 204
    Width = 174
    Height = 20
    Caption = 'Fragile Package'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
  end
  object BtnCancel: TButton
    Left = 551
    Top = 175
    Width = 241
    Height = 37
    Caption = 'CANCEL ORDER'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
    OnClick = BtnCancelClick
  end
  object BtnConfirmDelivery: TButton
    Left = 551
    Top = 218
    Width = 241
    Height = 37
    Caption = 'CONFIRM COLLECTION'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 13
    OnClick = BtnConfirmDeliveryClick
  end
  object TTime: TTimer
    OnTimer = TTimeTimer
    Left = 136
    Top = 8
  end
  object TTimeLoad: TTimer
    Left = 8
    Top = 72
  end
end
