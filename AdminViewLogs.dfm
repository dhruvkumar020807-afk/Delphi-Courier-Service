object FrmAdminViewLogs: TFrmAdminViewLogs
  Left = 0
  Top = 0
  Caption = 'FrmAdminViewLogs'
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
  object ImgViewLogs: TImage
    Left = 8
    Top = 39
    Width = 105
    Height = 105
  end
  object LblViewLogs: TLabel
    Left = 261
    Top = 8
    Width = 278
    Height = 42
    Caption = 'VIEW ALL LOGS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
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
  object PGCLogs: TPageControl
    Left = 400
    Top = 72
    Width = 353
    Height = 369
    ActivePage = TSFirst
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnChange = PGCLogsChange
    object TSFirst: TTabSheet
      Caption = 'SELECT LOGS TO VIEW'
      object RedSelectLogs: TRichEdit
        Left = 16
        Top = 16
        Width = 313
        Height = 305
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Lines.Strings = (
          'RedSelectLogs')
        ParentFont = False
        TabOrder = 0
      end
    end
    object TSCustomerLogs: TTabSheet
      Caption = 'CUSTOMER LOGS'
      ImageIndex = 1
      object RedCustomerLogs: TRichEdit
        Left = 16
        Top = 16
        Width = 313
        Height = 265
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Lines.Strings = (
          'RedCustomerLogs')
        ParentFont = False
        TabOrder = 0
      end
      object BtnCustomerEdit: TButton
        Left = 114
        Top = 302
        Width = 117
        Height = 33
        Caption = 'EDIT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = BtnCustomerEditClick
      end
      object BtnCustomerDone: TButton
        Left = 3
        Top = 302
        Width = 105
        Height = 33
        Caption = 'DONE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = BtnCustomerDoneClick
      end
      object BtnCustomerUndo: TButton
        Left = 237
        Top = 301
        Width = 105
        Height = 34
        Caption = 'UNDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
    end
    object TSStaffLogs: TTabSheet
      Caption = 'STAFF LOGS'
      ImageIndex = 2
      object RedStaffLogs: TRichEdit
        Left = 16
        Top = 16
        Width = 313
        Height = 265
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Lines.Strings = (
          'RedStaffLogs')
        ParentFont = False
        TabOrder = 0
      end
      object BtnStaffDone: TButton
        Left = -1
        Top = 287
        Width = 106
        Height = 34
        Caption = 'DONE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = BtnStaffDoneClick
      end
      object BtnStaffEdit: TButton
        Left = 111
        Top = 287
        Width = 114
        Height = 34
        Caption = 'EDIT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = BtnStaffEditClick
      end
      object BtnStaffUndo: TButton
        Left = 231
        Top = 287
        Width = 106
        Height = 34
        Caption = 'UNDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = BtnStaffUndoClick
      end
    end
    object TSAdminLogs: TTabSheet
      Caption = 'ADMIN LOGS'
      ImageIndex = 3
      object RedAdminLogs: TRichEdit
        Left = 16
        Top = 3
        Width = 313
        Height = 265
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Lines.Strings = (
          'RedAdminLogs')
        ParentFont = False
        TabOrder = 0
      end
      object BtnAdminDone: TButton
        Left = 3
        Top = 288
        Width = 107
        Height = 33
        Caption = 'DONE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = BtnAdminDoneClick
      end
      object BtnAdminEdit: TButton
        Left = 116
        Top = 288
        Width = 117
        Height = 33
        Caption = 'EDIT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = BtnAdminEditClick
      end
      object BtnAdminUndo: TButton
        Left = 239
        Top = 288
        Width = 103
        Height = 33
        Caption = 'UNDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = BtnAdminUndoClick
      end
    end
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
    TabOrder = 3
    OnClick = BtnBackClick
  end
  object BtnViewCustomerLogs: TButton
    Left = 104
    Top = 136
    Width = 233
    Height = 33
    Caption = 'VIEW CUSTOMER LOGS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = BtnViewCustomerLogsClick
  end
  object BtnViewStaffLogs: TButton
    Left = 104
    Top = 175
    Width = 233
    Height = 33
    Caption = 'VIEW STAFF LOGS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = BtnViewStaffLogsClick
  end
  object BtnViewAdminLogs: TButton
    Left = 104
    Top = 214
    Width = 233
    Height = 33
    Caption = 'VIEW ADMIN LOGS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = BtnViewAdminLogsClick
  end
  object BtnViewStaff: TButton
    Left = 104
    Top = 285
    Width = 233
    Height = 33
    Caption = 'VIEW ALL STAFF'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = BtnViewStaffClick
  end
  object BtnViewCustomers: TButton
    Left = 104
    Top = 324
    Width = 233
    Height = 33
    Caption = 'VIEW ALL CUSTOMERS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = BtnViewCustomersClick
  end
  object TTime: TTimer
    OnTimer = TTimeTimer
    Left = 136
    Top = 8
  end
end
