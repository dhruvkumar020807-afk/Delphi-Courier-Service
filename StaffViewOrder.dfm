object FrmStaffViewOrder: TFrmStaffViewOrder
  Left = 0
  Top = 0
  Caption = 'FrmStaffViewOrder'
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
  object ImgViewOrder: TImage
    Left = 8
    Top = 160
    Width = 105
    Height = 105
  end
  object LblTime: TLabel
    Left = 8
    Top = 17
    Width = 47
    Height = 16
    Caption = 'LblTime'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblViewOrder: TLabel
    Left = 240
    Top = 8
    Width = 317
    Height = 45
    Caption = 'VIEW MY ORDER'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblMyID: TLabel
    Left = 323
    Top = 72
    Width = 53
    Height = 19
    Caption = 'My ID:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblCustomerName: TLabel
    Left = 240
    Top = 105
    Width = 136
    Height = 19
    Caption = 'Customer Name:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblDestination: TLabel
    Left = 202
    Top = 235
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
  object LblPickUp: TLabel
    Left = 233
    Top = 202
    Width = 143
    Height = 19
    Caption = 'Pick-Up Location:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblPackageTo: TLabel
    Left = 275
    Top = 170
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
  object LblDeliveryType: TLabel
    Left = 258
    Top = 268
    Width = 118
    Height = 19
    Caption = 'Delivery Type:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblOrderPlaced: TLabel
    Left = 214
    Top = 381
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
    Left = 334
    Top = 381
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
    Left = 473
    Top = 381
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
    Left = 611
    Top = 381
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
    Left = 87
    Top = 381
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
  object LblCell: TLabel
    Left = 270
    Top = 136
    Width = 106
    Height = 19
    Caption = 'Cell Number:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BtnClose: TButton
    Left = 758
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
    Left = 719
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
  object EdtStaffID: TEdit
    Left = 382
    Top = 69
    Width = 149
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    Text = 'EdtStaffID'
  end
  object EdtDestination: TEdit
    Left = 382
    Top = 232
    Width = 149
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    Text = 'EdtDestination'
  end
  object EdtPickUp: TEdit
    Left = 382
    Top = 199
    Width = 149
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    Text = 'EdtPickUp'
  end
  object EdtType: TEdit
    Left = 382
    Top = 265
    Width = 149
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    Text = 'EdtType'
  end
  object EdtTo: TEdit
    Left = 382
    Top = 166
    Width = 149
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    Text = 'EdtTo'
  end
  object EdtCustomerName: TEdit
    Left = 382
    Top = 102
    Width = 149
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    Text = 'EdtCustomerName'
  end
  object PGLoading: TProgressBar
    Left = 135
    Top = 403
    Width = 551
    Height = 25
    TabOrder = 9
  end
  object BtnLoadLast: TButton
    Left = 89
    Top = 401
    Width = 40
    Height = 25
    Caption = '<'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    OnClick = BtnLoadLastClick
  end
  object BtnLoadNext: TButton
    Left = 692
    Top = 403
    Width = 40
    Height = 25
    Caption = '>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    OnClick = BtnLoadNextClick
  end
  object RbtnFragile: TRadioButton
    Left = 309
    Top = 298
    Width = 150
    Height = 23
    Caption = 'Fragile Package'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
  end
  object EdtCellNumber: TEdit
    Left = 382
    Top = 133
    Width = 149
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 13
    Text = 'EdtCellNumber'
  end
  object BtnUpdateStatus: TButton
    Left = 258
    Top = 343
    Width = 264
    Height = 32
    Caption = 'UPDATE ORDER STATUS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 14
    OnClick = BtnUpdateStatusClick
  end
  object BtnCancelOrder: TButton
    Left = 578
    Top = 155
    Width = 198
    Height = 32
    Caption = 'CANCEL ORDER'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 15
    OnClick = BtnCancelOrderClick
  end
  object BtnMyAccount: TButton
    Left = 578
    Top = 229
    Width = 198
    Height = 31
    Caption = 'MY ACCOUNT'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 16
    OnClick = BtnMyAccountClick
  end
  object BtnUnassign: TButton
    Left = 578
    Top = 193
    Width = 198
    Height = 30
    Caption = 'UNASSIGN ORDER'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 17
    OnClick = BtnUnassignClick
  end
  object BtnDone: TButton
    Left = 258
    Top = 343
    Width = 264
    Height = 32
    Caption = 'DONE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 18
    OnClick = BtnDoneClick
  end
  object TTime: TTimer
    OnTimer = TTimeTimer
    Left = 72
    Top = 8
  end
end
