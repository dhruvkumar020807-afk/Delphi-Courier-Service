object FrmCustomerLogin: TFrmCustomerLogin
  Left = 0
  Top = 0
  Caption = 'FrmCustomerLogin'
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
  object ImgLogin: TImage
    Left = 616
    Top = 322
    Width = 176
    Height = 140
  end
  object LblCustomer: TLabel
    Left = 240
    Top = 16
    Width = 344
    Height = 45
    Caption = 'CUSTOMER LOGIN'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblEmail: TLabel
    Left = 312
    Top = 149
    Width = 50
    Height = 18
    Caption = 'Email: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblPass: TLabel
    Left = 280
    Top = 186
    Width = 82
    Height = 18
    Caption = 'Password: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblInfo: TLabel
    Left = 293
    Top = 280
    Width = 133
    Height = 13
    Caption = 'Don'#39't have an Account?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblSignUp: TLabel
    Left = 432
    Top = 280
    Width = 59
    Height = 13
    Caption = 'Click Here.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clAqua
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = LblSignUpClick
  end
  object lblshow: TLabel
    Left = 383
    Top = 212
    Width = 87
    Height = 13
    Caption = 'Show Password'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblForgot: TLabel
    Left = 520
    Top = 190
    Width = 3
    Height = 13
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
  object EdtEmail: TEdit
    AlignWithMargins = True
    Left = 368
    Top = 150
    Width = 133
    Height = 21
    TabOrder = 3
    Text = 'DK'
  end
  object EdtPass: TEdit
    Left = 368
    Top = 185
    Width = 133
    Height = 21
    PasswordChar = '*'
    TabOrder = 4
    Text = 'DK'
    OnChange = EdtPassChange
  end
  object BtnLogin: TButton
    Left = 282
    Top = 233
    Width = 241
    Height = 41
    Caption = 'Login'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = BtnLoginClick
  end
  object BtnForgot: TButton
    Left = 328
    Top = 299
    Width = 121
    Height = 25
    Caption = 'Forgot Details'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = BtnForgotClick
  end
  object chkshow: TCheckBox
    Left = 368
    Top = 210
    Width = 15
    Height = 17
    TabOrder = 7
    OnClick = chkshowClick
  end
  object TimerForgot: TTimer
    OnTimer = TimerForgotTimer
    Left = 760
    Top = 432
  end
  object TTime: TTimer
    OnTimer = Timer1Timer
    Left = 96
  end
end
