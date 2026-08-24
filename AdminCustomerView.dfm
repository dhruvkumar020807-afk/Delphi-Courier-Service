object FrmAdminUserView: TFrmAdminUserView
  Left = 0
  Top = 0
  Caption = 'FrmAdminUserView'
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
  object ImgAdminUser: TImage
    Left = 38
    Top = 250
    Width = 96
    Height = 70
  end
  object LblUserView: TLabel
    Left = 213
    Top = 24
    Width = 402
    Height = 42
    Caption = 'VIEW ALL CUSTOMERS'
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
  object LblName: TLabel
    Left = 192
    Top = 240
    Width = 48
    Height = 18
    Caption = 'Name:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblSurname: TLabel
    Left = 170
    Top = 270
    Width = 71
    Height = 18
    Caption = 'Surname:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblID: TLabel
    Left = 155
    Top = 362
    Width = 86
    Height = 18
    Caption = 'ID Number:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblCellNumber: TLabel
    Left = 144
    Top = 332
    Width = 97
    Height = 18
    Caption = 'Cell Number:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblEmail: TLabel
    Left = 195
    Top = 302
    Width = 46
    Height = 18
    Caption = 'Email:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblPassword: TLabel
    Left = 163
    Top = 398
    Width = 78
    Height = 18
    Caption = 'Password:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblCustomerCode: TLabel
    Left = 124
    Top = 429
    Width = 117
    Height = 18
    Caption = 'Customer Code:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
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
  object DBGUsers: TDBGrid
    Left = 24
    Top = 72
    Width = 633
    Height = 129
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object BtnFirst: TButton
    Left = 32
    Top = 207
    Width = 25
    Height = 25
    Caption = #8656
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = BtnFirstClick
  end
  object BtnBefore: TButton
    Left = 55
    Top = 207
    Width = 25
    Height = 25
    Caption = #8592
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = BtnBeforeClick
  end
  object BtnNext: TButton
    Left = 86
    Top = 207
    Width = 25
    Height = 25
    Caption = #8594
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = BtnNextClick
  end
  object BtnLast: TButton
    Left = 109
    Top = 207
    Width = 25
    Height = 25
    Caption = #8658
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = BtnLastClick
  end
  object BtnSortAlphabetically: TButton
    Left = 663
    Top = 72
    Width = 122
    Height = 25
    Caption = 'SORT NAME A - Z'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = BtnSortAlphabeticallyClick
  end
  object BtnSortOrders: TButton
    Left = 663
    Top = 103
    Width = 122
    Height = 25
    Caption = 'CURRENT ORDERS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = BtnSortOrdersClick
  end
  object CmbSortGender: TComboBox
    Left = 663
    Top = 134
    Width = 122
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    Text = 'GENDER'
    OnChange = CmbSortGenderChange
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
    TabOrder = 10
    OnClick = BtnBackClick
  end
  object EdtName: TEdit
    Left = 247
    Top = 238
    Width = 194
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    Text = 'EdtName'
  end
  object EdtSurname: TEdit
    Left = 246
    Top = 270
    Width = 195
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
    Text = 'EdtSurname'
  end
  object EdtEmail: TEdit
    Left = 247
    Top = 302
    Width = 195
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 13
    Text = 'EdtEmail'
  end
  object EdtCellNumber: TEdit
    Left = 247
    Top = 330
    Width = 195
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 14
    Text = 'EdtCellNumber'
  end
  object EdtID: TEdit
    Left = 247
    Top = 362
    Width = 194
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 15
    Text = 'EdtID'
  end
  object EdtPassword: TEdit
    Left = 247
    Top = 394
    Width = 195
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 16
    Text = 'EdtPassword'
  end
  object EdtCustomerCode: TEdit
    Left = 247
    Top = 426
    Width = 194
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 17
    Text = 'EdtCustomerCode'
  end
  object RgpOrders: TRadioGroup
    Left = 470
    Top = 299
    Width = 131
    Height = 57
    Caption = 'Current Orders'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Items.Strings = (
      'Yes'
      'No')
    ParentFont = False
    TabOrder = 18
  end
  object CmbGenderInfo: TComboBox
    Left = 470
    Top = 267
    Width = 131
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ItemIndex = 1
    ParentFont = False
    TabOrder = 19
    Text = 'Female'
    Items.Strings = (
      'Male'
      'Female'
      'Non-Binary')
  end
  object BtnEdit: TButton
    Left = 663
    Top = 286
    Width = 122
    Height = 34
    Caption = 'EDIT'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 20
    OnClick = BtnEditClick
  end
  object BtnDone: TButton
    Left = 663
    Top = 366
    Width = 122
    Height = 34
    Caption = 'DONE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 21
    OnClick = BtnDoneClick
  end
  object BtnUndo: TButton
    Left = 663
    Top = 406
    Width = 122
    Height = 33
    Caption = 'UNDO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 22
    OnClick = BtnUndoClick
  end
  object btnRefresh: TButton
    Left = 519
    Top = 207
    Width = 122
    Height = 25
    Caption = 'REFRESH'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 23
    OnClick = btnRefreshClick
  end
  object BtnViewOrder: TButton
    Left = 470
    Top = 362
    Width = 131
    Height = 25
    Caption = 'VIEW ORDER'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 24
    OnClick = BtnViewOrderClick
  end
  object CmbSearch: TComboBox
    Left = 663
    Top = 170
    Width = 122
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 25
    Text = 'SEARCH BY:'
    OnChange = CmbSearchChange
  end
  object BtnDelete: TButton
    Left = 662
    Top = 326
    Width = 122
    Height = 34
    Caption = 'DELETE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 26
    OnClick = BtnDeleteClick
  end
  object BtnSortNameDESC: TButton
    Left = 663
    Top = 72
    Width = 122
    Height = 25
    Caption = 'SORT NAME Z - A'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 27
    OnClick = BtnSortNameDESCClick
  end
  object Button1: TButton
    Left = 663
    Top = 200
    Width = 121
    Height = 25
    Caption = 'VIEW STATS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 28
    OnClick = Button1Click
  end
  object TTime: TTimer
    OnTimer = TTimeTimer
    Left = 136
    Top = 8
  end
end
