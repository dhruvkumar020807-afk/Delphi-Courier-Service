unit AdminHub;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Help, AdminCustomerView;

type
  TFrmAdminHub = class(TForm)
    ImgAdminHub: TImage;
    LblAdminHub: TLabel;
    BtnClose: TButton;
    BtnHelp: TButton;
    LblTime: TLabel;
    BtnViewCustomers: TButton;
    BtnBack: TButton;
    BtnViewLogs: TButton;
    BtnStaffView: TButton;
    BtnAdminViewReviews: TButton;
    BtnManageOrders: TButton;
    TTime: TTimer;
    BtnCustomerHub: TButton;
    Button4: TButton;
    BtnStaffHub: TButton;
    BtnViewAllOrders: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnHelpClick(Sender: TObject);
    procedure TTimeTimer(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnViewCustomersClick(Sender: TObject);
    procedure BtnBackClick(Sender: TObject);
    procedure BtnViewLogsClick(Sender: TObject);
    procedure BtnStaffViewClick(Sender: TObject);
    procedure BtnAdminViewReviewsClick(Sender: TObject);
    procedure BtnManageOrdersClick(Sender: TObject);
    procedure BtnStaffHubClick(Sender: TObject);
    procedure BtnCustomerHubClick(Sender: TObject);
    procedure BtnViewAllOrdersClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAdminHub: TFrmAdminHub;
  ObjHelp: THelp; // class for help button

implementation

uses
  UserType, AdminViewOrder, AdminViewLogs, AdminStaffView, AdminViewReviews,
  StaffHub, CustomerHub, AdminAllOrdersView, AdminLogin, AdminViewAccount;
{$R *.dfm}

procedure TFrmAdminHub.BtnAdminViewReviewsClick(Sender: TObject);
begin // allows user to view all reviews
  FrmAdminHub.Hide;
  FrmAdminViewReviews.Show;
end;

procedure TFrmAdminHub.BtnBackClick(Sender: TObject);
begin // goes back to admin login
  FrmAdminHub.Hide;
  FrmAdminLogin.Show;
end;

procedure TFrmAdminHub.BtnCloseClick(Sender: TObject);
begin // closes the application
  Application.Terminate;
end;

procedure TFrmAdminHub.BtnCustomerHubClick(Sender: TObject);
begin // logs in as customer
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

procedure TFrmAdminHub.BtnHelpClick(Sender: TObject);
begin // shows message for help button
  ObjHelp.Hub;
end;

procedure TFrmAdminHub.BtnStaffHubClick(Sender: TObject);
begin // logs in as staff
  if MessageDlg(
    'Are you sure, you will be logging in as a staff member and will need to log back in to your account after.', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    FrmStaffHub.Show;
    FrmAdminHub.Hide;
  end
  else
  begin
    exit;
  end;

end;

procedure TFrmAdminHub.BtnStaffViewClick(Sender: TObject);
begin // shows all staff
  FrmAdminHub.Hide;
  FrmAdminStaffView.Show;
end;

procedure TFrmAdminHub.BtnViewAllOrdersClick(Sender: TObject);
begin // shows all orders
  FrmAdminHub.Hide;
  FrmAllOrdersView.Show;
end;

procedure TFrmAdminHub.BtnViewCustomersClick(Sender: TObject);
begin // shows all the users
  FrmAdminUserView.Show;
  FrmAdminHub.Hide;
end;

procedure TFrmAdminHub.BtnViewLogsClick(Sender: TObject);
begin // shows all user logs
  FrmAdminHub.Hide;
  FrmAdminViewLogs.Show;
end;

procedure TFrmAdminHub.Button4Click(Sender: TObject);
begin // shows the admins account
  FrmAdminHub.Hide;
  FrmAdminAccount.Show;
end;

procedure TFrmAdminHub.BtnManageOrdersClick(Sender: TObject);
begin // shows orders
  FrmAdminHub.Hide;
  FrmAdminViewOrder.Show;
end;

procedure TFrmAdminHub.FormCreate(Sender: TObject);
begin // initialises the form
  FrmAdminHub.BorderStyle := bsnone;
  FrmAdminHub.BorderIcons := [];
  FrmAdminHub.Position := poScreenCenter;
  ImgAdminHub.Picture.LoadFromFile('BACKGROUNDS\HUB.jpg');
  ImgAdminHub.Stretch := true;
  ImgAdminHub.Align := Alclient;
  LblAdminHub.Font.Color := clWhite;
  LblTime.Font.Color := clWhite;
  TTime.Enabled := true;
end;

procedure TFrmAdminHub.TTimeTimer(Sender: TObject);
begin // shows current time
  LblTime.Caption := FormatDateTime('hh:nn:ss', Now);
end;

end.
