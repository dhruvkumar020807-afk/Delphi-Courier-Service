unit UserType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, AdminLogin, StaffLogin, CustomerLogin,
  Help;

type
  TFrmUserType = class(TForm)
    ImgUserType: TImage;
    LblUserType: TLabel;
    BtnClose: TButton;
    BtnHelp: TButton;
    BtnAdmin: TButton;
    BtnBack: TButton;
    BtnCustomer: TButton;
    BtnStaff: TButton;
    TTime: TTimer;
    LblTime: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnBackClick(Sender: TObject);
    procedure BtnAdminClick(Sender: TObject);
    procedure BtnCustomerClick(Sender: TObject);
    procedure BtnStaffClick(Sender: TObject);
    procedure TTimeTimer(Sender: TObject);
    procedure BtnHelpClick(Sender: TObject);
  end;

var
  FrmUserType: TFrmUserType;
  ObjHelp: THelp; // Class for help button

implementation

uses
  Welcome;
{$R *.dfm}

// Open Admin login
procedure TFrmUserType.BtnAdminClick(Sender: TObject);
begin
  FrmUserType.Hide;
  FrmAdminLogin.Show;
end;

// Go back to Welcome form
procedure TFrmUserType.BtnBackClick(Sender: TObject);
begin
  FrmUserType.Hide;
  FrmWelcome.Show;
end;

// Exit application
procedure TFrmUserType.BtnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

// Open Customer login
procedure TFrmUserType.BtnCustomerClick(Sender: TObject);
begin
  FrmUserType.Hide;
  FrmCustomerLogin.Show;
end;

// Open Help
procedure TFrmUserType.BtnHelpClick(Sender: TObject);
begin
  ObjHelp.UserType;
end;

// Open Staff login
procedure TFrmUserType.BtnStaffClick(Sender: TObject);
begin
  FrmUserType.Hide;
  FrmStaffLogin.Show;
end;

// Initialize form
procedure TFrmUserType.FormCreate(Sender: TObject);
begin
  FrmUserType.BorderStyle := bsnone;
  FrmUserType.BorderIcons := [];
  FrmUserType.Position := poScreenCenter;
  ImgUserType.Stretch := true;
  ImgUserType.Picture.LoadFromFile('BACKGROUNDS\USER TYPE.jpg');
  ImgUserType.Align := Alclient;
  LblUserType.Font.Color := clWhite;
  LblTime.Font.Color := clWhite;
  TTime.Interval := 1000;
  TTime.Enabled := true;
end;

// Update time every second
procedure TFrmUserType.TTimeTimer(Sender: TObject);
begin
  LblTime.Caption := FormatDateTime('hh:nn:ss', Now);
end;

end.
