unit CustomerViewOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, DBOrders, DBUsers, Grids, DBGrids,
  Help;

type
  TFrmCustomerViewOrder = class(TForm)
    ImgViewOrder: TImage;
    LblViewOrder: TLabel;
    BtnClose: TButton;
    BtnHelp: TButton;
    LblTime: TLabel;
    TTime: TTimer;
    BtnBack: TButton;
    PGLoading: TProgressBar;
    EdtCustomerCode: TEdit;
    EdtFrom: TEdit;
    EdtTo: TEdit;
    EdtDeliveryType: TEdit;
    EdtPickUp: TEdit;
    EdtDestination: TEdit;
    LblFrom: TLabel;
    LblTo: TLabel;
    LblCustomerCode: TLabel;
    LblDeliveryType: TLabel;
    LblAssignedStaff: TLabel;
    LblPackageDestination: TLabel;
    EdtStaffID: TEdit;
    LblStaffAssigned: TLabel;
    RbtnFragile: TRadioButton;
    LblOrderPlaced: TLabel;
    LblPackageShipped: TLabel;
    LblPackageOnRoute: TLabel;
    LblPackageDelivered: TLabel;
    TTimeLoad: TTimer;
    LblOrderCanceled: TLabel;
    BtnCancel: TButton;
    BtnConfirmDelivery: TButton;
    procedure TTimeTimer(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnBackClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnHelpClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnConfirmDeliveryClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public { Public declarations }
    sExtractedCustomerCode: string;
  end;

var
  FrmCustomerViewOrder: TFrmCustomerViewOrder;
  ObjHelp: THelp; // class for the help button
  bfound: boolean;

implementation

uses
  CustomerHub, CustomerLogin, CustomerReviews;
{$R *.dfm}

procedure TFrmCustomerViewOrder.BtnBackClick(Sender: TObject);
begin // go back to the customer hub
  FrmCustomerViewOrder.Hide;
  FrmCustomerHub.Show;
end;

procedure TFrmCustomerViewOrder.BtnCancelClick(Sender: TObject);
var
  sstaffid: string;
begin // confirming to cancel the order
  if MessageDlg('Are you sure that you want to cancel the order?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DMUsers.TblCustomer.First;
    while not DMUsers.TblCustomer.Eof do
    begin
      if DMUsers.TblCustomer['CUSTOMER CODE']
        = FrmCustomerLogin.sCustomerCode then
      begin
        DMUsers.TblCustomer.Edit;
        DMUsers.TblCustomer['CURRENT ORDERS'] := false;
        DMUsers.TblCustomer['ASSIGNED STAFF ID'] := '-';
        DMUsers.TblCustomer.Post;
        break;
      end
      else
      begin
        DMUsers.TblCustomer.Next
      end;
    end;

    DMOrders.TblOrders.First;
    while not DMOrders.TblOrders.Eof do
    begin
      if DMOrders.TblOrders['CUSTOMER CODE']
        = FrmCustomerLogin.sCustomerCode then
      begin
        DMOrders.TblOrders.Edit;
        DMOrders.TblOrders['DELIVERY STATUS'] := 0;
        sstaffid := DMOrders.TblOrders['STAFF ID'];
        DMOrders.TblOrders['STAFF ID'] := '-';
        DMOrders.TblOrders.Post;
        break;
      end
      else
      begin
        DMOrders.TblOrders.Next;
      end;
    end;

    DMUsers.TblStaff.First;
    while not DMUsers.TblStaff.Eof do
    begin
      if DMUsers.TblStaff['STAFF ID'] = sstaffid then
      begin
        DMUsers.TblStaff.Edit;
        DMUsers.TblStaff['AVAILABLE'] := TRUE;
        DMUsers.TblStaff['CURRENT ORDER'] := '-';
        DMUsers.TblStaff.Post;
        break;
      end
      else
      begin
        DMUsers.TblStaff.Next;
      end;
    end;

    showmessage('Order Cancelled succesfully');
    LblOrderCanceled.Font.Color := clred;
    LblPackageDestination.Font.Color := clred;
    LblPackageShipped.Font.Color := clred;
    LblPackageOnRoute.Font.Color := clred;
    LblPackageDelivered.Font.Color := clred;
    PGLoading.Position := 0;
    LblOrderCanceled.Font.Color := clGreen;
    BtnConfirmDelivery.Hide;
    BtnCancel.Hide;
  end
  else
  begin
    showmessage('Order confirmation canceled.');
  end;
end;

procedure TFrmCustomerViewOrder.BtnCloseClick(Sender: TObject);
begin // asking for a review then closing the application
  if MessageDlg('Would you like to leave a review?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
  begin
    FrmCustomerReviews.Show;
    FrmCustomerViewOrder.Hide;
  end
  else
  begin
    Application.Terminate;
  end;
end;

procedure TFrmCustomerViewOrder.BtnConfirmDeliveryClick(Sender: TObject);
var
  sstaffid: string;
begin // confirming the the delivery has been recieved as the customer
  if MessageDlg('Are you sure that you have recieved your order?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DMUsers.TblCustomer.First;
    while not DMUsers.TblCustomer.Eof do
    begin
      if DMUsers.TblCustomer['CUSTOMER CODE']
        = FrmCustomerLogin.sCustomerCode then
      begin
        DMUsers.TblCustomer.Edit;
        DMUsers.TblCustomer['CURRENT ORDERS'] := false;
        DMUsers.TblCustomer['ASSIGNED STAFF ID'] := '-';
        DMUsers.TblCustomer.Post;
        break;
      end
      else
      begin
        DMUsers.TblCustomer.Next
      end;
    end;

    DMOrders.TblOrders.First;
    while not DMOrders.TblOrders.Eof do
    begin
      if DMOrders.TblOrders['CUSTOMER CODE']
        = FrmCustomerLogin.sCustomerCode then
      begin
        DMOrders.TblOrders.Edit;
        DMOrders.TblOrders['DELIVERY STATUS'] := 4;
        sstaffid := DMOrders.TblOrders['STAFF ID'];
        DMOrders.TblOrders['STAFF ID'] := '-';
        DMOrders.TblOrders.Post;
        break;
      end
      else
      begin
        DMOrders.TblOrders.Next;
      end;
    end;

    DMUsers.TblStaff.First;
    while not DMUsers.TblStaff.Eof do
    begin
      if DMUsers.TblStaff['STAFF ID'] = sstaffid then
      begin
        DMUsers.TblStaff.Edit;
        DMUsers.TblStaff['AVAILABLE'] := TRUE;
        DMUsers.TblStaff['CURRENT ORDER'] := '-';
        DMUsers.TblStaff.Post;
        break;
      end
      else
      begin
        DMUsers.TblStaff.Next;
      end;
    end;
    showmessage('Order completion confirmed');
    PGLoading.Position := 100;
    LblOrderPlaced.Font.Color := clGreen;
    LblPackageShipped.Font.Color := clGreen;
    LblPackageOnRoute.Font.Color := clGreen;
    LblPackageDelivered.Font.Color := clGreen;
  end
  else
  begin
    showmessage('Order confirmation canceled.');
  end;
end;

procedure TFrmCustomerViewOrder.BtnHelpClick(Sender: TObject);
begin // showing the help message
  ObjHelp.ViewCustomerOrder;
end;

procedure TFrmCustomerViewOrder.FormCreate(Sender: TObject);
begin // initialising the form
  bfound := false;
  LblViewOrder.Font.Color := clWhite;
  LblTime.Font.Color := clWhite;
  TTime.Enabled := TRUE;
  TTime.Interval := 1000;
  FrmCustomerViewOrder.BorderStyle := bsnone;
  FrmCustomerViewOrder.BorderIcons := [];
  FrmCustomerViewOrder.Position := poScreenCenter;
  ImgViewOrder.Stretch := TRUE;
  ImgViewOrder.Picture.LoadFromFile('BACKGROUNDS\VIEW ORDER.jpg');
  ImgViewOrder.Align := Alclient;
  PGLoading.Position := 0;
  LblFrom.Font.Color := clWhite;
  LblTo.Font.Color := clWhite;
  LblDeliveryType.Font.Color := clWhite;
  RbtnFragile.Font.Color := clWhite;
  LblCustomerCode.Font.Color := clWhite;
  LblAssignedStaff.Font.Color := clWhite;
  LblPackageDestination.Font.Color := clWhite;
  LblStaffAssigned.Font.Color := clWhite;
  EdtCustomerCode.Enabled := false;
  EdtFrom.Enabled := false;
  EdtTo.Enabled := false;
  EdtDeliveryType.Enabled := false;
  EdtPickUp.Enabled := false;
  EdtDestination.Enabled := false;
  EdtStaffID.Enabled := false;
  RbtnFragile.Enabled := false;
  TTimeLoad.Interval := 100;
  TTimeLoad.Enabled := TRUE;
  LblOrderPlaced.Font.Color := clred;
  LblOrderCanceled.Font.Color := clred;
  LblPackageShipped.Font.Color := clred;
  LblPackageOnRoute.Font.Color := clred;
  LblPackageDelivered.Font.Color := clred;
  EdtCustomerCode.Text := '';
  EdtFrom.Text := '';
  EdtTo.Text := '';
  EdtDeliveryType.Text := '';
  EdtDestination.Text := '';
  EdtPickUp.Text := '';
  EdtStaffID.Text := '';
end;

procedure TFrmCustomerViewOrder.FormShow(Sender: TObject);
var
  sCustomerCode: string;
begin // initialising the form
  sCustomerCode := FrmCustomerLogin.sCustomerCode;
  DMOrders.TblOrders.First;
  while not DMOrders.TblOrders.Eof do
  begin
    if DMOrders.TblOrders['CUSTOMER CODE'] = FrmCustomerLogin.sCustomerCode then
    begin
      if DMOrders.TblOrders['DELIVERY STATUS'] = '0' then
      begin
        showmessage('ORDER WAS CANCELED');
        PGLoading.Position := 0;
        LblOrderCanceled.Font.Color := clGreen;
        BtnConfirmDelivery.Hide;
        BtnCancel.Hide;
      end;
      if DMOrders.TblOrders['DELIVERY STATUS'] = '1' then
      begin
        PGLoading.Position := 25;
        LblOrderPlaced.Font.Color := clGreen;
      end;
      if DMOrders.TblOrders['DELIVERY STATUS'] = '2' then
      begin
        PGLoading.Position := 50;
        LblOrderPlaced.Font.Color := clGreen;
        LblPackageShipped.Font.Color := clGreen;
      end;
      if DMOrders.TblOrders['DELIVERY STATUS'] = '3' then
      begin
        PGLoading.Position := 75;
        LblOrderPlaced.Font.Color := clGreen;
        LblPackageShipped.Font.Color := clGreen;
        LblPackageOnRoute.Font.Color := clGreen;
      end;
      if DMOrders.TblOrders['DELIVERY STATUS'] = '4' then
      begin
        PGLoading.Position := 100;
        LblOrderPlaced.Font.Color := clGreen;
        LblPackageShipped.Font.Color := clGreen;
        LblPackageOnRoute.Font.Color := clGreen;
        LblPackageDelivered.Font.Color := clGreen;
      end;

      EdtCustomerCode.Text := DMOrders.TblOrders['CUSTOMER CODE'];
      EdtFrom.Text := DMOrders.TblOrders['PACKAGE FROM'];
      EdtTo.Text := DMOrders.TblOrders['PACKAGE TO'];
      if DMOrders.TblOrders['FRAGILE'] = TRUE then
      begin
        RbtnFragile.Checked := TRUE;
      end;
      if DMOrders.TblOrders['FRAGILE'] = false then
      begin
        RbtnFragile.Checked := false;
      end;

      EdtDeliveryType.Text := DMOrders.TblOrders['DELIVERY TYPE'];
      EdtPickUp.Text := DMOrders.TblOrders['PICK-UP LOCATION'];
      EdtDestination.Text := DMOrders.TblOrders['PACKAGE DESTINATION'];
      EdtStaffID.Text := DMOrders.TblOrders['STAFF ID'];
      break;
    end
    else
    begin
      DMOrders.TblOrders.Next;
    end;
  end;
end;

procedure TFrmCustomerViewOrder.TTimeTimer(Sender: TObject);
begin // showing the current time
  LblTime.Caption := FormatDateTime('hh:nn:ss', Now);
end;

end.
