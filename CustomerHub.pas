unit CustomerHub;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Help;

type
  TFrmCustomerHub = class(TForm)
    ImgHub: TImage;
    BtnBack: TButton;
    BtnClose: TButton;
    BtnHelp: TButton;
    BtnAccount: TButton;
    BtnPackage: TButton;
    LblHub: TLabel;
    LblTime: TLabel;
    TTime: TTimer;
    BtnPackageStatus: TButton;
    BtnReview: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnBackClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnHelpClick(Sender: TObject);
    procedure BtnAccountClick(Sender: TObject);
    procedure BtnPackageClick(Sender: TObject);
    procedure TTimeTimer(Sender: TObject);
    procedure BtnPackageStatusClick(Sender: TObject);
    procedure BtnReviewClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCustomerHub: TFrmCustomerHub;
  ObjHelp: THelp; // class for the help button

implementation

uses
  CustomerLogin, CustomerAccount, PackageDelivery, CustomerViewOrder,
  CustomerReviews;
{$R *.dfm}

procedure TFrmCustomerHub.BtnBackClick(Sender: TObject);
begin // goes back to customer login
  FrmCustomerHub.Hide;
  FrmCustomerLogin.Show;
end;

procedure TFrmCustomerHub.BtnCloseClick(Sender: TObject);
begin // asks for review and closes the application
  if MessageDlg('Would you like to leave a review?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
  begin
    FrmCustomerReviews.Show;
    FrmCustomerAccount.Hide;
  end
  else
  begin
    Application.Terminate;
  end;
end;

procedure TFrmCustomerHub.BtnHelpClick(Sender: TObject);
begin // shows the help message
  ObjHelp.Hub;
end;

procedure TFrmCustomerHub.BtnPackageClick(Sender: TObject);
begin // takes user to courier order
  FrmCustomerHub.Hide;
  FrmPackageDelivery.Show;
end;

procedure TFrmCustomerHub.BtnPackageStatusClick(Sender: TObject);
begin // takes user to show their own order
  FrmCustomerHub.Hide;
  FrmCustomerViewOrder.Show;
end;

procedure TFrmCustomerHub.BtnReviewClick(Sender: TObject);
begin // takes user to leave a review
  FrmCustomerHub.Hide;
  FrmCustomerReviews.Show;
end;

procedure TFrmCustomerHub.BtnAccountClick(Sender: TObject);
begin // takes user to show their own account info
  FrmCustomerHub.Hide;
  FrmCustomerAccount.Show;
end;

procedure TFrmCustomerHub.FormCreate(Sender: TObject);
begin // initialising the form
  FrmCustomerHub.BorderStyle := bsnone;
  FrmCustomerHub.BorderIcons := [];
  FrmCustomerHub.Position := poScreenCenter;
  ImgHub.Stretch := true;
  ImgHub.Picture.LoadFromFile('BACKGROUNDS\HUB.jpg');
  ImgHub.Align := Alclient;
  LblHub.Font.Color := clWhite;
  LblTime.Font.Color := clWhite;
  TTime.Interval := 1000;
  TTime.Enabled := true;
end;

procedure TFrmCustomerHub.TTimeTimer(Sender: TObject);
begin // shows current time
  LblTime.Caption := FormatDateTime('hh:nn:ss', Now);
end;

end.
