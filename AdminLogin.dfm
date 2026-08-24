object FrmAdminLogin: TFrmAdminLogin
  Left = 0
  Top = 0
  Caption = 'FrmAdminLogin'
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
  object ImgAdminLogin: TImage
    Left = 290
    Top = 346
    Width = 241
    Height = 116
  end
  object LblAdmin: TLabel
    Left = 273
    Top = 24
    Width = 268
    Height = 45
    Caption = 'ADMIN LOGIN'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblEmail: TLabel
    Left = 297
    Top = 165
    Width = 73
    Height = 18
    Caption = 'Admin ID:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblPass: TLabel
    Left = 288
    Top = 202
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
  object lblshow: TLabel
    Left = 397
    Top = 230
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
    Left = 528
    Top = 206
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
    Top = 417
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
  object EdtID: TEdit
    AlignWithMargins = True
    Left = 376
    Top = 166
    Width = 133
    Height = 21
    TabOrder = 3
    Text = '1234'
  end
  object EdtPass: TEdit
    Left = 376
    Top = 203
    Width = 133
    Height = 21
    PasswordChar = '*'
    TabOrder = 4
    Text = 'DK'
  end
  object BtnLogin: TButton
    Left = 290
    Top = 249
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
    Left = 336
    Top = 315
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
    Left = 376
    Top = 226
    Width = 15
    Height = 17
    TabOrder = 7
    OnClick = chkshowClick
  end
  object TimerForgot: TTimer
    OnTimer = TimerForgotTimer
    Left = 752
    Top = 416
  end
  object TTime: TTimer
    OnTimer = TTimeTimer
    Left = 136
    Top = 8
  end
end
