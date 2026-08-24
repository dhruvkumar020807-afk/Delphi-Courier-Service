unit AdminStaffView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, DBUsers, Help;

type
  TFrmAdminStaffView = class(TForm)
    ImgAdminUser: TImage;
    LblUserView: TLabel;
    LblTime: TLabel;
    LblName: TLabel;
    LblSurname: TLabel;
    LblID: TLabel;
    LblCellNumber: TLabel;
    LblEmail: TLabel;
    LblPassword: TLabel;
    LblStafffID: TLabel;
    BtnClose: TButton;
    BtnHelp: TButton;
    DBGUsers: TDBGrid;
    BtnFirst: TButton;
    BtnBefore: TButton;
    BtnNext: TButton;
    BtnLast: TButton;
    BtnSortAlphabetically: TButton;
    BtnSortOrders: TButton;
    CmbSortGender: TComboBox;
    BtnBack: TButton;
    EdtName: TEdit;
    EdtSurname: TEdit;
    EdtEmail: TEdit;
    EdtCellNumber: TEdit;
    EdtID: TEdit;
    EdtPassword: TEdit;
    EdtStaffID: TEdit;
    RgpOrders: TRadioGroup;
    CmbGenderInfo: TComboBox;
    BtnEdit: TButton;
    BtnDone: TButton;
    BtnUndo: TButton;
    btnRefresh: TButton;
    BtnViewOrder: TButton;
    CmbSearch: TComboBox;
    BtnDelete: TButton;
    TTime: TTimer;
    BtnSortNameDESC: TButton;
    Image1: TImage;
    BtnInfo: TButton;
    Button1: TButton;
    procedure BtnCloseClick(Sender: TObject);
    procedure TTimeTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnBackClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure BtnFirstClick(Sender: TObject);
    procedure BtnBeforeClick(Sender: TObject);
    procedure BtnNextClick(Sender: TObject);
    procedure BtnLastClick(Sender: TObject);
    procedure BtnSortNameDESCClick(Sender: TObject);
    procedure BtnSortAlphabeticallyClick(Sender: TObject);
    procedure CmbSortGenderChange(Sender: TObject);
    procedure CmbSearchChange(Sender: TObject);
    procedure BtnSortOrdersClick(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
    procedure BtnUndoClick(Sender: TObject);
    procedure BtnDoneClick(Sender: TObject);
    procedure BtnHelpClick(Sender: TObject);
    procedure BtnInfoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAdminStaffView: TFrmAdminStaffView;
  ObjHelp: THelp; // class for the help button
  ArrSearch: array [0 .. 8] of string = ( // array for the searching options
    'Name',
    'Surname',
    'Staff ID',
    'Email',
    'Cell Number',
    'Password',
    'ID Number',
    'Hours Greater Than',
    'Hours Less Than'
  );
  ArrGender: array [0 .. 3] of string = ( // array for the genders cmb
    'Male',
    'Female',
    'Non-Binary',
    'All'
  );

implementation

uses
  AdminHub;
{$R *.dfm}

procedure TFrmAdminStaffView.BtnBackClick(Sender: TObject);
begin // go back to the admin hub
  FrmAdminStaffView.Hide;
  FrmAdminHub.Show;
end;

procedure TFrmAdminStaffView.BtnBeforeClick(Sender: TObject);
var
  sname, ssur, semail, scell, sid, spassword, ssid, sgender: string;
  borderassigned: boolean;
begin // show the prior record
  DBGUsers.DataSource := DMUsers.DscStaff;
  DMUsers.TblStaff.Prior;
  BtnEdit.Show;
  DBGUsers.DataSource := DMUsers.DscStaff;
  sname := DMUsers.TblStaff['NAME'];
  ssur := DMUsers.TblStaff['SURNAME'];
  semail := DMUsers.TblStaff['EMAIL'];
  scell := DMUsers.TblStaff['CELL NUMBER'];
  sid := DMUsers.TblStaff['ID NUMBER'];
  spassword := DMUsers.TblStaff['PASSWORD'];
  ssid := DMUsers.TblStaff['STAFF ID'];
  sgender := DMUsers.TblStaff['GENDER'];
  EdtName.Text := sname;
  EdtSurname.Text := ssur;
  EdtEmail.Text := semail;
  EdtCellNumber.Text := scell;
  EdtID.Text := sid;
  EdtPassword.Text := spassword;
  EdtStaffID.Text := ssid;
  if borderassigned = true then
  begin
    RgpOrders.ItemIndex := 0;
    BtnViewOrder.Show;
  end;
  if borderassigned = false then
  begin
    RgpOrders.ItemIndex := 1;
  end;
end;

procedure TFrmAdminStaffView.BtnCloseClick(Sender: TObject);
begin // closing the application
  Application.Terminate;
end;

procedure TFrmAdminStaffView.BtnDeleteClick(Sender: TObject);
begin // confirming the deletion of the users records
  if MessageDlg('Are you sure you would like to delete this users records?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DBGUsers.DataSource := DMUsers.DscStaff;
    with DMUsers do
    begin
      qryStaffQuery.Close;
      qryStaffQuery.SQL.Text := 'DELETE FROM STAFF WHERE [STAFF ID] = :Code';
      qryStaffQuery.Parameters.ParamByName('Code').Value := EdtStaffID.Text;
      qryStaffQuery.ExecSQL;
      showmessage('account succesfully deleted');
      BtnEdit.Show;
      BtnDone.Hide;
      BtnUndo.Hide;
      BtnDelete.Hide;
    end;
  end
  else
    showmessage('Deletion canceled');
end;

procedure TFrmAdminStaffView.BtnDoneClick(Sender: TObject);
var
  sname, ssur, semail, scell, sid, spassword, ssid, sgender: string;
  borderassigned: boolean;
begin // confirming all changes made to the users records and posting it to the database
  if MessageDlg('Are you sure you want to save your changes?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
  begin
    sname := EdtName.Text;
    ssur := EdtSurname.Text;
    semail := EdtEmail.Text;
    scell := EdtCellNumber.Text;
    sid := EdtID.Text;
    spassword := EdtPassword.Text;
    ssid := EdtStaffID.Text;
    sgender := CmbGenderInfo.Text;
    if RgpOrders.ItemIndex = 0 then
    begin
      borderassigned := true;
    end;
    if RgpOrders.ItemIndex = 1 then
    begin
      borderassigned := false;
    end;

    DMUsers.TblStaff.Edit;
    DMUsers.TblStaff['NAME'] := sname;
    DMUsers.TblStaff['SURNAME'] := ssur;
    DMUsers.TblStaff['EMAIL'] := semail;
    DMUsers.TblStaff['CELL NUMBER'] := scell;
    DMUsers.TblStaff['ID NUMBER'] := sid;
    DMUsers.TblStaff['PASSWORD'] := spassword;
    DMUsers.TblStaff['STAFF ID'] := ssid;
    DMUsers.TblStaff['GENDER'] := sgender;
    DMUsers.TblStaff['CURRENTLY ASSIGNED ORDER'] := borderassigned;
    DMUsers.TblStaff.Post;
    btnRefresh.Click;
  end
  else
  begin
    showmessage('Edit canceled');
    BtnUndo.Click;
    btnRefresh.Click;
  end;
end;

procedure TFrmAdminStaffView.BtnEditClick(Sender: TObject);
begin // enabling the user to make changes
  EdtName.Enabled := true;
  EdtSurname.Enabled := true;
  EdtEmail.Enabled := true;
  EdtCellNumber.Enabled := true;
  EdtID.Enabled := true;
  EdtPassword.Enabled := true;
  EdtStaffID.Enabled := true;
  CmbGenderInfo.Enabled := true;
  BtnEdit.Hide;
  BtnDone.Show;
  BtnUndo.Show;
  BtnDelete.Show;
end;

procedure TFrmAdminStaffView.BtnFirstClick(Sender: TObject);
var
  sname, ssur, semail, scell, sid, spassword, ssid, sgender: string;
  borderassigned: boolean;
begin // first record
  DBGUsers.DataSource := DMUsers.DscStaff;
  DMUsers.TblStaff.First;
  BtnEdit.Show;
  DBGUsers.DataSource := DMUsers.DscStaff;
  sname := DMUsers.TblStaff['NAME'];
  ssur := DMUsers.TblStaff['SURNAME'];
  semail := DMUsers.TblStaff['EMAIL'];
  scell := DMUsers.TblStaff['CELL NUMBER'];
  sid := DMUsers.TblStaff['ID NUMBER'];
  spassword := DMUsers.TblStaff['PASSWORD'];
  ssid := DMUsers.TblStaff['STAFF ID'];
  sgender := DMUsers.TblStaff['GENDER'];
  borderassigned := DMUsers.TblStaff['CURRENTLY ASSIGNED ORDER'];
  EdtName.Text := sname;
  EdtSurname.Text := ssur;
  EdtEmail.Text := semail;
  EdtCellNumber.Text := scell;
  EdtID.Text := sid;
  EdtPassword.Text := spassword;
  EdtStaffID.Text := ssid;
  if borderassigned = true then
  begin
    RgpOrders.ItemIndex := 0;
    BtnViewOrder.Show;
  end;
  if borderassigned = false then
  begin
    RgpOrders.ItemIndex := 1;
  end;
end;

procedure TFrmAdminStaffView.BtnHelpClick(Sender: TObject);
begin // show the help message
  ObjHelp.UserView;
end;

procedure TFrmAdminStaffView.BtnLastClick(Sender: TObject);
var
  sname, ssur, semail, scell, sid, spassword, ssid, sgender: string;
  borderassigned: boolean;
begin // go to the last record
  DBGUsers.DataSource := DMUsers.DscStaff;
  DMUsers.TblStaff.Last;
  BtnEdit.Show;
  DBGUsers.DataSource := DMUsers.DscStaff;
  sname := DMUsers.TblStaff['NAME'];
  ssur := DMUsers.TblStaff['SURNAME'];
  semail := DMUsers.TblStaff['EMAIL'];
  scell := DMUsers.TblStaff['CELL NUMBER'];
  sid := DMUsers.TblStaff['ID NUMBER'];
  spassword := DMUsers.TblStaff['PASSWORD'];
  ssid := DMUsers.TblStaff['STAFF ID'];
  sgender := DMUsers.TblStaff['GENDER'];
  borderassigned := DMUsers.TblStaff['CURRENTLY ASSIGNED ORDER'];
  EdtName.Text := sname;
  EdtSurname.Text := ssur;
  EdtEmail.Text := semail;
  EdtCellNumber.Text := scell;
  EdtID.Text := sid;
  EdtPassword.Text := spassword;
  EdtStaffID.Text := ssid;
  if borderassigned = true then
  begin
    RgpOrders.ItemIndex := 0;
    BtnViewOrder.Show;
  end;
  if borderassigned = false then
  begin
    RgpOrders.ItemIndex := 1;
  end;
end;

procedure TFrmAdminStaffView.BtnNextClick(Sender: TObject);
var
  sname, ssur, semail, scell, sid, spassword, ssid, sgender: string;
  borderassigned: boolean;
begin // show the next record
  DBGUsers.DataSource := DMUsers.DscStaff;
  DMUsers.TblStaff.Next;
  BtnEdit.Show;
  DBGUsers.DataSource := DMUsers.DscStaff;
  sname := DMUsers.TblStaff['NAME'];
  ssur := DMUsers.TblStaff['SURNAME'];
  semail := DMUsers.TblStaff['EMAIL'];
  scell := DMUsers.TblStaff['CELL NUMBER'];
  sid := DMUsers.TblStaff['ID NUMBER'];
  spassword := DMUsers.TblStaff['PASSWORD'];
  ssid := DMUsers.TblStaff['STAFF ID'];
  sgender := DMUsers.TblStaff['GENDER'];
  borderassigned := DMUsers.TblStaff['CURRENTLY ASSIGNED ORDER'];
  EdtName.Text := sname;
  EdtSurname.Text := ssur;
  EdtEmail.Text := semail;
  EdtCellNumber.Text := scell;
  EdtID.Text := sid;
  EdtPassword.Text := spassword;
  EdtStaffID.Text := ssid;
  if borderassigned = true then
  begin
    RgpOrders.ItemIndex := 0;
    BtnViewOrder.Show;
  end;
  if borderassigned = false then
  begin
    RgpOrders.ItemIndex := 1;
  end;
end;

procedure TFrmAdminStaffView.btnRefreshClick(Sender: TObject);
begin // refresh the form
  DBGUsers.DataSource := DMUsers.dscStaffQuery;
  with DMUsers do
  begin
    qryStaffQuery.Close;
    qryStaffQuery.SQL.Text := 'SELECT * FROM STAFF';
    qryStaffQuery.Open;
  end;
  EdtName.Text := '';
  EdtSurname.Text := '';
  EdtEmail.Text := '';
  EdtCellNumber.Text := '';
  EdtID.Text := '';
  EdtPassword.Text := '';
  EdtStaffID.Text := '';
  EdtName.Enabled := false;
  EdtSurname.Enabled := false;
  EdtEmail.Enabled := false;
  EdtCellNumber.Enabled := false;
  EdtID.Enabled := false;
  EdtPassword.Enabled := false;
  EdtStaffID.Enabled := false;
  CmbGenderInfo.Enabled := false;
  RgpOrders.Enabled := false;
  CmbSortGender.ItemIndex := -1;
  CmbSearch.ItemIndex := -1;
  CmbSortGender.Text := 'GENDER';
  CmbSearch.Text := 'SEARCH BY:';
  BtnSortNameDESC.Hide;
  BtnSortAlphabetically.Show;
  BtnFirst.Click;
end;

procedure TFrmAdminStaffView.BtnSortAlphabeticallyClick(Sender: TObject);
begin // sort the database alphabetically
  DBGUsers.DataSource := DMUsers.dscStaffQuery;
  with DMUsers do
  begin
    qryStaffQuery.Close;
    qryStaffQuery.SQL.Text := 'SELECT * FROM STAFF ORDER BY NAME ASC';
    qryStaffQuery.Open;
  end;
  BtnSortNameDESC.Show;
  BtnSortAlphabetically.Hide;
end;

procedure TFrmAdminStaffView.BtnSortNameDESCClick(Sender: TObject);
begin // sort the database alphabetically
  DBGUsers.DataSource := DMUsers.dscStaffQuery;
  with DMUsers do
  begin
    qryStaffQuery.Close;
    qryStaffQuery.SQL.Text := 'SELECT * FROM STAFF ORDER BY NAME DESC';
    qryStaffQuery.Open;
  end;
  BtnSortNameDESC.Hide;
  BtnSortAlphabetically.Show;
end;

procedure TFrmAdminStaffView.BtnSortOrdersClick(Sender: TObject);
begin // sort the database according to current orders
  DBGUsers.DataSource := DMUsers.dscStaffQuery;
  with DMUsers do
  begin
    qryStaffQuery.Close;
    qryStaffQuery.SQL.Text :=
      'SELECT NAME, SURNAME, GENDER, [CURRENTLY ASSIGNED ORDER] FROM STAFF WHERE [CURRENTLY ASSIGNED ORDER] = TRUE';
    qryStaffQuery.Open;
  end;
end;

procedure TFrmAdminStaffView.BtnUndoClick(Sender: TObject);
var
  sname, ssur, semail, scell, sid, spassword, ssid, sgender: string;
  borderassigned: boolean;
begin // cancel all changes made by the user
  BtnEdit.Show;
  BtnUndo.Hide;
  BtnDone.Hide;
  BtnDelete.Hide;
  DBGUsers.DataSource := DMUsers.DscStaff;
  sname := DMUsers.TblStaff['NAME'];
  ssur := DMUsers.TblStaff['SURNAME'];
  semail := DMUsers.TblStaff['EMAIL'];
  scell := DMUsers.TblStaff['CELL NUMBER'];
  sid := DMUsers.TblStaff['ID NUMBER'];
  spassword := DMUsers.TblStaff['PASSWORD'];
  ssid := DMUsers.TblStaff['STAFF ID'];
  sgender := DMUsers.TblStaff['GENDER'];
  borderassigned := DMUsers.TblStaff['CURRENTLY ASSIGNED ORDER'];
  EdtName.Text := sname;
  EdtSurname.Text := ssur;
  EdtEmail.Text := semail;
  EdtCellNumber.Text := scell;
  EdtID.Text := sid;
  EdtPassword.Text := spassword;
  EdtStaffID.Text := ssid;
  if borderassigned = true then
  begin
    RgpOrders.ItemIndex := 0;
    BtnViewOrder.Show;
  end;
  if borderassigned = false then
  begin
    RgpOrders.ItemIndex := 1;
  end;

  EdtName.Enabled := false;
  EdtSurname.Enabled := false;
  EdtEmail.Enabled := false;
  EdtCellNumber.Enabled := false;
  EdtID.Enabled := false;
  EdtPassword.Enabled := false;
  EdtStaffID.Enabled := false;
  CmbGenderInfo.Enabled := false;
  RgpOrders.Enabled := false;
end;

procedure TFrmAdminStaffView.Button1Click(Sender: TObject);
var
  sname, ssurname, semail, spassword, slicense, scell, sid, sgender,
    sstaffid: string;
begin
  // Name
  repeat
    sname := InputBox('Enter Name',
      'Enter the first name of the new staff member', '');
    if sname = '' then
      Exit; // Cancel pressed
    if Trim(sname) = '' then
    begin
      showmessage('First name cannot be empty!');
    end;
  until Trim(sname) <> '';

  // Surname
  repeat
    ssurname := InputBox('Enter Surname',
      'Enter the last name of the new staff member', '');
    if ssurname = '' then
      Exit; // Cancel pressed
    if Trim(ssurname) = '' then
    begin
      showmessage('Surname cannot be empty!');
    end;
  until Trim(ssurname) <> '';

  // Email
  repeat
    semail := InputBox('Enter Email',
      'Enter the email of the new staff member', '');
    if semail = '' then
      Exit; // Cancel pressed
    if (Pos('@', semail) = 0) or (Pos('.', semail) = 0) or
      (Pos('@', semail) > Pos('.', semail)) or (Length(semail) < 5) then
    begin
      showmessage('Invalid email format! Example: name@email.com');
      semail := '';
    end;
  until semail <> '';

  // Password
  repeat
    spassword := InputBox('Enter Password',
      'Enter a password for the new staff member', '');
    if spassword = '' then
      Exit; // Cancel pressed
    if Length(spassword) < 8 then
    begin
      showmessage('Password must be at least 8 characters long!');
    end;
  until Length(spassword) >= 8;

  // License
  repeat
    slicense := UpperCase(InputBox('Enter License Type: A, B, C',
        'Enter the license type of the new staff member', ''));
    if slicense = '' then
      Exit; // Cancel pressed
    if not((slicense = 'A') or (slicense = 'B') or (slicense = 'C')) then
    begin
      showmessage('License type must be A, B, or C');
    end;
  until (slicense = 'A') or (slicense = 'B') or (slicense = 'C');

  // Cell Number
  repeat
    scell := InputBox('Enter 10-digit cell number',
      'Enter the cell number of the new staff member', '');
    if scell = '' then
      Exit; // Cancel pressed
    if (Length(scell) <> 10) or (Copy(scell, 1, 1) <> '0') then
    begin
      showmessage
        ('Invalid Cell Number. It must be 10 digits and start with 0.');
    end;
  until (Length(scell) = 10) and (Copy(scell, 1, 1) = '0');

  // ID Number
  repeat
    sid := InputBox('Enter 13-digit ID number',
      'Enter the id number of the new staff member', '');
    if sid = '' then
      Exit; // Cancel pressed
    if (Length(sid) <> 13) then
      showmessage('ID number must be exactly 13 digits');
  until (Length(sid) = 13);

  // Gender
  repeat
    sgender := UpperCase(InputBox('Enter Gender: Male, Female, Non-Binary',
        'Enter the gender of the new staff member', ''));
    if sgender = '' then
      Exit; // Cancel pressed
    if not((sgender = 'MALE') or (sgender = 'FEMALE') or
        (sgender = 'NON-BINARY')) then
    begin
      showmessage('Gender must be Male, Female, or Non-Binary');
    end;
  until (sgender = 'MALE') or (sgender = 'FEMALE') or (sgender = 'NON-BINARY');

  randomize;
  sstaffid := IntToStr(Random(9000) + 1000);

  DMUsers.TblStaff.Append;
  DMUsers.TblStaff['STAFF ID'] := sstaffid;
  DMUsers.TblStaff['NAME'] := sname;
  DMUsers.TblStaff['SURNAME'] := ssurname;
  DMUsers.TblStaff['EMAIL'] := semail;
  DMUsers.TblStaff['PASSWORD'] := spassword;
  DMUsers.TblStaff['LICENSE TYPE'] := slicense;
  DMUsers.TblStaff['CELL NUMBER'] := scell;
  DMUsers.TblStaff['ID NUMBER'] := sid;
  DMUsers.TblStaff['AVAILABLE'] := true;
  DMUsers.TblStaff['GENDER'] := sgender;
  DMUsers.TblStaff['CURRENT ORDER'] := '-';
  DMUsers.TblStaff.Post;

  showmessage(sname + ' ' + ssurname +
      '`s account has been created succesfully');

  btnRefresh.Click;

end;

procedure TFrmAdminStaffView.BtnInfoClick(Sender: TObject);
begin
  DBGUsers.DataSource := DMUsers.dscCustomerQuery;
  with DMUsers do
  begin
    qryCustomerQuery.Close;
    qryCustomerQuery.SQL.Text :=
      'SELECT CUSTOMER.[NAME] AS [CUSTOMER NAME], CUSTOMER.[SURNAME] AS [CUSTOMER SURNAME], STAFF.[NAME] AS [STAFF NAME], STAFF.[SURNAME] AS [STAFF SURNAME] FROM CUSTOMER, STAFF WHERE CUSTOMER.[ASSIGNED STAFF ID] = STAFF.[STAFF ID]';
    qryCustomerQuery.Open;
  end;
end;

procedure TFrmAdminStaffView.CmbSearchChange(Sender: TObject);
// 0 = Name
// 1 = Surname
// 2 = Staff ID
// 3 = Email
// 4 = Cell Number
// 5 = Password
// 6 = ID Number
// 7 = Hours Greater Than
// 8 = Hours Less Than
var
  ssearched: string;
begin // searching
  DBGUsers.DataSource := DMUsers.dscStaffQuery;

  if CmbSearch.ItemIndex = 0 then
  begin
    ssearched := InputBox('Enter Name',
      'Enter the Name of the user  you would like to search.', '');
    with DMUsers do
    begin
      qryStaffQuery.Close;
      qryStaffQuery.SQL.Text :=
        'SELECT * FROM STAFF WHERE NAME = sSearchedName';
      qryStaffQuery.Parameters.ParamByName('sSearchedName').Value := ssearched;
      qryStaffQuery.Open;
    end;
  end;

  if CmbSearch.ItemIndex = 1 then
  begin
    ssearched := InputBox('Enter Surname',
      'Enter the Surname of the user  you would like to search.', '');
    with DMUsers do
    begin
      qryStaffQuery.Close;
      qryStaffQuery.SQL.Text :=
        'SELECT * FROM STAFF WHERE SURNAME = sSearchedName';
      qryStaffQuery.Parameters.ParamByName('sSearchedName').Value := ssearched;
      qryStaffQuery.Open;
    end;
  end;

  if CmbSearch.ItemIndex = 2 then
  begin
    ssearched := InputBox('Enter STAFF ID',
      'Enter the STAFF ID of the user you would like to search.', '');
    try
      with DMUsers do
      begin
        qryStaffQuery.Close;
        qryStaffQuery.SQL.Text :=
          'SELECT NAME, SURNAME, [STAFF ID] FROM STAFF WHERE [STAFF ID] = :sSearchedID';
        qryStaffQuery.Parameters.ParamByName('sSearchedID').Value := StrToInt
          (ssearched); // or StrToFloat if needed
        qryStaffQuery.Open;
      end;
    except
      on E: EConvertError do
        showmessage('Invalid STAFF ID. Please enter a valid number.');
    end;
  end;

  if CmbSearch.ItemIndex = 3 then
  begin
    ssearched := InputBox('Enter Email',
      'Enter the Email of the user  you would like to search.', '');
    with DMUsers do
    begin
      qryStaffQuery.Close;
      qryStaffQuery.SQL.Text :=
        'SELECT NAME, SURNAME, EMAIL FROM STAFF WHERE EMAIL = sSearchedName';
      qryStaffQuery.Parameters.ParamByName('sSearchedName').Value := ssearched;
      qryStaffQuery.Open;
    end;
  end;

  if CmbSearch.ItemIndex = 4 then
  begin
    ssearched := InputBox('Enter Cell Number',
      'Enter the Cell Number of the user  you would like to search.', '');
    with DMUsers do
    begin
      qryStaffQuery.Close;
      qryStaffQuery.SQL.Text :=
        'SELECT NAME, SURNAME, [CELL NUMBER] FROM STAFF WHERE [CELL NUMBER] = sSearchedName';
      qryStaffQuery.Parameters.ParamByName('sSearchedName').Value := ssearched;
      qryStaffQuery.Open;
    end;
  end;

  if CmbSearch.ItemIndex = 5 then
  begin
    ssearched := InputBox('Enter Password',
      'Enter the Password of the user  you would like to search.', '');
    with DMUsers do
    begin
      qryStaffQuery.Close;
      qryStaffQuery.SQL.Text :=
        'SELECT NAME, SURNAME, [STAFF ID], PASSWORD FROM STAFF WHERE PASSWORD = sSearchedName';
      qryStaffQuery.Parameters.ParamByName('sSearchedName').Value := ssearched;
      qryStaffQuery.Open;
    end;
  end;

  if CmbSearch.ItemIndex = 6 then
  begin
    ssearched := InputBox('Enter ID Number',
      'Enter the ID Number of the user  you would like to search.', '');
    with DMUsers do
    begin
      qryStaffQuery.Close;
      qryStaffQuery.SQL.Text :=
        'SELECT NAME, SURNAME, [ID NUMBER]  FROM STAFF WHERE [ID NUMBER] = sSearchedName';
      qryStaffQuery.Parameters.ParamByName('sSearchedName').Value := ssearched;
      qryStaffQuery.Open;
    end;
  end;

  if CmbSearch.ItemIndex = 7 then
  begin
    ssearched := InputBox('Enter Hours Worked',
      'Enter the number of hours worked greater than of the user you would like to search.', '');
    with DMUsers do
    begin
      qryStaffQuery.Close;
      qryStaffQuery.SQL.Text :=
        'SELECT NAME, SURNAME, [HOURS WORKED] FROM STAFF WHERE [HOURS WORKED] > sSearchedName';
      qryStaffQuery.Parameters.ParamByName('sSearchedName').Value := StrToInt
        (ssearched);
      qryStaffQuery.Open;
    end;
  end;

  if CmbSearch.ItemIndex = 8 then
  begin
    ssearched := InputBox('Enter Hours Worked',
      'Enter the number of hours worked greater than of the user you would like to search.', '');
    with DMUsers do
    begin
      qryStaffQuery.Close;
      qryStaffQuery.SQL.Text :=
        'SELECT NAME, SURNAME, [HOURS WORKED]  FROM STAFF WHERE [HOURS WORKED] < sSearchedName';
      qryStaffQuery.Parameters.ParamByName('sSearchedName').Value := StrToInt
        (ssearched);
      qryStaffQuery.Open;
    end;
  end;

end;

procedure TFrmAdminStaffView.CmbSortGenderChange(Sender: TObject);
begin // sort according to gender
  DBGUsers.DataSource := DMUsers.dscStaffQuery;
  if CmbSortGender.ItemIndex = 0 then
  begin
    with DMUsers do
    begin
      qryStaffQuery.Close;
      qryStaffQuery.SQL.Text :=
        'SELECT NAME, SURNAME, GENDER FROM STAFF WHERE GENDER = ''Male''';
      qryStaffQuery.Open;
    end;
  end;

  if CmbSortGender.ItemIndex = 1 then
  begin
    with DMUsers do
    begin
      qryStaffQuery.Close;
      qryStaffQuery.SQL.Text :=
        'SELECT NAME, SURNAME, GENDER FROM STAFF WHERE GENDER = ''Female''';
      qryStaffQuery.Open;
    end;
  end;

  if CmbSortGender.ItemIndex = 2 then
  begin
    with DMUsers do
    begin
      qryStaffQuery.Close;
      qryStaffQuery.SQL.Text :=
        'SELECT NAME, SURNAME, GENDER FROM STAFF WHERE GENDER = ''Non-Binary''';
      qryStaffQuery.Open;
    end;
  end;

  if CmbSortGender.ItemIndex = 3 then
  begin
    with DMUsers do
    begin
      qryStaffQuery.Close;
      qryStaffQuery.SQL.Text := 'SELECT NAME, SURNAME, GENDER FROM STAFF';
      qryStaffQuery.Open;
    end;
  end;

end;

procedure TFrmAdminStaffView.FormCreate(Sender: TObject);
var
  i, j: Integer;
begin // initialising the form
  LblUserView.Font.Color := clWhite;
  LblID.Font.Color := clWhite;
  LblCellNumber.Font.Color := clWhite;
  LblEmail.Font.Color := clWhite;
  LblPassword.Font.Color := clWhite;
  LblStafffID.Font.Color := clWhite;
  LblTime.Font.Color := clWhite;
  LblName.Font.Color := clWhite;
  LblSurname.Font.Color := clWhite;
  TTime.Interval := 1000;
  TTime.Enabled := true;
  BtnViewOrder.Hide;
  BtnDelete.Hide;
  BtnUndo.Hide;
  BtnEdit.Hide;
  BtnDone.Hide;

  FrmAdminStaffView.BorderStyle := bsnone;
  FrmAdminStaffView.BorderIcons := [];
  FrmAdminStaffView.Position := poScreenCenter;
  ImgAdminUser.Stretch := true;
  ImgAdminUser.Picture.LoadFromFile('BACKGROUNDS\USERVIEW.jpg');
  ImgAdminUser.Align := Alclient;

  DBGUsers.DataSource := DMUsers.dscStaffQuery;
  with DMUsers do
  begin
    qryStaffQuery.Close;
    qryStaffQuery.SQL.Text := 'SELECT * FROM STAFF';
    qryStaffQuery.Open;
  end;

  for i := low(ArrSearch) to High(ArrSearch) do
  begin
    CmbSearch.Items.Add(ArrSearch[i]);
  end;

  for j := low(ArrGender) to High(ArrGender) do
  begin
    CmbSortGender.Items.Add(ArrGender[j]);
  end;

  EdtName.Enabled := false;
  EdtSurname.Enabled := false;
  EdtEmail.Enabled := false;
  EdtCellNumber.Enabled := false;
  EdtID.Enabled := false;
  EdtPassword.Enabled := false;
  EdtStaffID.Enabled := false;
  CmbGenderInfo.Enabled := false;
  RgpOrders.Enabled := false;
end;

procedure TFrmAdminStaffView.TTimeTimer(Sender: TObject);
begin // showing the current time
  LblTime.Caption := FormatDateTime('hh:nn:ss', Now);
end;

end.
