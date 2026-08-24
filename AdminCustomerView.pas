unit AdminCustomerView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBUsers, Grids, DBGrids, DB, ADODB, Help;

type
  TFrmAdminUserView = class(TForm)
    ImgAdminUser: TImage;
    LblUserView: TLabel;
    LblTime: TLabel;
    BtnClose: TButton;
    BtnHelp: TButton;
    TTime: TTimer;
    DBGUsers: TDBGrid;
    BtnFirst: TButton;
    BtnBefore: TButton;
    BtnNext: TButton;
    BtnLast: TButton;
    BtnSortAlphabetically: TButton;
    BtnSortOrders: TButton;
    CmbSortGender: TComboBox;
    LblName: TLabel;
    LblSurname: TLabel;
    LblID: TLabel;
    LblCellNumber: TLabel;
    LblEmail: TLabel;
    LblPassword: TLabel;
    LblCustomerCode: TLabel;
    BtnBack: TButton;
    EdtName: TEdit;
    EdtSurname: TEdit;
    EdtEmail: TEdit;
    EdtCellNumber: TEdit;
    EdtID: TEdit;
    EdtPassword: TEdit;
    EdtCustomerCode: TEdit;
    RgpOrders: TRadioGroup;
    CmbGenderInfo: TComboBox;
    BtnEdit: TButton;
    BtnDone: TButton;
    BtnUndo: TButton;
    btnRefresh: TButton;
    BtnViewOrder: TButton;
    CmbSearch: TComboBox;
    BtnDelete: TButton;
    BtnSortNameDESC: TButton;
    Button1: TButton;
    procedure BtnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TTimeTimer(Sender: TObject);
    procedure BtnSortAlphabeticallyClick(Sender: TObject);
    procedure BtnFirstClick(Sender: TObject);
    procedure BtnNextClick(Sender: TObject);
    procedure BtnBeforeClick(Sender: TObject);
    procedure BtnLastClick(Sender: TObject);
    procedure BtnSortOrdersClick(Sender: TObject);
    procedure CmbSortGenderChange(Sender: TObject);
    procedure BtnBackClick(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure BtnUndoClick(Sender: TObject);
    procedure BtnDoneClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure BtnViewOrderClick(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
    procedure CmbSearchChange(Sender: TObject);
    procedure BtnSortNameDESCClick(Sender: TObject);
    procedure BtnHelpClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FrmAdminUserView: TFrmAdminUserView;
  ObjHelp: THelp; // class for the help button
  ArrSearch: array [0 .. 6] of string = ( // array for searching options
    'Name',
    'Surname',
    'Customer Code',
    'Email',
    'Cell Number',
    'Password',
    'ID Number'
  );
  ArrGender: array [0 .. 3] of string = ( // array for gender cmb
    'Male',
    'Female',
    'Non-Binary',
    'All'
  );

implementation

uses
  AdminHub, AdminViewOrder;
{$R *.dfm}

procedure TFrmAdminUserView.BtnBackClick(Sender: TObject);
begin // to go back to the admin hub
  FrmAdminUserView.Hide;
  FrmAdminHub.Show;
end;

procedure TFrmAdminUserView.BtnBeforeClick(Sender: TObject);
var
  sname, ssur, semail, scell, sid, spassword, scode, sgender: string;
  border: boolean;
begin // to show the prior record
  DBGUsers.DataSource := DMUsers.DscCustomer;
  DMUsers.TblCustomer.Prior;
  DBGUsers.DataSource := DMUsers.DscCustomer;
  sname := DMUsers.TblCustomer['NAME'];
  ssur := DMUsers.TblCustomer['SURNAME'];
  semail := DMUsers.TblCustomer['EMAIL'];
  scell := DMUsers.TblCustomer['CELL NUMBER'];
  sid := DMUsers.TblCustomer['ID NUMBER'];
  spassword := DMUsers.TblCustomer['PASSWORD'];
  scode := DMUsers.TblCustomer['CUSTOMER CODE'];
  sgender := DMUsers.TblCustomer['GENDER'];
  border := DMUsers.TblCustomer['CURRENT ORDERS'];
  EdtName.Text := sname;
  EdtSurname.Text := ssur;
  EdtEmail.Text := semail;
  EdtCellNumber.Text := scell;
  EdtID.Text := sid;
  EdtPassword.Text := spassword;
  EdtCustomerCode.Text := scode;
  if sgender = 'Male' then
  begin
    CmbGenderInfo.ItemIndex := 0;
  end;
  if sgender = 'Female' then
  begin
    CmbGenderInfo.ItemIndex := 1;
  end;
  if sgender = 'Non-Binary' then
  begin
    CmbGenderInfo.ItemIndex := 2;
  end;
  if border = true then
  begin
    RgpOrders.ItemIndex := 0;
  end;
  if border = false then
  begin
    RgpOrders.ItemIndex := 1;
  end;

end;

procedure TFrmAdminUserView.BtnCloseClick(Sender: TObject);
begin // to close the application
  Application.Terminate;
end;

procedure TFrmAdminUserView.BtnDeleteClick(Sender: TObject);
begin // deletion of user records
  if MessageDlg('Are you sure you would like to delete this users records?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DBGUsers.DataSource := DMUsers.dscCustomerQuery;
    with DMUsers do
    begin
      qryCustomerQuery.Close;
      qryCustomerQuery.SQL.Text :=
        'DELETE FROM CUSTOMER WHERE [CUSTOMER CODE] = :Code';
      qryCustomerQuery.Parameters.ParamByName('Code').Value :=
        EdtCustomerCode.Text;
      qryCustomerQuery.ExecSQL;
      showmessage('account successfully deleted');
      BtnDelete.Hide;
      BtnDone.Hide;
      BtnUndo.Hide;
      BtnEdit.Show;
      btnRefresh.Click;
      BtnFirst.Click;
    end;
  end
  else
    showmessage('Deletion canceled');
end;

procedure TFrmAdminUserView.BtnDoneClick(Sender: TObject);
var
  sname, ssur, semail, scell, sid, spassword, scode, sgender: string;
  border: boolean;
begin // completion of changes made to the users information
  if MessageDlg('Are you sure you want to save your changes?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
  begin
    DBGUsers.DataSource := DMUsers.DscCustomer;
    BtnDone.Hide;
    BtnUndo.Hide;
    BtnDelete.Hide;
    EdtName.Enabled := false;
    EdtSurname.Enabled := false;
    EdtEmail.Enabled := false;
    EdtCellNumber.Enabled := false;
    EdtID.Enabled := false;
    EdtPassword.Enabled := false;
    EdtCustomerCode.Enabled := false;
    CmbGenderInfo.Enabled := false;
    RgpOrders.Enabled := false;
    BtnEdit.Show;
    sname := EdtName.Text;
    ssur := EdtSurname.Text;
    semail := EdtEmail.Text;
    scell := EdtCellNumber.Text;
    sid := EdtID.Text;
    spassword := EdtPassword.Text;
    scode := EdtCustomerCode.Text;
    sgender := CmbGenderInfo.Text;
    if RgpOrders.ItemIndex = 0 then
    begin
      border := true;
    end;
    if RgpOrders.ItemIndex = 1 then
    begin
      border := false;
    end;
    DMUsers.TblCustomer.Edit;
    DMUsers.TblCustomer['NAME'] := sname;
    DMUsers.TblCustomer['SURNAME'] := ssur;
    DMUsers.TblCustomer['ID NUMBER'] := sid;
    DMUsers.TblCustomer['EMAIL'] := semail;
    DMUsers.TblCustomer['CELL NUMBER'] := scell;
    DMUsers.TblCustomer['CUSTOMER CODE'] := scode;
    DMUsers.TblCustomer['PASSWORD'] := spassword;
    DMUsers.TblCustomer['GENDER'] := sgender;
    DMUsers.TblCustomer['CURRENT ORDERS'] := border;
  end
  else
  begin
    showmessage('Edits have been completed.');
  end;
end;

procedure TFrmAdminUserView.BtnEditClick(Sender: TObject);
begin // enabling the user to edit the customers information
  EdtName.Enabled := true;
  EdtSurname.Enabled := true;
  EdtEmail.Enabled := true;
  EdtCellNumber.Enabled := true;
  EdtID.Enabled := true;
  EdtPassword.Enabled := true;
  EdtCustomerCode.Enabled := true;
  CmbGenderInfo.Enabled := true;
  BtnDone.Show;
  BtnUndo.Show;
  BtnEdit.Hide;
  BtnDelete.Show;
end;

procedure TFrmAdminUserView.BtnFirstClick(Sender: TObject);
var
  sname, ssur, semail, scell, sid, spassword, scode, sgender: string;
  border: boolean;
begin // to show the first record
  DBGUsers.DataSource := DMUsers.DscCustomer;
  DMUsers.TblCustomer.First;

  DBGUsers.DataSource := DMUsers.DscCustomer;
  sname := DMUsers.TblCustomer['NAME'];
  ssur := DMUsers.TblCustomer['SURNAME'];
  semail := DMUsers.TblCustomer['EMAIL'];
  scell := DMUsers.TblCustomer['CELL NUMBER'];
  sid := DMUsers.TblCustomer['ID NUMBER'];
  spassword := DMUsers.TblCustomer['PASSWORD'];
  scode := DMUsers.TblCustomer['CUSTOMER CODE'];
  sgender := DMUsers.TblCustomer['GENDER'];
  border := DMUsers.TblCustomer['CURRENT ORDERS'];
  EdtName.Text := sname;
  EdtSurname.Text := ssur;
  EdtEmail.Text := semail;
  EdtCellNumber.Text := scell;
  EdtID.Text := sid;
  EdtPassword.Text := spassword;
  EdtCustomerCode.Text := scode;
  if sgender = 'Male' then
  begin
    CmbGenderInfo.ItemIndex := 0;
  end;
  if sgender = 'Female' then
  begin
    CmbGenderInfo.ItemIndex := 1;
  end;
  if sgender = 'Non-Binary' then
  begin
    CmbGenderInfo.ItemIndex := 2;
  end;
  if border = true then
  begin
    RgpOrders.ItemIndex := 0;
  end;
  if border = false then
  begin
    RgpOrders.ItemIndex := 1;
  end;

end;

procedure TFrmAdminUserView.BtnHelpClick(Sender: TObject);
begin // to show the help message
  ObjHelp.UserView;
end;

procedure TFrmAdminUserView.BtnLastClick(Sender: TObject);
var
  sname, ssur, semail, scell, sid, spassword, scode, sgender: string;
  border: boolean;
begin // to show the last record
  DBGUsers.DataSource := DMUsers.DscCustomer;
  DMUsers.TblCustomer.Last;
  DBGUsers.DataSource := DMUsers.DscCustomer;
  sname := DMUsers.TblCustomer['NAME'];
  ssur := DMUsers.TblCustomer['SURNAME'];
  semail := DMUsers.TblCustomer['EMAIL'];
  scell := DMUsers.TblCustomer['CELL NUMBER'];
  sid := DMUsers.TblCustomer['ID NUMBER'];
  spassword := DMUsers.TblCustomer['PASSWORD'];
  scode := DMUsers.TblCustomer['CUSTOMER CODE'];
  sgender := DMUsers.TblCustomer['GENDER'];
  border := DMUsers.TblCustomer['CURRENT ORDERS'];
  EdtName.Text := sname;
  EdtSurname.Text := ssur;
  EdtEmail.Text := semail;
  EdtCellNumber.Text := scell;
  EdtID.Text := sid;
  EdtPassword.Text := spassword;
  EdtCustomerCode.Text := scode;
  if sgender = 'Male' then
  begin
    CmbGenderInfo.ItemIndex := 0;
  end;
  if sgender = 'Female' then
  begin
    CmbGenderInfo.ItemIndex := 1;
  end;
  if sgender = 'Non-Binary' then
  begin
    CmbGenderInfo.ItemIndex := 2;
  end;
  if border = true then
  begin
    RgpOrders.ItemIndex := 0;
  end;
  if border = false then
  begin
    RgpOrders.ItemIndex := 1;
  end;

end;

procedure TFrmAdminUserView.BtnNextClick(Sender: TObject);
var
  sname, ssur, semail, scell, sid, spassword, scode, sgender: string;
  border: boolean;
begin // to show the next record
  DBGUsers.DataSource := DMUsers.DscCustomer;
  DMUsers.TblCustomer.Next;
  DBGUsers.DataSource := DMUsers.DscCustomer;
  sname := DMUsers.TblCustomer['NAME'];
  ssur := DMUsers.TblCustomer['SURNAME'];
  semail := DMUsers.TblCustomer['EMAIL'];
  scell := DMUsers.TblCustomer['CELL NUMBER'];
  sid := DMUsers.TblCustomer['ID NUMBER'];
  spassword := DMUsers.TblCustomer['PASSWORD'];
  scode := DMUsers.TblCustomer['CUSTOMER CODE'];
  sgender := DMUsers.TblCustomer['GENDER'];
  border := DMUsers.TblCustomer['CURRENT ORDERS'];
  EdtName.Text := sname;
  EdtSurname.Text := ssur;
  EdtEmail.Text := semail;
  EdtCellNumber.Text := scell;
  EdtID.Text := sid;
  EdtPassword.Text := spassword;
  EdtCustomerCode.Text := scode;
  if sgender = 'Male' then
  begin
    CmbGenderInfo.ItemIndex := 0;
  end;
  if sgender = 'Female' then
  begin
    CmbGenderInfo.ItemIndex := 1;
  end;
  if sgender = 'Non-Binary' then
  begin
    CmbGenderInfo.ItemIndex := 2;
  end;
  if border = true then
  begin
    RgpOrders.ItemIndex := 0;
  end;
  if border = false then
  begin
    RgpOrders.ItemIndex := 1;
  end;

end;

procedure TFrmAdminUserView.btnRefreshClick(Sender: TObject);
begin // refresh the form
  DBGUsers.DataSource := DMUsers.dscCustomerQuery;
  with DMUsers do
  begin
    qryCustomerQuery.Close;
    qryCustomerQuery.SQL.Text := 'SELECT * FROM CUSTOMER';
    qryCustomerQuery.Open;
  end;
  EdtName.Text := '';
  EdtSurname.Text := '';
  EdtEmail.Text := '';
  EdtCellNumber.Text := '';
  EdtID.Text := '';
  EdtPassword.Text := '';
  EdtCustomerCode.Text := '';
  EdtName.Enabled := false;
  EdtSurname.Enabled := false;
  EdtEmail.Enabled := false;
  EdtCellNumber.Enabled := false;
  EdtID.Enabled := false;
  EdtPassword.Enabled := false;
  EdtCustomerCode.Enabled := false;
  CmbGenderInfo.Enabled := false;
  RgpOrders.Enabled := false;
  CmbSortGender.ItemIndex := -1;
  CmbSearch.ItemIndex := -1;
  CmbSortGender.Text := 'GENDER';
  CmbSearch.Text := 'SEARCH BY:';
  BtnSortNameDESC.Hide;
  BtnSortAlphabetically.Show;
end;

procedure TFrmAdminUserView.BtnSortAlphabeticallyClick(Sender: TObject);
begin // sorting the dbg alphabetically
  DBGUsers.DataSource := DMUsers.dscCustomerQuery;
  with DMUsers do
  begin
    qryCustomerQuery.Close;
    qryCustomerQuery.SQL.Text := 'SELECT * FROM CUSTOMER ORDER BY NAME ASC';
    qryCustomerQuery.Open;
  end;
  BtnSortNameDESC.Show;
  BtnSortAlphabetically.Hide;
end;

procedure TFrmAdminUserView.BtnSortOrdersClick(Sender: TObject);
begin // showing records with current orders
  DBGUsers.DataSource := DMUsers.dscCustomerQuery;
  with DMUsers do
  begin
    qryCustomerQuery.Close;
    qryCustomerQuery.SQL.Text :=
      'SELECT NAME, SURNAME, GENDER, [CURRENT ORDERS] FROM CUSTOMER WHERE [CURRENT ORDERS] = TRUE';
    qryCustomerQuery.Open;
  end;
end;

procedure TFrmAdminUserView.BtnUndoClick(Sender: TObject);
var
  sname, ssur, semail, scell, sid, spassword, scode, sgender: string;
  border: boolean;
begin // canceling any changes made
  if MessageDlg(
    'Are you sure you want to undo your changes? All changes will be lost.',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DBGUsers.DataSource := DMUsers.DscCustomer;
    sname := DMUsers.TblCustomer['NAME'];
    ssur := DMUsers.TblCustomer['SURNAME'];
    semail := DMUsers.TblCustomer['EMAIL'];
    scell := DMUsers.TblCustomer['CELL NUMBER'];
    sid := DMUsers.TblCustomer['ID NUMBER'];
    spassword := DMUsers.TblCustomer['PASSWORD'];
    scode := DMUsers.TblCustomer['CUSTOMER CODE'];
    sgender := DMUsers.TblCustomer['GENDER'];
    border := DMUsers.TblCustomer['CURRENT ORDERS'];
    EdtName.Text := sname;
    EdtSurname.Text := ssur;
    EdtEmail.Text := semail;
    EdtCellNumber.Text := scell;
    EdtID.Text := sid;
    EdtPassword.Text := spassword;
    EdtCustomerCode.Text := scode;
    if sgender = 'Male' then
    begin
      CmbGenderInfo.ItemIndex := 0;
    end;
    if sgender = 'Female' then
    begin
      CmbGenderInfo.ItemIndex := 1;
    end;
    if sgender = 'Non-Binary' then
    begin
      CmbGenderInfo.ItemIndex := 2;
    end;
    if border = true then
    begin
      RgpOrders.ItemIndex := 0;
    end;
    if border = false then
    begin
      RgpOrders.ItemIndex := 1;
    end;
    EdtName.Enabled := false;
    EdtSurname.Enabled := false;
    EdtEmail.Enabled := false;
    EdtCellNumber.Enabled := false;
    EdtID.Enabled := false;
    EdtPassword.Enabled := false;
    EdtCustomerCode.Enabled := false;
    CmbGenderInfo.Enabled := false;
    RgpOrders.Enabled := false;
    BtnDone.Hide;
    BtnUndo.Hide;
    BtnEdit.Show;
  end
  else
    showmessage('Undo Cancelled');
end;

procedure TFrmAdminUserView.BtnViewOrderClick(Sender: TObject);
begin // view all the orders
  FrmAdminUserView.Hide;
  FrmAdminViewOrder.Show;
end;

procedure TFrmAdminUserView.Button1Click(Sender: TObject);
begin
  DBGUsers.DataSource := DMUsers.dscCustomerQuery;
  with DMUsers do
  begin
    qryCustomerQuery.Close;
    qryCustomerQuery.SQL.Text :=
      'SELECT ROUND(SUM([AMOUNT OWED]), 3) AS [TOTAL AMOUNT DUE], COUNT(*) AS [TOTAL CUSTOMERS] FROM CUSTOMER';
    qryCustomerQuery.Open;
  end;
end;

procedure TFrmAdminUserView.BtnSortNameDESCClick(Sender: TObject);
begin // sorting the records by the names alphabetically
  DBGUsers.DataSource := DMUsers.dscCustomerQuery;
  with DMUsers do
  begin
    qryCustomerQuery.Close;
    qryCustomerQuery.SQL.Text := 'SELECT * FROM CUSTOMER ORDER BY NAME DESC';
    qryCustomerQuery.Open;
  end;
  BtnSortNameDESC.Hide;
  BtnSortAlphabetically.Show;
end;

procedure TFrmAdminUserView.CmbSearchChange(Sender: TObject);
// 0 = Name
// 1 = Surname
// 2 = Customer Code
// 3 = Email
// 4 = Cell Number
// 5 = Password
// 6 = ID Number
var
  sSearched: string;
begin // searching
  if CmbSearch.ItemIndex = 0 then
  begin
    sSearched := InputBox('Enter Name',
      'Enter the Name of the user  you would like to search.', '');
    DBGUsers.DataSource := DMUsers.dscCustomerQuery;
    with DMUsers do
    begin
      qryCustomerQuery.Close;
      qryCustomerQuery.SQL.Text :=
        'SELECT * FROM CUSTOMER WHERE NAME = sSearchedName';
      qryCustomerQuery.Parameters.ParamByName('sSearchedName').Value :=
        sSearched;
      qryCustomerQuery.Open;
    end;
  end;

  if CmbSearch.ItemIndex = 1 then
  begin
    sSearched := InputBox('Enter Surname',
      'Enter the Surname of the user you would like to search.', '');
    DBGUsers.DataSource := DMUsers.dscCustomerQuery;
    with DMUsers do
    begin
      qryCustomerQuery.Close;
      qryCustomerQuery.SQL.Text :=
        'SELECT * FROM CUSTOMER WHERE SURNAME = sSearchedSurname';
      qryCustomerQuery.Parameters.ParamByName('sSearchedSurname')
        .Value := sSearched;
      qryCustomerQuery.Open;
    end;
  end;

  if CmbSearch.ItemIndex = 2 then
  begin
    sSearched := InputBox('Enter Customer Code',
      'Enter the Customer Code of the user  you would like to search.', '');
    DBGUsers.DataSource := DMUsers.dscCustomerQuery;
    with DMUsers do
    begin
      qryCustomerQuery.Close;
      qryCustomerQuery.SQL.Text :=
        'SELECT * FROM CUSTOMER WHERE [CUSTOMER CODE] = sSearchedCustomerCode';
      qryCustomerQuery.Parameters.ParamByName('sSearchedCustomerCode')
        .Value := sSearched;
      qryCustomerQuery.Open;
    end;
  end;

  if CmbSearch.ItemIndex = 3 then
  begin
    sSearched := InputBox('Enter Email',
      'Enter the Email of the user you would like to search.', '');
    DBGUsers.DataSource := DMUsers.dscCustomerQuery;
    with DMUsers do
    begin
      qryCustomerQuery.Close;
      qryCustomerQuery.SQL.Text :=
        'SELECT * FROM CUSTOMER WHERE EMAIL = sSearchedEmail';
      qryCustomerQuery.Parameters.ParamByName('sSearchedEmail')
        .Value := sSearched;
      qryCustomerQuery.Open;
    end;
  end;

  if CmbSearch.ItemIndex = 4 then
  begin
    sSearched := InputBox('Enter Cell Number',
      'Enter the Cell Number of the user you would like to search.', '');
    DBGUsers.DataSource := DMUsers.dscCustomerQuery;
    with DMUsers do
    begin
      qryCustomerQuery.Close;
      qryCustomerQuery.SQL.Text :=
        'SELECT * FROM CUSTOMER WHERE [CELL NUMBER] = sSearcedCellNumber';
      qryCustomerQuery.Parameters.ParamByName('sSearcedCellNumber')
        .Value := sSearched;
      qryCustomerQuery.Open;
    end;
  end;

  if CmbSearch.ItemIndex = 5 then
  begin
    sSearched := InputBox('Enter Password',
      'Enter the Password of the user you would like to search.', '');
    DBGUsers.DataSource := DMUsers.dscCustomerQuery;
    with DMUsers do
    begin
      qryCustomerQuery.Close;
      qryCustomerQuery.SQL.Text :=
        'SELECT * FROM CUSTOMER WHERE PASSWORD = sSearchedPassword';
      qryCustomerQuery.Parameters.ParamByName('sSearchedPassword')
        .Value := sSearched;
      qryCustomerQuery.Open;
    end;
  end;
  if CmbSearch.ItemIndex = 6 then
  begin
    sSearched := InputBox('Enter ID Number',
      'Enter the ID Number of the user you would like to search.', '');
    DBGUsers.DataSource := DMUsers.dscCustomerQuery;
    with DMUsers do
    begin
      qryCustomerQuery.Close;
      qryCustomerQuery.SQL.Text :=
        'SELECT * FROM CUSTOMER WHERE [ID NUMBER] = sSearchedIDNumber';
      qryCustomerQuery.Parameters.ParamByName('sSearchedIDNumber')
        .Value := sSearched;
      qryCustomerQuery.Open;
    end;
  end;
end;

procedure TFrmAdminUserView.CmbSortGenderChange(Sender: TObject);
// Male = 0
// Female = 1
// Non-Binary = 2
// All = 3
begin // sorting according to gender
  DBGUsers.DataSource := DMUsers.dscCustomerQuery;
  if CmbSortGender.ItemIndex = 0 then
  begin
    with DMUsers do
    begin
      qryCustomerQuery.Close;
      qryCustomerQuery.SQL.Text :=
        'SELECT NAME, SURNAME, GENDER FROM CUSTOMER WHERE GENDER = ''Male''';
      qryCustomerQuery.Open;
    end;
  end;

  if CmbSortGender.ItemIndex = 1 then
  begin
    with DMUsers do
    begin
      qryCustomerQuery.Close;
      qryCustomerQuery.SQL.Text :=
        'SELECT NAME, SURNAME, GENDER FROM CUSTOMER WHERE GENDER = ''Female''';
      qryCustomerQuery.Open;
    end;
  end;

  if CmbSortGender.ItemIndex = 2 then
  begin
    with DMUsers do
    begin
      qryCustomerQuery.Close;
      qryCustomerQuery.SQL.Text :=
        'SELECT NAME, SURNAME, GENDER FROM CUSTOMER WHERE GENDER = ''Non-Binary''';
      qryCustomerQuery.Open;
    end;
  end;

  if CmbSortGender.ItemIndex = 3 then
  begin
    with DMUsers do
    begin
      qryCustomerQuery.Close;
      qryCustomerQuery.SQL.Text := 'SELECT NAME, SURNAME, GENDER FROM CUSTOMER';
      qryCustomerQuery.Open;
    end;
  end;

end;

procedure TFrmAdminUserView.FormCreate(Sender: TObject);
var
  i, j: integer;
begin // initialing the form
  FrmAdminUserView.BorderStyle := bsnone;
  FrmAdminUserView.BorderIcons := [];
  FrmAdminUserView.Position := poScreenCenter;
  ImgAdminUser.Stretch := true;
  ImgAdminUser.Picture.LoadFromFile('BACKGROUNDS\USERVIEW.jpg');
  ImgAdminUser.Align := Alclient;
  LblTime.Font.Color := clWhite;
  LblUserView.Font.Color := clWhite;
  TTime.Interval := 1000;
  TTime.Enabled := true;
  DBGUsers.DataSource := DMUsers.DscCustomer;
  DMUsers.TblCustomer.First;
  EdtName.Text := '';
  EdtSurname.Text := '';
  EdtEmail.Text := '';
  EdtCellNumber.Text := '';
  EdtID.Text := '';
  EdtPassword.Text := '';
  EdtCustomerCode.Text := '';
  EdtName.Enabled := false;
  EdtSurname.Enabled := false;
  EdtEmail.Enabled := false;
  EdtCellNumber.Enabled := false;
  EdtID.Enabled := false;
  EdtPassword.Enabled := false;
  EdtCustomerCode.Enabled := false;
  CmbGenderInfo.Enabled := false;
  RgpOrders.Enabled := false;
  BtnDone.Hide;
  BtnUndo.Hide;
  LblName.Font.Color := clWhite;
  LblSurname.Font.Color := clWhite;
  LblEmail.Font.Color := clWhite;
  LblID.Font.Color := clWhite;
  LblCellNumber.Font.Color := clWhite;
  LblPassword.Font.Color := clWhite;
  LblCustomerCode.Font.Color := clWhite;
  RgpOrders.Font.Color := clWhite;
  BtnDelete.Hide;
  for i := low(ArrSearch) to High(ArrSearch) do
  begin
    CmbSearch.Items.Add(ArrSearch[i]);
  end;

  for j := low(ArrGender) to High(ArrGender) do
  begin
    CmbSortGender.Items.Add(ArrGender[j]);
  end;

  BtnFirst.Click;
end;

procedure TFrmAdminUserView.FormShow(Sender: TObject);
begin
  BtnFirst.Click;
end;

procedure TFrmAdminUserView.TTimeTimer(Sender: TObject);
begin // showing the current time
  LblTime.Caption := FormatDateTime('hh:nn:ss', Now);
end;

end.
