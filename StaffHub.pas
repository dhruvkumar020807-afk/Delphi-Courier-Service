unit StaffHub;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, StaffViewOrder, Help;

type
  TFrmStaffHub = class(TForm)
    ImgStaffHub: TImage;
    BtnClose: TButton;
    BtnHelp: TButton;
    BtnBack: TButton;
    LblStaffHub: TLabel;
    LblTime: TLabel;
    TTime: TTimer;
    BtnAccount: TButton;
    BtnViewOrders: TButton;
    BtnCustomerHub: TButton;
    BtnViewMyOrder: TButton;
    BtnViewAccount: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnBackClick(Sender: TObject);
    procedure TTimeTimer(Sender: TObject);
    procedure BtnAccountClick(Sender: TObject);
    procedure BtnCustomerHubClick(Sender: TObject);
    procedure BtnViewMyOrderClick(Sender: TObject);
    procedure BtnViewOrdersClick(Sender: TObject);
    procedure BtnHelpClick(Sender: TObject);
    procedure BtnViewAccountClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmStaffHub: TFrmStaffHub;
  ObjHelp: THelp; // class for help button

implementation

uses
  Usertype, AdminCustomerView, CustomerHub, AdminViewOrder, AdminAllOrdersView,
  StaffViewAccount, StaffLogin;
{$R *.dfm}

procedure TFrmStaffHub.BtnAccountClick(Sender: TObject);
begin // show all customers
  FrmStaffHub.Hide;
  FrmAdminUserView.Show;
end;

procedure TFrmStaffHub.BtnBackClick(Sender: TObject);
begin // back to staff login
  FrmStaffHub.Hide;
  FrmStaffLogin.Show;
end;

procedure TFrmStaffHub.BtnCloseClick(Sender: TObject);
begin // closes the application
  Application.Terminate;
end;

procedure TFrmStaffHub.BtnCustomerHubClick(Sender: TObject);
begin // logs you in as customer
  if MessageDlg(
    'Are you sure, you will be logging in as a customer and will need to log back in to your account after.', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    FrmStaffHub.Hide;
    FrmCustomerHub.Show;
  end
  else
  begin
    exit;
  end;
end;

procedure TFrmStaffHub.BtnHelpClick(Sender: TObject);
begin // shows message for help button
  ObjHelp.hub;
end;

procedure TFrmStaffHub.BtnViewAccountClick(Sender: TObject);
begin // takes user to view their own account
  FrmStaffHub.Hide;
  FrmStaffAccount.Show;
end;

procedure TFrmStaffHub.BtnViewMyOrderClick(Sender: TObject);
begin // shows user their order
  FrmStaffHub.Hide;
  FrmStaffViewOrder.Show;
end;

procedure TFrmStaffHub.BtnViewOrdersClick(Sender: TObject);
begin // shows user all orders
  FrmStaffHub.Hide;
  FrmAllOrdersView.Show;
end;

procedure TFrmStaffHub.FormCreate(Sender: TObject);
begin // initialises the form
  FrmStaffHub.BorderStyle := bsnone;
  FrmStaffHub.BorderIcons := [];
  FrmStaffHub.Position := poScreenCenter;
  ImgStaffHub.Stretch := true;
  ImgStaffHub.Picture.LoadFromFile('BACKGROUNDS\LOGIN.jpg');
  LblStaffHub.Font.Color := clWhite;
  ImgStaffHub.Align := Alclient;
  LblTime.Font.Color := clWhite;
  TTime.Interval := 1000;
  TTime.Enabled := true;

end;

procedure TFrmStaffHub.TTimeTimer(Sender: TObject);
begin // shows current time
  LblTime.Caption := FormatDateTime('hh:nn:ss', Now);
end;

end.
