unit StaffViewOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, DBOrders, ComCtrls, Help,
  StaffOrder, DBUsers;

type
  TFrmStaffViewOrder = class(TForm)
    BtnClose: TButton;
    BtnHelp: TButton;
    TTime: TTimer;
    ImgViewOrder: TImage;
    BtnBack: TButton;
    LblTime: TLabel;
    LblViewOrder: TLabel;
    EdtStaffID: TEdit;
    EdtDestination: TEdit;
    EdtPickUp: TEdit;
    EdtType: TEdit;
    EdtTo: TEdit;
    EdtCustomerName: TEdit;
    LblMyID: TLabel;
    LblCustomerName: TLabel;
    LblDestination: TLabel;
    LblPickUp: TLabel;
    LblPackageTo: TLabel;
    LblDeliveryType: TLabel;
    LblOrderPlaced: TLabel;
    LblPackageShipped: TLabel;
    LblPackageOnRoute: TLabel;
    LblPackageDelivered: TLabel;
    LblOrderCanceled: TLabel;
    PGLoading: TProgressBar;
    BtnLoadLast: TButton;
    BtnLoadNext: TButton;
    RbtnFragile: TRadioButton;
    LblCell: TLabel;
    EdtCellNumber: TEdit;
    BtnUpdateStatus: TButton;
    BtnCancelOrder: TButton;
    BtnMyAccount: TButton;
    BtnUnassign: TButton;
    BtnDone: TButton;
    procedure BtnBackClick(Sender: TObject);
    procedure TTimeTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnCancelOrderClick(Sender: TObject);
    procedure BtnUnassignClick(Sender: TObject);
    procedure BtnUpdateStatusClick(Sender: TObject);
    procedure BtnDoneClick(Sender: TObject);
    procedure BtnLoadLastClick(Sender: TObject);
    procedure BtnLoadNextClick(Sender: TObject);
    procedure BtnHelpClick(Sender: TObject);
    procedure BtnMyAccountClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sExttractedCustomerCode: string;
  end;

var
  FrmStaffViewOrder: TFrmStaffViewOrder;
  StaffID: string;
  objOrder: TOrders; // class to find the order that the staff member is in charge of
  iStatus: integer;
  objHelp: Thelp; // class for the help button

implementation

uses
  StaffHub, StaffLogin, StaffViewAccount;
{$R *.dfm}

procedure TFrmStaffViewOrder.BtnBackClick(Sender: TObject);
begin // to go back to the staff hub
  FrmStaffViewOrder.Hide;
  FrmStaffHub.Show;
end;

procedure TFrmStaffViewOrder.BtnCancelOrderClick(Sender: TObject);
begin // confirming the deletion of the order
  if MessageDlg(
    'Are you sure you want to delete this order? This cannot be undone.',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DMOrders.TblOrders.First;
    while not DMOrders.TblOrders.Eof do
    begin
      if DMOrders.TblOrders['STAFF ID'] = StaffID then
      begin
        DMOrders.TblOrders.Delete;
      end
      else
      begin
        DMOrders.TblOrders.Next;
      end;
    end;

    DMUsers.TblCustomer.First;
    while not DMUsers.TblCustomer.Eof do
    begin
      if DMUsers.TblCustomer['ASSIGNED STAFF'] = StaffID then
      begin
        DMUsers.TblCustomer.Edit;
        DMUsers.TblCustomer['CURRENT ORDERS'] := false;
        DMUsers.TblCustomer['ASSIGNED STAFF'] := '-';
        DMUsers.TblCustomer.Post;
      end
      else
      begin
        DMUsers.TblCustomer.Next;
      end;
    end;

    DMUsers.TblStaff.First;
    while not DMUsers.TblStaff.Eof do
    begin
      if DMUsers.TblStaff['STAFF ID'] = StaffID then
      begin
        DMUsers.TblStaff.Edit;
        DMUsers.TblStaff['AVAILABLE'] := true;
        DMUsers.TblStaff['CURRENT ORDER'] := '-';
        DMUsers.TblStaff.Post;
      end
      else
      begin
        DMUsers.TblStaff.Next;
      end;
    end;
  end
  else
  begin
    showmessage('Order not canceled.');
  end;
end;

procedure TFrmStaffViewOrder.BtnCloseClick(Sender: TObject);
begin // closing the application
  Application.Terminate;
end;

procedure TFrmStaffViewOrder.BtnDoneClick(Sender: TObject);
begin // confirming the change of the status of the order
  if MessageDlg('Are you sure this is the correct status change made?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    while not DMOrders.TblOrders.Eof do
    begin
      if DMOrders.TblOrders['STAFF ID'] = StaffID then
      begin
        BtnLoadLast.Hide;
        BtnLoadNext.Hide;
        BtnDone.Hide;
        DMOrders.TblOrders.Edit;
        DMOrders.TblOrders['DELIVERY STATUS'] := iStatus;
        DMOrders.TblOrders.Post;
        case iStatus of
          0:
            begin
              showmessage('ORDER WAS CANCELED');
              PGLoading.Position := 0;
              LblOrderCanceled.Font.Color := clRed;
            end;

          1:
            begin
              PGLoading.Position := 25;
              LblOrderPlaced.Font.Color := clGreen;
            end;

          2:
            begin
              PGLoading.Position := 50;
              LblOrderPlaced.Font.Color := clGreen;
              LblPackageShipped.Font.Color := clGreen;
            end;

          3:
            begin
              PGLoading.Position := 75;
              LblOrderPlaced.Font.Color := clGreen;
              LblPackageShipped.Font.Color := clGreen;
              LblPackageOnRoute.Font.Color := clGreen;
            end;

          4:
            begin
              PGLoading.Position := 100;
              LblOrderPlaced.Font.Color := clGreen;
              LblPackageShipped.Font.Color := clGreen;
              LblPackageOnRoute.Font.Color := clGreen;
              LblPackageDelivered.Font.Color := clGreen;
            end;
        end;
      end
      else
      begin
        DMOrders.TblOrders.Next;
      end;
    end;
  end
  else
  begin
    showmessage('Status Update Canceled');
    BtnLoadLast.Hide;
    BtnLoadNext.Hide;
    BtnDone.Hide;
  end;
end;

procedure TFrmStaffViewOrder.BtnHelpClick(Sender: TObject);
begin // showing the help message
  objHelp.StaffViewOrder;
end;

procedure TFrmStaffViewOrder.BtnLoadLastClick(Sender: TObject);
begin // loading the chnages in the status
  iStatus := iStatus - 1;
  case iStatus of
    0:
      begin
        showmessage('ORDER WAS CANCELED');
        PGLoading.Position := 0;
        LblOrderCanceled.Font.Color := clRed;
      end;

    1:
      begin
        PGLoading.Position := 25;
        LblOrderPlaced.Font.Color := clGreen;
      end;

    2:
      begin
        PGLoading.Position := 50;
        LblOrderPlaced.Font.Color := clGreen;
        LblPackageShipped.Font.Color := clGreen;
      end;

    3:
      begin
        PGLoading.Position := 75;
        LblOrderPlaced.Font.Color := clGreen;
        LblPackageShipped.Font.Color := clGreen;
        LblPackageOnRoute.Font.Color := clGreen;
      end;

    4:
      begin
        PGLoading.Position := 100;
        LblOrderPlaced.Font.Color := clGreen;
        LblPackageShipped.Font.Color := clGreen;
        LblPackageOnRoute.Font.Color := clGreen;
        LblPackageDelivered.Font.Color := clGreen;
      end;
  end;
end;

procedure TFrmStaffViewOrder.BtnLoadNextClick(Sender: TObject);
begin // loading the chnages in the status
  iStatus := iStatus + 1;
  case iStatus of
    0:
      begin
        showmessage('ORDER WAS CANCELED');
        PGLoading.Position := 0;
        LblOrderCanceled.Font.Color := clRed;
      end;

    1:
      begin
        PGLoading.Position := 25;
        LblOrderPlaced.Font.Color := clGreen;
      end;

    2:
      begin
        PGLoading.Position := 50;
        LblOrderPlaced.Font.Color := clGreen;
        LblPackageShipped.Font.Color := clGreen;
      end;

    3:
      begin
        PGLoading.Position := 75;
        LblOrderPlaced.Font.Color := clGreen;
        LblPackageShipped.Font.Color := clGreen;
        LblPackageOnRoute.Font.Color := clGreen;
      end;

    4:
      begin
        PGLoading.Position := 100;
        LblOrderPlaced.Font.Color := clGreen;
        LblPackageShipped.Font.Color := clGreen;
        LblPackageOnRoute.Font.Color := clGreen;
        LblPackageDelivered.Font.Color := clGreen;
      end;
  end;
end;

procedure TFrmStaffViewOrder.BtnMyAccountClick(Sender: TObject);
begin
  FrmStaffViewOrder.Hide;
  FrmStaffAccount.Show;
end;

procedure TFrmStaffViewOrder.BtnUpdateStatusClick(Sender: TObject);
begin // loading the chnages in the status
  BtnLoadLast.Show;
  BtnLoadNext.Show;
  BtnDone.Show;
end;

procedure TFrmStaffViewOrder.BtnUnassignClick(Sender: TObject);
begin // confirming the un assigning of the staff to the order
  if MessageDlg('Are you sure you want to unassign yourself from this order?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DMOrders.TblOrders.First;
    while not DMOrders.TblOrders.Eof do
    begin
      if DMOrders.TblOrders['STAFF ID'] = StaffID then
      begin
        DMOrders.TblOrders.Edit;
        DMOrders.TblOrders['STAFF ID'] := ' ';
        DMOrders.TblOrders.Post;
        exit;
      end
      else
      begin
        DMOrders.TblOrders.Next;
      end;
    end;

    DMUsers.TblStaff.First;
    while not DMUsers.TblStaff.Eof do
    begin
      if DMUsers.TblStaff['STAFF ID'] = StaffID then
      begin
        DMUsers.TblStaff.Edit;
        DMUsers.TblStaff['AVAILABLE'] := true;
        DMUsers.TblStaff['CURRENT ORDER'] := '-';
        DMUsers.TblStaff.Post;
        exit;
      end
      else
      begin
        DMUsers.TblStaff.Next;
      end;
    end;

    DMUsers.TblCustomer.First;
    while not DMUsers.TblCustomer.Eof do
    begin
      if DMUsers.TblCustomer['ASSIGNED STAFF ID'] = StaffID then
      begin
        DMUsers.TblCustomer.Edit;
        DMUsers.TblCustomer['ASSIGNED STAFF ID'] := '-';
        DMUsers.TblCustomer.Post;
        exit;
      end
      else
      begin
        DMUsers.TblCustomer.Next;
      end;
    end;
  end
  else
  begin
    showmessage('Unassigning canceled.');
  end;
end;

procedure TFrmStaffViewOrder.FormCreate(Sender: TObject);
begin // initialising the form
  LblTime.Font.Color := clWhite;
  TTime.Interval := 1000;
  TTime.Enabled := true;
  LblViewOrder.Font.Color := clWhite;
  FrmStaffViewOrder.BorderStyle := bsnone;
  FrmStaffViewOrder.BorderIcons := [];
  FrmStaffViewOrder.Position := poScreenCenter;
  ImgViewOrder.Stretch := true;
  ImgViewOrder.Picture.LoadFromFile('BACKGROUNDS\VIEW ORDER.jpg');
  ImgViewOrder.Align := Alclient;

  LblMyID.Font.Color := clWhite;
  LblCustomerName.Font.Color := clWhite;
  LblDestination.Font.Color := clWhite;
  LblPickUp.Font.Color := clWhite;
  LblPackageTo.Font.Color := clWhite;
  LblDeliveryType.Font.Color := clWhite;
  LblOrderPlaced.Font.Color := clWhite;
  LblPackageShipped.Font.Color := clWhite;
  LblPackageOnRoute.Font.Color := clWhite;
  LblPackageDelivered.Font.Color := clWhite;
  LblOrderCanceled.Font.Color := clWhite;
  LblCell.Font.Color := clWhite;

  EdtCellNumber.Text := '';
  EdtStaffID.Text := '';
  EdtDestination.Text := '';
  EdtPickUp.Text := '';
  EdtType.Text := '';
  EdtTo.Text := '';
  EdtCustomerName.Text := '';

  EdtStaffID.Enabled := false;
  EdtDestination.Enabled := false;
  EdtPickUp.Enabled := false;
  EdtType.Enabled := false;
  EdtTo.Enabled := false;
  EdtCustomerName.Enabled := false;
  EdtCellNumber.Enabled := false;
  RbtnFragile.Enabled := false;

  BtnLoadLast.Hide;
  BtnLoadNext.Hide;
  BtnDone.Hide;

end;

procedure TFrmStaffViewOrder.FormShow(Sender: TObject);
var // initialising the edts
  bDone, bFragile: boolean;
begin
  bDone := false;
  StaffID := FrmStaffLogin.sadminid;
  objOrder := TOrders.create(StaffID);
  DMOrders.TblOrders.First;
  while not DMOrders.TblOrders.Eof do
  begin
    if DMOrders.TblOrders['STAFF ID'] = StaffID then
    begin
      bDone := true;
      EdtStaffID.Text := StaffID;
      EdtCustomerName.Text := objOrder.getCustomerName;
      EdtDestination.Text := objOrder.getDestination;
      EdtPickUp.Text := objOrder.getPickUpLocation;
      EdtType.Text := objOrder.getType;
      EdtTo.Text := objOrder.getPackageTo;
      EdtCellNumber.Text := objOrder.getCustomerNumber;
      bFragile := objOrder.getFragile;
      iStatus := objOrder.getstatus;
      if bFragile = true then
      begin
        RbtnFragile.Checked := true;
      end
      else
      begin
        RbtnFragile.Checked := false;
      end;
      exit;
    end
    else
    begin
      DMOrders.TblOrders.Next;
    end;
  end;

end;

procedure TFrmStaffViewOrder.TTimeTimer(Sender: TObject);
begin // showing the current time
  LblTime.Caption := FormatDateTime('hh:nn:ss', Now);
end;

end.
