unit AdminAllOrdersView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, DBOrders, ComCtrls;

type
  TFrmAllOrdersView = class(TForm)
    BtnClose: TButton;
    BtnHelp: TButton;
    TTime: TTimer;
    ImgViewOrder: TImage;
    BtnBack: TButton;
    DBGOrders: TDBGrid;
    BtnFirst2: TButton;
    BtnBefore2: TButton;
    BtnNext2: TButton;
    BtnLast2: TButton;
    LblPackageFrom: TLabel;
    LblPackageTo: TLabel;
    LblPickUp: TLabel;
    LblDropOff: TLabel;
    LblDeliveryType: TLabel;
    LblStaff: TLabel;
    EdtPackageTo: TEdit;
    EdtPackageFrom: TEdit;
    EdtPickUp: TEdit;
    EdtDropOff: TEdit;
    EdtStaff: TEdit;
    LblOrderPlaced: TLabel;
    LblPackageShipped: TLabel;
    LblPackageOnRoute: TLabel;
    LblPackageDelivered: TLabel;
    LblOrderCanceled: TLabel;
    PGLoading: TProgressBar;
    CmbDeliveryType: TComboBox;
    BtnDelete: TButton;
    BtnDone: TButton;
    BtnEdit: TButton;
    RbtnFragile: TRadioButton;
    CmbType: TComboBox;
    CmbDeliveryStatus: TComboBox;
    BtnRefresh: TButton;
    CmbSearch: TComboBox;
    BtnFragile: TButton;
    BtnNotFragile: TButton;
    LblCustomer: TLabel;
    EdtCustomerCode: TEdit;
    BtnLoadLast: TButton;
    BtnLoadNext: TButton;
    LblViewOrder: TLabel;
    LblTime: TLabel;
    procedure BtnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TTimeTimer(Sender: TObject);
    procedure BtnBackClick(Sender: TObject);
    procedure BtnLast2Click(Sender: TObject);
    procedure BtnNext2Click(Sender: TObject);
    procedure BtnBefore2Click(Sender: TObject);
    procedure BtnFirst2Click(Sender: TObject);
    procedure CmbTypeChange(Sender: TObject);
    procedure BtnRefreshClick(Sender: TObject);
    procedure CmbDeliveryStatusChange(Sender: TObject);
    procedure BtnFragileClick(Sender: TObject);
    procedure BtnNotFragileClick(Sender: TObject);
    procedure CmbSearchChange(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure BtnDoneClick(Sender: TObject);
    procedure BtnLoadLastClick(Sender: TObject);
    procedure BtnLoadNextClick(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAllOrdersView: TFrmAllOrdersView;
  // 0 = Local  1 = Domestic  2 = Internatioonal
  ArrDeliveryType: array [0 .. 2] of string = (
    'Local',
    'Domestic',
    'International'
  );
  // 0 = CANCELED, 1 = PLACED, 2 = SHIPPED, 3 = ON ITS WAY, 4 = DELIVERED
  ArrDeliveryStatus: array [0 .. 4] of string = (
    'Canceled',
    'Order Placed',
    'Package Shipped',
    'Package on Route',
    'Package Delivered'
  );
  // 0 = CUSTOMER CODE, 1 = PACKAGE SENT BY, 2 = PACKAGE SENT TO, 3 = STAFF RESPONSIBLE, 4 = PICK-UP LOCATION, 5 = PACKAGE DESTINATION
  ArrSearch: array [0 .. 5] of string = (
    'Customer Code',
    'Package Sent By',
    'Package Sent To',
    'Staff Responsible',
    'Pick-Up Location',
    'Package Destination'
  );
  iStatus: integer;

implementation

Uses
  AdminHub;
{$R *.dfm}

procedure TFrmAllOrdersView.BtnBackClick(Sender: TObject);
begin // go back to admin hub
  FrmAllOrdersView.Hide;
  FrmAdminHub.Show;
end;

procedure TFrmAllOrdersView.BtnBefore2Click(Sender: TObject);
var
  bFragile: boolean;
begin // previous record
  DBGOrders.DataSource := DMOrders.DscOrders;
  DMOrders.TblOrders.prior;

  EdtPackageTo.Text := DMOrders.TblOrders['PACKAGE TO'];
  EdtPackageFrom.Text := DMOrders.TblOrders['PACKAGE FROM'];
  EdtPickUp.Text := DMOrders.TblOrders['PICK-UP LOCATION'];
  EdtDropOff.Text := DMOrders.TblOrders['PACKAGE DESTINATION'];
  EdtStaff.Text := DMOrders.TblOrders['STAFF ID'];
  EdtCustomerCode.Text := DMOrders.TblOrders['CUSTOMER CODE'];
  bFragile := DMOrders.TblOrders['FRAGILE'];
  if bFragile = true then
  begin
    RbtnFragile.Checked := true;
  end
  else
  begin
    RbtnFragile.Checked := false;
  end;

  if DMOrders.TblOrders['DELIVERY TYPE'] = 'Local' then
    CmbDeliveryType.ItemIndex := 0
  else if DMOrders.TblOrders['DELIVERY TYPE'] = 'Domestic' then
    CmbDeliveryType.ItemIndex := 1
  else if DMOrders.TblOrders['DELIVERY TYPE'] = 'International' then
    CmbDeliveryType.ItemIndex := 2;

  case DMOrders.TblOrders['DELIVERY STATUS'] of
    0:
      begin
        ShowMessage('ORDER WAS CANCELED');
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
  iStatus := DMOrders.TblOrders.FieldByName('DELIVERY STATUS').AsInteger;
end;

procedure TFrmAllOrdersView.BtnCloseClick(Sender: TObject);
begin // close the application
  Application.Terminate;
end;

procedure TFrmAllOrdersView.BtnDeleteClick(Sender: TObject);
begin // delete record
  if MessageDlg('Are you sure you want to delete this order?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
  begin
    DMOrders.TblOrders.Delete;
  end
  else
  begin
    ShowMessage('Deletion canceled');
  end;

  EdtPackageTo.ReadOnly := true;
  EdtPackageFrom.ReadOnly := true;
  EdtPickUp.ReadOnly := true;
  EdtDropOff.ReadOnly := true;
  EdtStaff.ReadOnly := true;
  CmbDeliveryType.Enabled := false;
  RbtnFragile.Enabled := false;
  BtnDone.Hide;
  BtnDelete.Hide;
  BtnEdit.Show;
  BtnLoadLast.Hide;
  BtnLoadNext.Hide;
end;

procedure TFrmAllOrdersView.BtnDoneClick(Sender: TObject);
begin // finish editing
  if (EdtPackageTo.Text = '') or (EdtPackageFrom.Text = '') or
    (EdtPickUp.Text = '') or (EdtDropOff.Text = '') or (EdtStaff.Text = '')
    then
  begin
    ShowMessage('Please make sure all details are filled');
    exit;
  end;

  begin
    if MessageDlg(
      'Are you sure you want to save these changes? The edits can not be undone.'
        , mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      DMOrders.TblOrders.Edit;
      DMOrders.TblOrders['CUSTOMER CODE'] := EdtCustomerCode.Text;
      DMOrders.TblOrders['PACKAGE TO'] := EdtPackageTo.Text;
      DMOrders.TblOrders['PACKAGE FROM'] := EdtPackageFrom.Text;
      DMOrders.TblOrders['STAFF ID'] := EdtStaff.Text;
      DMOrders.TblOrders['PICK-UP LOCATION'] := EdtPickUp.Text;
      DMOrders.TblOrders['PACKAGE DESTINATION'] := EdtDropOff.Text;

      if RbtnFragile.Checked = true then
      begin
        DMOrders.TblOrders['FRAGILE'] := true;
      end
      else
      begin
        DMOrders.TblOrders['FRAGILE'] := false;
      end;

      DMOrders.TblOrders['DELIVERY TYPE'] := CmbDeliveryType.Text;
      DMOrders.TblOrders['DELIVERY STATUS'] := iStatus;
      DMOrders.TblOrders.Post;
    end
    else
    begin
      ShowMessage('The edits have been canceled');
    end;
  end;

  EdtPackageTo.ReadOnly := true;
  EdtPackageFrom.ReadOnly := true;
  EdtPickUp.ReadOnly := true;
  EdtDropOff.ReadOnly := true;
  EdtStaff.ReadOnly := true;
  CmbDeliveryType.Enabled := false;
  RbtnFragile.Enabled := false;
  BtnDone.Hide;
  BtnDelete.Hide;
  BtnEdit.Show;
  BtnLoadLast.Hide;
  BtnLoadNext.Hide;
end;

procedure TFrmAllOrdersView.BtnEditClick(Sender: TObject);
begin // enable ability to edit
  EdtPackageTo.ReadOnly := false;
  EdtPackageFrom.ReadOnly := false;
  EdtPickUp.ReadOnly := false;
  EdtDropOff.ReadOnly := false;
  EdtStaff.ReadOnly := false;
  CmbDeliveryType.Enabled := true;
  RbtnFragile.Enabled := true;
  BtnDone.Show;
  BtnDelete.Show;
  BtnEdit.Hide;
  BtnLoadLast.Show;
  BtnLoadNext.Show;
end;

procedure TFrmAllOrdersView.BtnFirst2Click(Sender: TObject);
var
  bFragile: boolean;
begin // first record
  DBGOrders.DataSource := DMOrders.DscOrders;
  DMOrders.TblOrders.First;

  EdtPackageTo.Text := DMOrders.TblOrders['PACKAGE TO'];
  EdtPackageFrom.Text := DMOrders.TblOrders['PACKAGE FROM'];
  EdtPickUp.Text := DMOrders.TblOrders['PICK-UP LOCATION'];
  EdtDropOff.Text := DMOrders.TblOrders['PACKAGE DESTINATION'];
  EdtStaff.Text := DMOrders.TblOrders['STAFF ID'];
  EdtCustomerCode.Text := DMOrders.TblOrders['CUSTOMER CODE'];
  bFragile := DMOrders.TblOrders['FRAGILE'];
  if bFragile = true then
  begin
    RbtnFragile.Checked := true;
  end
  else
  begin
    RbtnFragile.Checked := false;
  end;

  if DMOrders.TblOrders['DELIVERY TYPE'] = 'Local' then
    CmbDeliveryType.ItemIndex := 0
  else if DMOrders.TblOrders['DELIVERY TYPE'] = 'Domestic' then
    CmbDeliveryType.ItemIndex := 1
  else if DMOrders.TblOrders['DELIVERY TYPE'] = 'International' then
    CmbDeliveryType.ItemIndex := 2;

  case DMOrders.TblOrders['DELIVERY STATUS'] of
    0:
      begin
        ShowMessage('ORDER WAS CANCELED');
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
  iStatus := DMOrders.TblOrders.FieldByName('DELIVERY STATUS').AsInteger;
end;

procedure TFrmAllOrdersView.BtnFragileClick(Sender: TObject);
begin // search from fragile or not
  DBGOrders.DataSource := DMOrders.dscOrderQuery;
  with DMOrders do
  begin
    qryOrderQuery.Close;
    qryOrderQuery.SQL.Text := 'SELECT * FROM ORDERS WHERE FRAGILE = TRUE';
    qryOrderQuery.Open;
  end;
  BtnFragile.Hide;
  BtnNotFragile.Show;
end;

procedure TFrmAllOrdersView.BtnLast2Click(Sender: TObject);
var
  bFragile: boolean;
begin // last record
  DBGOrders.DataSource := DMOrders.DscOrders;
  DMOrders.TblOrders.last;

  EdtPackageTo.Text := DMOrders.TblOrders['PACKAGE TO'];
  EdtPackageFrom.Text := DMOrders.TblOrders['PACKAGE FROM'];
  EdtPickUp.Text := DMOrders.TblOrders['PICK-UP LOCATION'];
  EdtDropOff.Text := DMOrders.TblOrders['PACKAGE DESTINATION'];
  EdtStaff.Text := DMOrders.TblOrders['STAFF ID'];
  EdtCustomerCode.Text := DMOrders.TblOrders['CUSTOMER CODE'];
  bFragile := DMOrders.TblOrders['FRAGILE'];
  if bFragile = true then
  begin
    RbtnFragile.Checked := true;
  end
  else
  begin
    RbtnFragile.Checked := false;
  end;

  if DMOrders.TblOrders['DELIVERY TYPE'] = 'Local' then
    CmbDeliveryType.ItemIndex := 0
  else if DMOrders.TblOrders['DELIVERY TYPE'] = 'Domestic' then
    CmbDeliveryType.ItemIndex := 1
  else if DMOrders.TblOrders['DELIVERY TYPE'] = 'International' then
    CmbDeliveryType.ItemIndex := 2;

  case DMOrders.TblOrders['DELIVERY STATUS'] of
    0:
      begin
        ShowMessage('ORDER WAS CANCELED');
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

procedure TFrmAllOrdersView.BtnLoadLastClick(Sender: TObject);
begin // last status
  iStatus := iStatus - 1;
  case iStatus of
    0:
      begin
        ShowMessage('ORDER WAS CANCELED');
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

procedure TFrmAllOrdersView.BtnLoadNextClick(Sender: TObject);
begin // next status
  iStatus := iStatus + 1;
  case iStatus of
    0:
      begin
        ShowMessage('ORDER WAS CANCELED');
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

procedure TFrmAllOrdersView.BtnNext2Click(Sender: TObject);
var
  bFragile: boolean;
begin // next record
  DBGOrders.DataSource := DMOrders.DscOrders;
  DMOrders.TblOrders.next;

  EdtPackageTo.Text := DMOrders.TblOrders['PACKAGE TO'];
  EdtPackageFrom.Text := DMOrders.TblOrders['PACKAGE FROM'];
  EdtPickUp.Text := DMOrders.TblOrders['PICK-UP LOCATION'];
  EdtDropOff.Text := DMOrders.TblOrders['PACKAGE DESTINATION'];
  EdtStaff.Text := DMOrders.TblOrders['STAFF ID'];
  EdtCustomerCode.Text := DMOrders.TblOrders['CUSTOMER CODE'];
  bFragile := DMOrders.TblOrders['FRAGILE'];
  if bFragile = true then
  begin
    RbtnFragile.Checked := true;
  end
  else
  begin
    RbtnFragile.Checked := false;
  end;
  if DMOrders.TblOrders['DELIVERY TYPE'] = 'Local' then
    CmbDeliveryType.ItemIndex := 0
  else if DMOrders.TblOrders['DELIVERY TYPE'] = 'Domestic' then
    CmbDeliveryType.ItemIndex := 1
  else if DMOrders.TblOrders['DELIVERY TYPE'] = 'International' then
    CmbDeliveryType.ItemIndex := 2;

  case DMOrders.TblOrders['DELIVERY STATUS'] of
    0:
      begin
        ShowMessage('ORDER WAS CANCELED');
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
  iStatus := DMOrders.TblOrders.FieldByName('DELIVERY STATUS').AsInteger;
end;

procedure TFrmAllOrdersView.BtnNotFragileClick(Sender: TObject);
begin // search from fragile or not
  DBGOrders.DataSource := DMOrders.dscOrderQuery;
  with DMOrders do
  begin
    qryOrderQuery.Close;
    qryOrderQuery.SQL.Text := 'SELECT * FROM ORDERS WHERE FRAGILE = FALSE';
    qryOrderQuery.Open;
  end;
  BtnFragile.Show;
  BtnNotFragile.Hide;
end;

procedure TFrmAllOrdersView.BtnRefreshClick(Sender: TObject);
begin
  BtnFirst2.Click;
  CmbSearch.Text := 'SEARCH';
end;

procedure TFrmAllOrdersView.CmbDeliveryStatusChange(Sender: TObject);
// 0 = CANCELED, 1 = PLACED, 2 = SHIPPED, 3 = ON ITS WAY, 4 = DELIVERED
begin // update delivery status
  case CmbDeliveryStatus.ItemIndex of
    0:
      begin
        DBGOrders.DataSource := DMOrders.dscOrderQuery;
        with DMOrders do
        begin
          qryOrderQuery.Close;
          qryOrderQuery.SQL.Text :=
            'SELECT * FROM ORDERS WHERE [DELIVERY STATUS] = 0';
          qryOrderQuery.Open;
        end;
      end;

    1:
      begin
        DBGOrders.DataSource := DMOrders.dscOrderQuery;
        with DMOrders do
        begin
          qryOrderQuery.Close;
          qryOrderQuery.SQL.Text :=
            'SELECT * FROM ORDERS WHERE [DELIVERY STATUS] = 1';
          qryOrderQuery.Open;
        end;
      end;

    2:
      begin
        DBGOrders.DataSource := DMOrders.dscOrderQuery;
        with DMOrders do
        begin
          qryOrderQuery.Close;
          qryOrderQuery.SQL.Text :=
            'SELECT * FROM ORDERS WHERE [DELIVERY STATUS] = 2';
          qryOrderQuery.Open;
        end;
      end;

    3:
      begin
        DBGOrders.DataSource := DMOrders.dscOrderQuery;
        with DMOrders do
        begin
          qryOrderQuery.Close;
          qryOrderQuery.SQL.Text :=
            'SELECT * FROM ORDERS WHERE [DELIVERY STATUS] = 3';
          qryOrderQuery.Open;
        end;
      end;

    4:
      begin
        DBGOrders.DataSource := DMOrders.dscOrderQuery;
        with DMOrders do
        begin
          qryOrderQuery.Close;
          qryOrderQuery.SQL.Text :=
            'SELECT * FROM ORDERS WHERE [DELIVERY STATUS] = 4';
          qryOrderQuery.Open;
        end;
      end;
  end;
end;

procedure TFrmAllOrdersView.CmbSearchChange(Sender: TObject);
// 0 = CUSTOMER CODE, 1 = PACKAGE SENT BY, 2 = PACKAGE SENT TO
// 3 = STAFF RESPONSIBLE, 4 = PICK-UP LOCATION, 5 = PACKAGE DESTINATION
var
  sSearched: string;
begin // search using whatever way you want
  DBGOrders.DataSource := DMOrders.dscOrderQuery;
  if CmbSearch.ItemIndex = 0 then
  begin
    sSearched := InputBox('Enter the Customer Code of who',
      'Enter the Customer Code of the package you would like to search.', '');
    with DMOrders do
    begin
      qryOrderQuery.Close;
      qryOrderQuery.SQL.Text :=
        'SELECT * FROM ORDERS WHERE [CUSTOMER CODE] = :sSearchedCustomerCode';
      qryOrderQuery.Parameters.ParamByName('sSearchedCustomerCode')
        .Value := sSearched;
      qryOrderQuery.Open;
    end;
  end;

  if CmbSearch.ItemIndex = 1 then
  begin
    sSearched := InputBox('Enter who the Package is Sent By',
      'Enter the sender of the package you would like to search.', '');
    with DMOrders do
    begin
      qryOrderQuery.Close;
      qryOrderQuery.SQL.Text :=
        'SELECT * FROM ORDERS WHERE [PACKAGE FROM] = :sSearchedPackageSentBy';
      qryOrderQuery.Parameters.ParamByName('sSearchedPackageSentBy')
        .Value := sSearched;
      qryOrderQuery.Open;
    end;
  end;

  if CmbSearch.ItemIndex = 2 then
  begin
    sSearched := InputBox('Enter who the Package is Sent To',
      'Enter the recipient of the package you would like to search.', '');
    with DMOrders do
    begin
      qryOrderQuery.Close;
      qryOrderQuery.SQL.Text :=
        'SELECT * FROM ORDERS WHERE [PACKAGE TO] = :sSearchedPackageSentTo';
      qryOrderQuery.Parameters.ParamByName('sSearchedPackageSentTo')
        .Value := sSearched;
      qryOrderQuery.Open;
    end;
  end;

  if CmbSearch.ItemIndex = 3 then
  begin
    sSearched := InputBox('Enter the Staff ID of the Staff Responsible',
      'Enter the staff responsible for the package you would like to search.',
      '');
    with DMOrders do
    begin
      qryOrderQuery.Close;
      qryOrderQuery.SQL.Text :=
        'SELECT * FROM ORDERS WHERE [STAFF ID] = :sSearchedStaffResponsible';
      qryOrderQuery.Parameters.ParamByName('sSearchedStaffResponsible')
        .Value := sSearched;
      qryOrderQuery.Open;
    end;
  end;

  if CmbSearch.ItemIndex = 4 then
  begin
    sSearched := InputBox('Enter Pick-Up Location',
      'Enter the pick-up location of the package you would like to search.',
      '');
    with DMOrders do
    begin
      qryOrderQuery.Close;
      qryOrderQuery.SQL.Text :=
        'SELECT * FROM ORDERS WHERE [PICK-UP LOCATION] = :sSearchedPickupLocation';
      qryOrderQuery.Parameters.ParamByName('sSearchedPickupLocation')
        .Value := sSearched;
      qryOrderQuery.Open;
    end;
  end;

  if CmbSearch.ItemIndex = 5 then
  begin
    sSearched := InputBox('Enter Package Destination',
      'Enter the destination of the package you would like to search.', '');
    with DMOrders do
    begin
      qryOrderQuery.Close;
      qryOrderQuery.SQL.Text :=
        'SELECT * FROM ORDERS WHERE [PACKAGE DESTINATION] = :sSearchedPackageDestination';
      qryOrderQuery.Parameters.ParamByName('sSearchedPackageDestination')
        .Value := sSearched;
      qryOrderQuery.Open;
    end;
  end;
end;

procedure TFrmAllOrdersView.CmbTypeChange(Sender: TObject);
// 0 = Local  1 = Domestic  2 = Internatioonal
begin // change the type of delivery
  case CmbType.ItemIndex of
    0:
      begin
        DBGOrders.DataSource := DMOrders.dscOrderQuery;
        with DMOrders do
        begin
          qryOrderQuery.Close;
          qryOrderQuery.SQL.Text :=
            'SELECT * FROM ORDERS WHERE [DELIVERY TYPE] = sDelivery';
          qryOrderQuery.Parameters.ParamByName('sDelivery').Value := 'Local';
          qryOrderQuery.Open;
        end;
      end;
    1:
      begin
        DBGOrders.DataSource := DMOrders.dscOrderQuery;
        with DMOrders do
        begin
          qryOrderQuery.Close;
          qryOrderQuery.SQL.Text :=
            'SELECT * FROM ORDERS WHERE [DELIVERY TYPE] = sDelivery';
          qryOrderQuery.Parameters.ParamByName('sDelivery').Value := 'Domestic';
          qryOrderQuery.Open;
        end;
      end;
    2:
      begin
        DBGOrders.DataSource := DMOrders.dscOrderQuery;
        with DMOrders do
        begin
          qryOrderQuery.Close;
          qryOrderQuery.SQL.Text :=
            'SELECT * FROM ORDERS WHERE [DELIVERY TYPE] = sDelivery';
          qryOrderQuery.Parameters.ParamByName('sDelivery').Value :=
            'International';
          qryOrderQuery.Open;
        end;
      end;
  end;

end;

procedure TFrmAllOrdersView.FormCreate(Sender: TObject);
var
  i, j, k: integer;
begin // initialising the form
  iStatus := 0;
  LblViewOrder.Font.Color := clWhite;
  LblTime.Font.Color := clWhite;
  TTime.Enabled := true;
  TTime.Interval := 1000;
  FrmAllOrdersView.BorderStyle := bsnone;
  FrmAllOrdersView.BorderIcons := [];
  FrmAllOrdersView.Position := poScreenCenter;
  ImgViewOrder.Stretch := true;
  ImgViewOrder.Picture.LoadFromFile('BACKGROUNDS\VIEW ORDER.jpg');
  ImgViewOrder.Align := Alclient;

  DBGOrders.DataSource := DMOrders.DscOrders;

  EdtPackageTo.Text := '';
  EdtPackageFrom.Text := '';
  EdtPickUp.Text := '';
  EdtDropOff.Text := '';
  EdtStaff.Text := '';
  CmbDeliveryType.Text := 'Type of Delivery';
  LblPackageFrom.Font.Color := clWhite;
  LblPackageTo.Font.Color := clWhite;
  LblPickUp.Font.Color := clWhite;
  LblDropOff.Font.Color := clWhite;
  LblDeliveryType.Font.Color := clWhite;
  LblStaff.Font.Color := clWhite;
  LblCustomer.Font.Color := clWhite;
  BtnNotFragile.Hide;

  // 0 = Local  1 = Domestic  2 = Internatioonal
  for i := Low(ArrDeliveryType) to high(ArrDeliveryType) do
  begin
    CmbDeliveryType.Items.Add(ArrDeliveryType[i]);
    CmbType.Items.Add(ArrDeliveryType[i]);
  end;

  // 0 = CANCELED, 1 = PLACED, 2 = SHIPPED, 3 = ON ITS WAY, 4 = DELIVERED
  for j := low(ArrDeliveryStatus) to high(ArrDeliveryStatus) do
  begin
    CmbDeliveryStatus.Items.Add(ArrDeliveryStatus[j]);
  end;

  for k := low(ArrSearch) to high(ArrSearch) do
  begin
    CmbSearch.Items.Add(ArrSearch[k]);
  end;

  EdtPackageTo.ReadOnly := true;
  EdtPackageFrom.ReadOnly := true;
  EdtPickUp.ReadOnly := true;
  EdtDropOff.ReadOnly := true;
  EdtStaff.ReadOnly := true;
  CmbDeliveryType.Enabled := false;
  RbtnFragile.Enabled := false;
  BtnDone.Hide;
  BtnDelete.Hide;
  BtnEdit.Show;
  BtnLoadLast.Hide;
  BtnLoadNext.Hide;
  LblViewOrder.Show;
  LblTime.Show;

  LblOrderPlaced.Font.Color := clWhite;
  LblOrderCanceled.Font.Color := clWhite;
  LblPackageShipped.Font.Color := clWhite;
  LblPackageOnRoute.Font.Color := clWhite;
  LblPackageDelivered.Font.Color := clWhite;

  BtnFirst2.Click;
end;

procedure TFrmAllOrdersView.TTimeTimer(Sender: TObject);
begin // shows current time
  LblTime.Caption := FormatDateTime('hh:nn:ss', Now);
end;

end.
