object FrmAllOrdersView: TFrmAllOrdersView
  Left = 0
  Top = 0
  Caption = 'FrmAllOrdersView'
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
  PixelsPerInch = 96
  TextHeight = 13
  object ImgViewOrder: TImage
    Left = 7
    Top = 241
    Width = 81
    Height = 81
  end
  object LblPackageFrom: TLabel
    Left = 136
    Top = 276
    Width = 94
    Height = 16
    Caption = 'Package From:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblPackageTo: TLabel
    Left = 151
    Top = 246
    Width = 78
    Height = 16
    Caption = 'Package To:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblPickUp: TLabel
    Left = 118
    Top = 306
    Width = 111
    Height = 16
    Caption = 'Pick-Up Location:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblDropOff: TLabel
    Left = 110
    Top = 333
    Width = 120
    Height = 16
    Caption = 'Drop-Off Location:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblDeliveryType: TLabel
    Left = 379
    Top = 245
    Width = 93
    Height = 16
    Caption = 'Delivery Type:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblStaff: TLabel
    Left = 372
    Top = 275
    Width = 100
    Height = 16
    Caption = 'Staff Assigned:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
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
  object LblCustomer: TLabel
    Left = 368
    Top = 306
    Width = 103
    Height = 16
    Caption = 'Customer Code:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblViewOrder: TLabel
    Left = 184
    Top = 8
    Width = 452
    Height = 58
    Caption = 'VIEW ALL ORDERS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -48
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
  object DBGOrders: TDBGrid
    Left = 40
    Top = 70
    Width = 578
    Height = 134
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object BtnFirst2: TButton
    Left = 40
    Top = 210
    Width = 25
    Height = 25
    Caption = #8656
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = BtnFirst2Click
  end
  object BtnBefore2: TButton
    Left = 63
    Top = 210
    Width = 25
    Height = 25
    Caption = #8592
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = BtnBefore2Click
  end
  object BtnNext2: TButton
    Left = 94
    Top = 210
    Width = 25
    Height = 25
    Caption = #8594
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = BtnNext2Click
  end
  object BtnLast2: TButton
    Left = 125
    Top = 210
    Width = 25
    Height = 25
    Caption = #8658
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = BtnLast2Click
  end
  object EdtPackageTo: TEdit
    Left = 235
    Top = 243
    Width = 121
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    Text = 'EdtPackageTo'
  end
  object EdtPackageFrom: TEdit
    Left = 236
    Top = 273
    Width = 121
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    Text = 'EdtPackageFrom'
  end
  object EdtPickUp: TEdit
    Left = 235
    Top = 303
    Width = 121
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    Text = 'EdtPickUp'
  end
  object EdtDropOff: TEdit
    Left = 236
    Top = 333
    Width = 121
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    Text = 'EdtDropOff'
  end
  object EdtStaff: TEdit
    Left = 478
    Top = 272
    Width = 121
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
    Text = 'EdtStaff'
  end
  object PGLoading: TProgressBar
    Left = 127
    Top = 400
    Width = 551
    Height = 25
    TabOrder = 13
  end
  object CmbDeliveryType: TComboBox
    Left = 478
    Top = 242
    Width = 121
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 14
    Text = 'CmbDeliveryType'
  end
  object BtnDelete: TButton
    Left = 624
    Top = 330
    Width = 168
    Height = 26
    Caption = 'DELETE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 15
    OnClick = BtnDeleteClick
  end
  object BtnDone: TButton
    Left = 624
    Top = 302
    Width = 168
    Height = 27
    Caption = 'DONE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 16
    OnClick = BtnDoneClick
  end
  object BtnEdit: TButton
    Left = 624
    Top = 271
    Width = 168
    Height = 27
    Caption = 'EDIT'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 17
    OnClick = BtnEditClick
  end
  object RbtnFragile: TRadioButton
    Left = 411
    Top = 334
    Width = 122
    Height = 17
    Caption = 'Fragile Package'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 18
  end
  object CmbType: TComboBox
    Left = 624
    Top = 72
    Width = 168
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 19
    Text = 'TYPE OF DELIVERY'
    OnChange = CmbTypeChange
  end
  object CmbDeliveryStatus: TComboBox
    Left = 624
    Top = 102
    Width = 168
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 20
    Text = 'DELIVERY STATUS'
    OnChange = CmbDeliveryStatusChange
  end
  object BtnRefresh: TButton
    Left = 624
    Top = 192
    Width = 168
    Height = 27
    Caption = 'REFRESH'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 21
    OnClick = BtnRefreshClick
  end
  object CmbSearch: TComboBox
    Left = 624
    Top = 162
    Width = 168
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 22
    Text = 'SEARCH'
    OnChange = CmbSearchChange
  end
  object BtnFragile: TButton
    Left = 624
    Top = 132
    Width = 168
    Height = 24
    Caption = 'FRAGILE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 23
    OnClick = BtnFragileClick
  end
  object BtnNotFragile: TButton
    Left = 624
    Top = 131
    Width = 168
    Height = 25
    Caption = 'NOT FRAGILE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 24
    OnClick = BtnNotFragileClick
  end
  object EdtCustomerCode: TEdit
    Left = 477
    Top = 303
    Width = 121
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 25
    Text = 'EdtCustomerCode'
  end
  object BtnLoadLast: TButton
    Left = 81
    Top = 398
    Width = 40
    Height = 25
    Caption = '<'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 26
    OnClick = BtnLoadLastClick
  end
  object BtnLoadNext: TButton
    Left = 684
    Top = 400
    Width = 40
    Height = 25
    Caption = '>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 27
    OnClick = BtnLoadNextClick
  end
  object TTime: TTimer
    OnTimer = TTimeTimer
    Left = 16
    Top = 32
  end
end
