object FrmCreateCustomerAccount: TFrmCreateCustomerAccount
  Left = 0
  Top = 0
  Caption = 'FrmCreateCustomerAccount'
  ClientHeight = 450
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -9
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 11
  object ImgCreateAccount: TImage
    Left = 680
    Top = 342
    Width = 98
    Height = 100
  end
  object LblCreate: TLabel
    Left = 256
    Top = 24
    Width = 339
    Height = 45
    Caption = 'CREATE ACCOUNT'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblName: TLabel
    Left = 344
    Top = 104
    Width = 64
    Height = 16
    Caption = 'Full Name:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblID: TLabel
    Left = 336
    Top = 134
    Width = 72
    Height = 16
    Caption = 'ID Number:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblCell: TLabel
    Left = 328
    Top = 164
    Width = 80
    Height = 16
    BiDiMode = bdLeftToRight
    Caption = 'Cell Number:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object LblEmail: TLabel
    Left = 371
    Top = 194
    Width = 37
    Height = 16
    Caption = 'Email:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LbLPassword: TLabel
    Left = 340
    Top = 224
    Width = 68
    Height = 16
    Caption = 'Password:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblConfirm: TLabel
    Left = 287
    Top = 270
    Width = 121
    Height = 16
    Caption = 'Confirm Password:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblCheckName: TLabel
    Left = 552
    Top = 105
    Width = 163
    Height = 14
    Caption = 'Enter a valid and full name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblCheckID: TLabel
    Left = 552
    Top = 135
    Width = 68
    Height = 14
    Caption = 'LblCheckID'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblCheckCell: TLabel
    Left = 552
    Top = 165
    Width = 75
    Height = 14
    Caption = 'LblCheckCell'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblCheckEmail: TLabel
    Left = 552
    Top = 195
    Width = 111
    Height = 14
    Caption = 'Enter a valid email'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblCheckPass: TLabel
    Left = 552
    Top = 225
    Width = 81
    Height = 14
    Caption = 'LblCheckPass'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblCheckConf: TLabel
    Left = 556
    Top = 271
    Width = 83
    Height = 14
    Caption = 'LblCheckConf'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblCheckGender: TLabel
    Left = 552
    Top = 317
    Width = 97
    Height = 14
    Caption = 'LblCheckGender'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblPassRules: TLabel
    Left = 552
    Top = 225
    Width = 78
    Height = 14
    Caption = 'LblPassRules'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
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
  object BtnBack: TButton
    Left = 8
    Top = 409
    Width = 89
    Height = 33
    Caption = 'Back'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = BtnBackClick
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
    TabOrder = 2
    OnClick = BtnHelpClick
  end
  object EdtName: TEdit
    Left = 414
    Top = 101
    Width = 121
    Height = 24
    Color = clHighlightText
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Text = 'EdtName'
  end
  object EdtID: TEdit
    Left = 414
    Top = 131
    Width = 121
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Text = 'EdtID'
  end
  object EdtCell: TEdit
    Left = 414
    Top = 161
    Width = 121
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Text = 'EdtCell'
  end
  object EdtEmail: TEdit
    Left = 414
    Top = 191
    Width = 121
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    Text = 'EdtEmail'
  end
  object EdtConfirm: TEdit
    Left = 414
    Top = 267
    Width = 121
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    Text = 'EdtConfirm'
  end
  object CmbGender: TComboBox
    Left = 312
    Top = 313
    Width = 215
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ItemIndex = 1
    ParentFont = False
    TabOrder = 8
    Text = 'Female'
    Items.Strings = (
      'Male'
      'Female'
      'Non-Binary')
  end
  object BtnGenerate: TButton
    Left = 328
    Top = 343
    Width = 183
    Height = 25
    Caption = 'Generate Customer Code'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnClick = BtnGenerateClick
  end
  object PnlCode: TPanel
    Left = 14
    Top = 342
    Width = 185
    Height = 25
    Caption = 'PnlCode'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
  end
  object BtnCreate: TButton
    Left = 287
    Top = 374
    Width = 247
    Height = 43
    Caption = 'CREATE ACCOUNT'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    OnClick = BtnCreateClick
  end
  object EdtPassword: TEdit
    Left = 414
    Top = 221
    Width = 121
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
    Text = 'EdtPassword'
  end
  object RbtShow1: TRadioButton
    Left = 414
    Top = 244
    Width = 113
    Height = 17
    Caption = 'Show Password'
    TabOrder = 13
    OnClick = RbtShow1Click
  end
  object RbtnShow2: TRadioButton
    Left = 414
    Top = 290
    Width = 113
    Height = 17
    Caption = 'Show Password'
    TabOrder = 14
    OnClick = RbtnShow2Click
  end
  object BtnReset: TButton
    Left = 30
    Top = 213
    Width = 147
    Height = 33
    Caption = 'RESET'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 15
    OnClick = BtnResetClick
  end
  object BtnHint: TButton
    Left = 315
    Top = 223
    Width = 19
    Height = 23
    Caption = '?'
    TabOrder = 16
    OnClick = BtnHintClick
  end
  object TTime: TTimer
    OnTimer = TTimeTimer
    Left = 136
    Top = 8
  end
end
