object FrmWelcome: TFrmWelcome
  Left = 0
  Top = 0
  Caption = 'FrmWelcome'
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
  object ImgWelcome: TImage
    Left = 664
    Top = 296
    Width = 120
    Height = 103
  end
  object LblWelcome: TLabel
    Left = 272
    Top = 40
    Width = 249
    Height = 42
    Caption = 'WELCOME TO '
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
  object LblColour: TLabel
    Left = 70
    Top = 80
    Width = 683
    Height = 116
    Caption = 'DKS COURIER'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -96
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object PnlQuote: TPanel
    Left = 8
    Top = 418
    Width = 784
    Height = 41
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object BnContinue: TButton
    Left = 272
    Top = 376
    Width = 281
    Height = 36
    Caption = 'CONTINUE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = BnContinueClick
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
    TabOrder = 2
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
    TabOrder = 3
    OnClick = BtnHelpClick
  end
  object BtnAboutUs: TButton
    Left = 344
    Top = 344
    Width = 121
    Height = 26
    Caption = 'ABOUT US'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = BtnAboutUsClick
  end
  object RedAboutUs: TRichEdit
    Left = 192
    Top = 8
    Width = 409
    Height = 454
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Lines.Strings = (
      'RedAboutUs')
    ParentFont = False
    TabOrder = 5
  end
  object BtnCloseAboutUs: TButton
    Left = 576
    Top = 14
    Width = 25
    Height = 25
    Caption = 'X'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = BtnCloseAboutUsClick
  end
  object TTime: TTimer
    OnTimer = TTimeTimer
    Left = 136
    Top = 8
  end
  object TColour1: TTimer
    OnTimer = TColour1Timer
    Left = 16
    Top = 224
  end
  object TColour2: TTimer
    OnTimer = TColour2Timer
    Left = 88
    Top = 224
  end
  object TRedScroll: TTimer
    OnTimer = TRedScrollTimer
    Left = 16
    Top = 312
  end
end
