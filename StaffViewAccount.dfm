object FrmStaffAccount: TFrmStaffAccount
  Left = 0
  Top = 0
  Caption = 'FrmStaffAccount'
  ClientHeight = 460
  ClientWidth = 850
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
  object ImgAccount: TImage
    Left = 654
    Top = 47
    Width = 137
    Height = 80
  end
  object LblName: TLabel
    Left = 293
    Top = 112
    Width = 53
    Height = 19
    Caption = 'Name:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblSurname: TLabel
    Left = 268
    Top = 145
    Width = 78
    Height = 19
    Caption = 'Surname:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblID: TLabel
    Left = 252
    Top = 211
    Width = 94
    Height = 19
    Caption = 'ID Number:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblGender: TLabel
    Left = 282
    Top = 244
    Width = 65
    Height = 19
    Caption = 'Gender:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblEmail: TLabel
    Left = 295
    Top = 277
    Width = 51
    Height = 19
    Caption = 'Email:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblCode: TLabel
    Left = 276
    Top = 178
    Width = 69
    Height = 19
    Caption = 'Staff ID:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblPassword: TLabel
    Left = 262
    Top = 375
    Width = 84
    Height = 19
    Caption = 'Password:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblCellNum: TLabel
    Left = 242
    Top = 310
    Width = 106
    Height = 19
    Caption = 'Cell Number:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
  end
  object LblAccount: TLabel
    Left = 152
    Top = 16
    Width = 473
    Height = 45
    Caption = 'ACCOUNT INFORMATION'
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
  object LblLicense: TLabel
    Left = 235
    Top = 343
    Width = 111
    Height = 19
    Caption = 'License Type:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BtnDone: TButton
    Left = 550
    Top = 256
    Width = 227
    Height = 45
    Caption = 'DONE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = BtnDoneClick
  end
  object BtnUndo: TButton
    Left = 550
    Top = 204
    Width = 227
    Height = 46
    Caption = 'UNDO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = BtnUndoClick
  end
  object BtnEdit: TButton
    Left = 550
    Top = 152
    Width = 227
    Height = 46
    Caption = 'EDIT'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = BtnEditClick
  end
  object EdtName: TEdit
    Left = 352
    Top = 109
    Width = 175
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Text = 'EdtName'
  end
  object EdtSurname: TEdit
    Left = 352
    Top = 142
    Width = 175
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Text = 'EdtSurname'
  end
  object EdtEmail: TEdit
    Left = 352
    Top = 274
    Width = 175
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Text = 'EdtEmail'
  end
  object EdtID: TEdit
    Left = 352
    Top = 208
    Width = 175
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    Text = 'EdtID'
  end
  object EdtCellNumber: TEdit
    Left = 354
    Top = 307
    Width = 175
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    Text = 'EdtCellNumber'
  end
  object EdtPassword: TEdit
    Left = 352
    Top = 372
    Width = 175
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 8
    Text = 'EdtPassword'
  end
  object EdtStaffID: TEdit
    Left = 352
    Top = 175
    Width = 175
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    Text = 'EdtStaffID'
  end
  object CmbGender: TComboBox
    Left = 353
    Top = 241
    Width = 175
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    Text = 'Gender'
    Items.Strings = (
      'Male'
      'Female'
      'Non-Binary')
  end
  object RgbOrders: TRadioButton
    Left = 47
    Top = 144
    Width = 175
    Height = 17
    Caption = 'Current Orders'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
  end
  object BtnHelp: TButton
    Left = 770
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
    TabOrder = 12
    OnClick = BtnHelpClick
  end
  object BtnClose: TButton
    Left = 809
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
    TabOrder = 13
    OnClick = BtnCloseClick
  end
  object BtnBack: TButton
    Left = 8
    Top = 419
    Width = 89
    Height = 33
    Caption = 'Back'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 14
    OnClick = BtnBackClick
  end
  object BtnViewOrder: TButton
    Left = 16
    Top = 214
    Width = 214
    Height = 36
    Caption = 'VIEW ORDER'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 15
    OnClick = BtnViewOrderClick
  end
  object BtnDelete: TButton
    Left = 550
    Top = 307
    Width = 227
    Height = 46
    Caption = 'DELETE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 16
    OnClick = BtnDeleteClick
  end
  object EdtLicense: TEdit
    Left = 356
    Top = 340
    Width = 173
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 17
    Text = 'EdtLicense'
  end
  object PnlOrder: TPanel
    Left = 37
    Top = 167
    Width = 185
    Height = 41
    Caption = 'PnlOrder'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 18
  end
  object ChkShow: TCheckBox
    Left = 352
    Top = 400
    Width = 97
    Height = 14
    Caption = 'Show Password'
    TabOrder = 19
    OnClick = ChkShowClick
  end
  object BtnLogOut: TButton
    Left = 37
    Top = 304
    Width = 172
    Height = 41
    Caption = 'LOG OUT'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 20
    OnClick = BtnLogOutClick
  end
  object TTimeCentre: TTimer
    Interval = 1
    OnTimer = TTimeCentreTimer
    Left = 72
    Top = 72
  end
  object TTime: TTimer
    OnTimer = TTimeTimer
    Left = 24
    Top = 72
  end
end
