unit Welcome;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls, UserType, Help, ComCtrls;

type
  TFrmWelcome = class(TForm)
    ImgWelcome: TImage;
    LblWelcome: TLabel;
    PnlQuote: TPanel;
    BnContinue: TButton;
    BtnClose: TButton;
    BtnHelp: TButton;
    TTime: TTimer;
    LblTime: TLabel;
    LblColour: TLabel;
    TColour1: TTimer;
    TColour2: TTimer;
    BtnAboutUs: TButton;
    RedAboutUs: TRichEdit;
    BtnCloseAboutUs: TButton;
    TRedScroll: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BnContinueClick(Sender: TObject);
    procedure TTimeTimer(Sender: TObject);
    procedure TColour1Timer(Sender: TObject);
    procedure TColour2Timer(Sender: TObject);
    procedure BtnHelpClick(Sender: TObject);
    procedure BtnCloseAboutUsClick(Sender: TObject);
    procedure BtnAboutUsClick(Sender: TObject);
    procedure TRedScrollTimer(Sender: TObject);
  end;

var
  FrmWelcome: TFrmWelcome;
  ObjHelp: THelp; // Class for help button
  ArrQuotes: array [0 .. 9] of string = ( // Array for random quotes
    'Delivering trust, speed, and reliability.',
    'From our hands to yours, with care and precision.',
    'Fast. Reliable. Delivered. Every time.',
    'Connecting people, one package at a time.',
    'Because every delivery matters.',
    'Speed you need, service you trust.',
    'Your package, our priority.',
    'Shipping made simple, deliveries made special.',
    'From doorstep to destination—seamless and secure.',
    'We don’t just deliver packages, we deliver peace of mind.'
  );

implementation

uses
  CustomerHub;
{$R *.dfm}

// Show About Us section
procedure TFrmWelcome.BtnAboutUsClick(Sender: TObject);
begin
  BtnCloseAboutUs.Show;
  RedAboutUs.Show;
  RedAboutUs.Lines.Clear;
  TRedScroll.Interval := 1000;
  TRedScroll.Enabled := true;
  RedAboutUs.Lines.LoadFromFile('ABOUT US.txt');
end;

// Hide About Us section
procedure TFrmWelcome.BtnCloseAboutUsClick(Sender: TObject);
begin
  BtnCloseAboutUs.Hide;
  RedAboutUs.Hide;
end;

// Exit application
procedure TFrmWelcome.BtnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

// Open Help
procedure TFrmWelcome.BtnHelpClick(Sender: TObject);
begin
  ObjHelp.Welcome;
end;

// Go to next form
procedure TFrmWelcome.BnContinueClick(Sender: TObject);
begin
  FrmWelcome.Hide;
  FrmUserType.Show;
end;

// Initialize form
procedure TFrmWelcome.FormCreate(Sender: TObject);
var
  RandomIndex: integer;
begin
  FrmWelcome.BorderStyle := bsnone;
  FrmWelcome.BorderIcons := [];
  FrmWelcome.Position := poScreenCenter;
  ImgWelcome.Stretch := true;
  ImgWelcome.Picture.LoadFromFile('BACKGROUNDS\WELCOME.jpg');
  ImgWelcome.Align := Alclient;
  PnlQuote.Font.Size := 20;
  PnlQuote.Font.Color := clWhite;
  LblWelcome.Font.Color := clWhite;
  Randomize;
  RandomIndex := Random(Length(ArrQuotes));
  PnlQuote.Caption := ArrQuotes[RandomIndex];
  LblTime.Font.Color := clWhite;
  TTime.Interval := 1000;
  TTime.Enabled := true;
  TColour1.Interval := 1000;
  TColour2.Interval := 1000;
  TColour1.Enabled := true;
  TColour2.Enabled := false;
  BtnCloseAboutUs.Hide;
  RedAboutUs.Hide;
end;

// Switch colors (step 1)
procedure TFrmWelcome.TColour1Timer(Sender: TObject);
begin
  LblWelcome.Font.Color := clBlack;
  LblColour.Font.Color := clWhite;
  TColour1.Enabled := false;
  TColour2.Enabled := true;
end;

// Switch colors (step 2)
procedure TFrmWelcome.TColour2Timer(Sender: TObject);
begin
  LblWelcome.Font.Color := clWhite;
  LblColour.Font.Color := clBlack;
  TColour1.Enabled := true;
  TColour2.Enabled := false;
end;

// Auto-scroll About Us
procedure TFrmWelcome.TRedScrollTimer(Sender: TObject);
begin
  RedAboutUs.Perform(EM_LINESCROLL, 0, 1);
end;

// Update time every second
procedure TFrmWelcome.TTimeTimer(Sender: TObject);
begin
  LblTime.Caption := FormatDateTime('hh:nn:ss', Now);
end;

end.
