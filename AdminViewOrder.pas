unit AdminViewOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, DBUsers, ComCtrls, DBOrders,
  Help, Buttons;

type
  TFrmAdminViewOrder = class(TForm)
    BtnClose: TButton;
    BtnHelp: TButton;
    TTime: TTimer;
    ImgViewOrder: TImage;
    LblViewOrder: TLabel;
    DBGCustomer: TDBGrid;
    BtnFirst: TButton;
    BtnBefore: TButton;
    BtnNext: TButton;
    BtnLast: TButton;
    BtnUnassign: TButton;
    DBGStaff: TDBGrid;
    BtnFirst2: TButton;
    BtnBefore2: TButton;
    BtnNext2: TButton;
    BtnLast2: TButton;
    BtnAssign: TButton;
    BtnRefresh: TButton;
    BtnRefresh2: TButton;
    BtnAvailable: TButton;
    BtnUnavailable: TButton;
    BtnBack: TButton;
    PnlAssign: TPanel;
    CmbCustomer: TComboBox;
    LblAssignCustomer: TLabel;
    LblAssignStaff: TLabel;
    CmbStaff: TComboBox;
    BtnConfirm: TButton;
    BtnManageCustomers: TButton;
    BtnManageStaff: TButton;
    BtnManageAllOrders: TButton;
    LblAssignStaffToOrders: TLabel;
    LblTime: TLabel;
    BitBtnHint1: TBitBtn;
    BitBtnHint2: TBitBtn;
    BitBtnHint3: TBitBtn;
    BtnMinMax: TButton;
    procedure FormCreate(Sender: TObject);
    procedure TTimeTimer(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnFirstClick(Sender: TObject);
    procedure BtnBeforeClick(Sender: TObject);
    procedure BtnNextClick(Sender: TObject);
    procedure BtnLastClick(Sender: TObject);
    procedure BtnFirst2Click(Sender: TObject);
    procedure BtnBefore2Click(Sender: TObject);
    procedure BtnNext2Click(Sender: TObject);
    procedure BtnLast2Click(Sender: TObject);
    procedure BtnUnassignClick(Sender: TObject);
    procedure BtnRefreshClick(Sender: TObject);
    procedure BtnRefresh2Click(Sender: TObject);
    procedure BtnAssignClick(Sender: TObject);
    procedure BtnAvailableClick(Sender: TObject);
    procedure BtnUnavailableClick(Sender: TObject);
    procedure BtnBackClick(Sender: TObject);
    procedure BtnManageStaffClick(Sender: TObject);
    procedure BtnManageCustomersClick(Sender: TObject);
    procedure BtnConfirmClick(Sender: TObject);
    procedure BtnManageAllOrdersClick(Sender: TObject);
    procedure BtnHelpClick(Sender: TObject);
    procedure BitBtnHint1Click(Sender: TObject);
    procedure BitBtnHint2Click(Sender: TObject);
    procedure BitBtnHint3Click(Sender: TObject);
    procedure BtnMinMaxClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAdminViewOrder: TFrmAdminViewOrder;
  ObjHelp: Thelp; // class for the help button

implementation

uses
  AdminHub, AdminStaffView, AdminCustomerView, AdminAllOrdersView;
{$R *.dfm}

procedure TFrmAdminViewOrder.BitBtnHint1Click(Sender: TObject);
begin
  showmessage(
    'This dbg shows the customers with current orders in progress, you can sort them according too being assigned with a staff member or not using the respective buttons.');
end;

procedure TFrmAdminViewOrder.BitBtnHint2Click(Sender: TObject);
begin
  showmessage(
    'This dbg shows all the staff members, you can sort them according to being available or not using the respective buttons.');
end;

procedure TFrmAdminViewOrder.BitBtnHint3Click(Sender: TObject);
begin
  showmessage(
    'The combo boxes automatically get filled with the users with unassigned orders and available staff, you can assign the customer to each staff according to however you desire.');
end;

procedure TFrmAdminViewOrder.BtnAssignClick(Sender: TObject);
begin // assign the available staff to the unassigned customer
  DBGCustomer.DataSource := DMUsers.dscCustomerQuery;
  with DMUsers do
  begin
    qryCustomerQuery.Close;
    qryCustomerQuery.SQL.Text :=
      'SELECT NAME, SURNAME, [CUSTOMER CODE], [CELL NUMBER], EMAIL, [AMOUNT OWED], [CURRENT ORDERS] FROM CUSTOMER WHERE [CURRENT ORDERS] = TRUE AND [ASSIGNED STAFF ID] IS NOT null';
    qryCustomerQuery.Open;
  end;
end;

procedure TFrmAdminViewOrder.BtnBackClick(Sender: TObject);
begin // view all the current orders
  FrmAdminHub.Show;
  FrmAdminViewOrder.Hide;
end;

procedure TFrmAdminViewOrder.BtnBefore2Click(Sender: TObject);
begin // view prior record
  DMUsers.TblStaff.prior;
end;

procedure TFrmAdminViewOrder.BtnBeforeClick(Sender: TObject);
begin // view prior record
  DMUsers.qryCustomerQuery.prior;
end;

procedure TFrmAdminViewOrder.BtnCloseClick(Sender: TObject);
begin // close the application
  Application.Terminate;
end;

procedure TFrmAdminViewOrder.BtnConfirmClick(Sender: TObject);
begin // confirm the assigning of the staff to the customer
  if MessageDlg('Are you sure you want to assign ' + copy(CmbStaff.Text, 1,
      pos('-', CmbStaff.Text) - 1) + ' to ' + copy(CmbCustomer.Text, 1,
      pos('-', CmbCustomer.Text) - 1) + '`s order?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
  begin
    DMUsers.TblStaff.First;
    DMUsers.TblCustomer.First;
    DMOrders.TblOrders.First;
    while not DMUsers.TblStaff.Eof do
    begin
      if DMUsers.TblStaff['STAFF ID'] = copy(CmbStaff.Text,
        pos('-', CmbStaff.Text) + 1, length(CmbStaff.Text)) then
      begin
        DMUsers.TblStaff.Edit;
        DMUsers.TblStaff['CURRENT ORDER'] := copy(CmbCustomer.Text,
          pos('-', CmbCustomer.Text) + 1, length(CmbCustomer.Text));
        DMUsers.TblStaff['AVAILABLE'] := FALSE;
        DMUsers.TblStaff.Post;
        BtnRefresh.Click;
        BtnRefresh2.Click;
        break;
      end
      else
      begin
        DMUsers.TblStaff.Next;
      end;
    end;

    while not DMUsers.TblCustomer.Eof do
    begin
      if DMUsers.TblCustomer['CUSTOMER CODE'] = copy(CmbCustomer.Text,
        pos('-', CmbCustomer.Text) + 1, length(CmbCustomer.Text)) then
      begin
        DMUsers.TblCustomer.Edit;
        DMUsers.TblCustomer['ASSIGNED STAFF ID'] := copy(CmbStaff.Text,
          pos('-', CmbStaff.Text) + 1, length(CmbStaff.Text));
        DMUsers.TblCustomer.Post;
        break;
      end
      else
      begin
        DMUsers.TblCustomer.Next;
      end;

      while not DMOrders.TblOrders.Eof do
      begin
        if (DMOrders.TblOrders['CUSTOMER CODE'] = copy(CmbCustomer.Text,
            pos('-', CmbCustomer.Text) + 1, length(CmbCustomer.Text))) AND
          (DMOrders.TblOrders['STAFF ID'] = '') then
        begin
          DMOrders.TblOrders.Edit;
          DMOrders.TblOrders['STAFF ID'] := copy(CmbStaff.Text,
            pos('-', CmbStaff.Text) + 1, length(CmbStaff.Text));
          DMOrders.TblOrders.Post;
          break;
        end;

      end;

      DBGCustomer.DataSource := DMUsers.dscCustomerQuery;
      with DMUsers do
      begin
        qryCustomerQuery.Close;
        qryCustomerQuery.SQL.Text :=
          'SELECT NAME, SURNAME, [CUSTOMER CODE], [CELL NUMBER], EMAIL, [AMOUNT OWED], [CURRENT ORDERS] FROM CUSTOMER WHERE [CURRENT ORDERS] = TRUE';
        qryCustomerQuery.Open;
      end;

      with DMUsers.TblStaff do
      begin
        Filtered := FALSE;
      end;

    end;
  end
  else
  begin
    showmessage('Confirmation Canceled');
  end;
end;

procedure TFrmAdminViewOrder.BtnFirst2Click(Sender: TObject);
begin // view first record
  DMUsers.TblStaff.First;
end;

procedure TFrmAdminViewOrder.BtnFirstClick(Sender: TObject);
begin // view first record
  DMUsers.qryCustomerQuery.First;
end;

procedure TFrmAdminViewOrder.BtnHelpClick(Sender: TObject);
begin // show the help message
  ObjHelp.ManageOrders;
end;

procedure TFrmAdminViewOrder.BtnLast2Click(Sender: TObject);
begin // view the last record
  DMUsers.TblStaff.last;
end;

procedure TFrmAdminViewOrder.BtnLastClick(Sender: TObject);
begin // view the last record
  DMUsers.qryCustomerQuery.last;
end;

procedure TFrmAdminViewOrder.BtnManageAllOrdersClick(Sender: TObject);
begin // show all the orders
  FrmAdminViewOrder.Hide;
  FrmAllOrdersView.Show;
end;

procedure TFrmAdminViewOrder.BtnManageCustomersClick(Sender: TObject);
begin // show all the customers
  FrmAdminUserView.Show;
  FrmAdminViewOrder.Hide;
end;

procedure TFrmAdminViewOrder.BtnManageStaffClick(Sender: TObject);
begin // view all staff
  frmadminstaffview.Show;
  FrmAdminViewOrder.Hide;
end;

procedure TFrmAdminViewOrder.BtnMinMaxClick(Sender: TObject);
begin
  DBGCustomer.DataSource := DMUsers.dscCustomerQuery;
  with DMUsers do
  begin
    qryCustomerQuery.Close;
    qryCustomerQuery.SQL.Text :=
      'SELECT [CUSTOMER CODE], [AMOUNT OWED] FROM CUSTOMER WHERE [AMOUNT OWED] = (SELECT MIN([AMOUNT OWED]) FROM CUSTOMER) OR [AMOUNT OWED] = (SELECT MAX([AMOUNT OWED]) FROM CUSTOMER)';
    qryCustomerQuery.Open;
  end;
end;

procedure TFrmAdminViewOrder.BtnNext2Click(Sender: TObject);
begin // view next record
  DMUsers.TblStaff.Next;
end;

procedure TFrmAdminViewOrder.BtnNextClick(Sender: TObject);
begin // view next record
  DMUsers.qryCustomerQuery.Next;
end;

procedure TFrmAdminViewOrder.BtnRefresh2Click(Sender: TObject);
begin // refresth the dbg
  with DMUsers.TblStaff do
  begin
    Filtered := FALSE;
  end;
end;

procedure TFrmAdminViewOrder.BtnRefreshClick(Sender: TObject);
begin // refresh the dbg
  DBGCustomer.DataSource := DMUsers.dscCustomerQuery;
  with DMUsers do
  begin
    qryCustomerQuery.Close;
    qryCustomerQuery.SQL.Text :=
      'SELECT NAME, SURNAME, [CUSTOMER CODE], [CELL NUMBER], EMAIL, [AMOUNT OWED], [CURRENT ORDERS] FROM CUSTOMER WHERE [CURRENT ORDERS] = TRUE';
    qryCustomerQuery.Open;
  end;
end;

procedure TFrmAdminViewOrder.BtnUnassignClick(Sender: TObject);
begin // sort by unassigned
  DBGCustomer.DataSource := DMUsers.dscCustomerQuery;
  with DMUsers do
  begin
    qryCustomerQuery.Close;
    qryCustomerQuery.SQL.Text :=
      'SELECT NAME, SURNAME, [CUSTOMER CODE], [CELL NUMBER], EMAIL, [AMOUNT OWED], [CURRENT ORDERS] FROM CUSTOMER WHERE [CURRENT ORDERS] = TRUE AND [ASSIGNED STAFF ID] IS null';
    qryCustomerQuery.Open;
  end;
end;

procedure TFrmAdminViewOrder.BtnUnavailableClick(Sender: TObject);
begin // sort by unavailable
  with DMUsers.TblStaff do
  begin
    Filtered := FALSE;
    Filter := 'Available = False';
    Filtered := True;
  end;
end;

procedure TFrmAdminViewOrder.BtnAvailableClick(Sender: TObject);
begin // sort by available
  with DMUsers.TblStaff do
  begin
    Filtered := FALSE;
    Filter := 'Available = True';
    Filtered := True;
  end;
end;

procedure TFrmAdminViewOrder.FormCreate(Sender: TObject);
begin // initialising the form
  LblViewOrder.Font.Color := clWhite;
  LblTime.Font.Color := clWhite;
  TTime.Enabled := True;
  TTime.Interval := 1000;
  FrmAdminViewOrder.BorderStyle := bsnone;
  FrmAdminViewOrder.BorderIcons := [];
  FrmAdminViewOrder.Position := poScreenCenter;
  ImgViewOrder.Stretch := True;
  ImgViewOrder.Picture.LoadFromFile('BACKGROUNDS\VIEW ORDER.jpg');
  ImgViewOrder.Align := Alclient;
  LblAssignCustomer.Font.Color := clWhite;
  LblAssignStaff.Font.Color := clWhite;
  LblAssignStaffToOrders.Font.Color := clWhite;

  DBGCustomer.DataSource := DMUsers.dscCustomerQuery;
  with DMUsers do
  begin
    qryCustomerQuery.Close;
    qryCustomerQuery.SQL.Text :=
      'SELECT NAME, SURNAME, [CUSTOMER CODE], [CELL NUMBER], EMAIL, [AMOUNT OWED], [CURRENT ORDERS] FROM CUSTOMER WHERE [CURRENT ORDERS] = TRUE';
    qryCustomerQuery.Open;
  end;

  DBGStaff.DataSource := DMUsers.DscStaff;

  DMUsers.qryCustomerQuery.First;
  DMUsers.TblStaff.First;
  DMUsers.TblCustomer.First;

  CmbCustomer.Text := '';
  CmbStaff.Text := '';
  CmbStaff.Items.Clear;
  CmbCustomer.Items.Clear;
  while not DMUsers.TblStaff.Eof do
  begin
    if DMUsers.TblStaff['AVAILABLE'] = True then
    begin
      CmbStaff.Items.Add(DMUsers.TblStaff['NAME'] + ' ' + DMUsers.TblStaff
          ['SURNAME'] + '-' + DMUsers.TblStaff['STAFF ID']);
      DMUsers.TblStaff.Next;
    end
    else
    begin
      DMUsers.TblStaff.Next;
    end;
  end;

  while not DMUsers.TblCustomer.Eof do
  begin
    if (DMUsers.TblCustomer['CURRENT ORDERS'] = True) AND
      (DMUsers.TblCustomer['ASSIGNED STAFF ID'] = NULL) then
    begin
      CmbCustomer.Items.Add(DMUsers.TblCustomer['NAME']
          + ' ' + DMUsers.TblCustomer['SURNAME'] + '-' + DMUsers.TblCustomer
          ['CUSTOMER CODE']);
      DMUsers.TblCustomer.Next;
    end
    else
    begin
      DMUsers.TblCustomer.Next;
    end;
  end;

  BtnRefresh.Click;
  BtnRefresh2.Click;

end;

procedure TFrmAdminViewOrder.TTimeTimer(Sender: TObject);
begin // show current time
  LblTime.Caption := FormatDateTime('hh:nn:ss', Now);
end;

end.
