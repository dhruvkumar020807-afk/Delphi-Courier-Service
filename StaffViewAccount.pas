Unit StaffViewAccount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, StaffAccount, Help, DBUsers;

type
  TFrmStaffAccount = class(TForm)
    ImgAccount: TImage;
    LblName: TLabel;
    LblSurname: TLabel;
    LblID: TLabel;
    LblGender: TLabel;
    LblEmail: TLabel;
    LblCode: TLabel;
    LblPassword: TLabel;
    LblCellNum: TLabel;
    LblAccount: TLabel;
    LblTime: TLabel;
    BtnDone: TButton;
    BtnUndo: TButton;
    BtnEdit: TButton;
    EdtName: TEdit;
    EdtSurname: TEdit;
    EdtEmail: TEdit;
    EdtID: TEdit;
    EdtCellNumber: TEdit;
    EdtPassword: TEdit;
    EdtStaffID: TEdit;
    CmbGender: TComboBox;
    RgbOrders: TRadioButton;
    BtnHelp: TButton;
    BtnClose: TButton;
    BtnBack: TButton;
    BtnViewOrder: TButton;
    BtnDelete: TButton;
    TTimeCentre: TTimer;
    TTime: TTimer;
    LblLicense: TLabel;
    EdtLicense: TEdit;
    PnlOrder: TPanel;
    ChkShow: TCheckBox;
    BtnLogOut: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure TTimeTimer(Sender: TObject);
    procedure TTimeCentreTimer(Sender: TObject);
    procedure BtnHelpClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnBackClick(Sender: TObject);
    procedure BtnViewOrderClick(Sender: TObject);
    procedure ChkShowClick(Sender: TObject);
    procedure BtnUndoClick(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
    procedure BtnDoneClick(Sender: TObject);
    procedure BtnLogOutClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmStaffAccount: TFrmStaffAccount;
  ObjStaffAccount: TStaffAccount; // class to find the correct staff account
  ObjHelp: THelp; // class for the help button
  ArrGender: array [0 .. 2] of string = ( // array for the cmb
    'Male',
    'Female',
    'Non-Binary'
  );

implementation

uses
  StaffViewOrder, StaffHub, StaffLogin;
{$R *.dfm}

procedure TFrmStaffAccount.BtnBackClick(Sender: TObject);
begin // to go back to the staff hub
  FrmStaffAccount.Hide;
  FrmStaffHub.Show;
end;

procedure TFrmStaffAccount.BtnCloseClick(Sender: TObject);
begin // closing the application
  Application.Terminate;
end;

procedure TFrmStaffAccount.BtnDeleteClick(Sender: TObject);
var
  sStaffID: string;
begin // confirming the deletion of the account
  if MessageDlg('Are you sure you would like to delete this account?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    sStaffID := FrmStaffLogin.sadminid;
    DMUsers.TblStaff.First;
    while not DMUsers.TblStaff.Eof do
    begin
      if DMUsers.TblStaff['STAFF ID'] = sStaffID then
      begin
        DMUsers.TblStaff.Delete;
        showmessage('Account Deleted');
        FrmStaffAccount.Hide;
        FrmStaffLogin.Show;
      end
      else
        DMUsers.TblStaff.Next;
    end;
  end
  else
    showmessage('Account Deletion Canceled');
end;

procedure TFrmStaffAccount.BtnDoneClick(Sender: TObject);
var
  SID: string;
begin // confirming changes to the account information
  BtnUndo.Hide;
  BtnDone.Hide;
  BtnEdit.Show;
  BtnDelete.Hide;
  CmbGender.Enabled := false;
  RgbOrders.Enabled := false;
  EdtName.ReadOnly := true;
  EdtPassword.ReadOnly := true;
  EdtSurname.ReadOnly := true;
  EdtEmail.ReadOnly := true;
  EdtID.ReadOnly := true;
  EdtCellNumber.ReadOnly := true;
  EdtStaffID.ReadOnly := true;
  EdtLicense.ReadOnly := true;
  if MessageDlg('Are you sure you want to save your changes?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
  begin
    SID := InputBox('Please confirm your Staff ID to make the changes',
      'This is to confirm your identity', '');
    DMUsers.TblStaff.First;
    while not DMUsers.TblStaff.Eof do
    begin
      if (SID = DMUsers.TblStaff['STAFF ID']) then
      begin
        DMUsers.TblStaff.Edit;
        DMUsers.TblStaff['NAME'] := EdtName.Text;
        DMUsers.TblStaff['SURNAME'] := EdtSurname.Text;
        DMUsers.TblStaff['ID NUMBER'] := EdtID.Text;
        DMUsers.TblStaff['EMAIL'] := EdtEmail.Text;
        DMUsers.TblStaff['CELL NUMBER'] := EdtCellNumber.Text;
        DMUsers.TblStaff['PASSWORD'] := EdtPassword.Text;
        DMUsers.TblStaff['GENDER'] := CmbGender.Text;
        DMUsers.TblStaff['LICENSE TYPE'] := EdtLicense.Text;
        DMUsers.TblStaff.Post;
        showmessage('EDITS SAVED SUCCESSFULLY');
        break;
      end
      else
      begin
        DMUsers.TblStaff.Next;
      end;
    end;
  end
  else
  begin
    showmessage('Changes have been canceled');
    exit;
  end;
end;

procedure TFrmStaffAccount.BtnEditClick(Sender: TObject);
begin // enabling the user to edit the account information
  BtnEdit.Hide;
  BtnDone.Show;
  BtnDelete.Show;
  BtnUndo.Show;
  CmbGender.Enabled := true;
  EdtName.ReadOnly := false;
  EdtPassword.ReadOnly := false;
  EdtSurname.ReadOnly := false;
  EdtEmail.ReadOnly := false;
  EdtCellNumber.ReadOnly := false;
  EdtStaffID.ReadOnly := false;
  ChkShow.Checked := true;
  EdtLicense.ReadOnly := false;
  EdtID.ReadOnly := false;
end;

procedure TFrmStaffAccount.BtnHelpClick(Sender: TObject);
begin // showing the help message
  ObjHelp.CustomerAccount;
end;

procedure TFrmStaffAccount.BtnLogOutClick(Sender: TObject);
begin
  if MessageDlg(
    'Are you sure you want to log out? you will need to log back in after.',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    FrmStaffAccount.Hide;
    FrmStaffLogin.Show;
  end
  else
  begin
    showmessage('Log Out procedure Cancelled');
  end;
end;

procedure TFrmStaffAccount.BtnUndoClick(Sender: TObject);
var
  bAvailable: boolean;
begin // remove any changes made by the user
  BtnUndo.Hide;
  BtnDone.Hide;
  BtnEdit.Show;
  BtnDelete.Hide;
  CmbGender.Enabled := false;
  RgbOrders.Enabled := false;
  EdtName.ReadOnly := true;
  EdtPassword.ReadOnly := true;
  EdtSurname.ReadOnly := true;
  EdtEmail.ReadOnly := true;
  EdtID.ReadOnly := true;
  EdtCellNumber.ReadOnly := true;
  EdtStaffID.ReadOnly := true;
  EdtLicense.ReadOnly := true;
  ObjStaffAccount := TStaffAccount.create(FrmStaffLogin.sadminid);
  EdtName.Text := ObjStaffAccount.getname;
  EdtSurname.Text := ObjStaffAccount.GetSurname;
  EdtEmail.Text := ObjStaffAccount.GetEmail;
  EdtID.Text := ObjStaffAccount.GetID;
  EdtCellNumber.Text := ObjStaffAccount.GetCell;
  EdtPassword.Text := ObjStaffAccount.GetPassword;
  EdtStaffID.Text := FrmStaffLogin.sadminid;
  EdtLicense.Text := ObjStaffAccount.GetLicenseType;
  bAvailable := ObjStaffAccount.GetAvailable;
  if bAvailable = true then
  begin
    RgbOrders.Checked := false;
    PnlOrder.Caption := 'There are no current orders';
    BtnViewOrder.Enabled := false;
  end
  else if bAvailable = false then
  begin
    RgbOrders.Checked := true;
    PnlOrder.Caption := 'Order for ' + ObjStaffAccount.GetOrder + ' ongoing';
    BtnViewOrder.Enabled := true;
  end;
end;

procedure TFrmStaffAccount.BtnViewOrderClick(Sender: TObject);
begin // view their current order if there is any
  if RgbOrders.Checked = true then
  begin
    FrmStaffAccount.Hide;
    FrmStaffViewOrder.Show;
  end
  else
  begin
    showmessage('You have no orders currently in progress.');
  end;
end;

procedure TFrmStaffAccount.ChkShowClick(Sender: TObject);
begin // to show the password in the edt
  if ChkShow.Checked = true then
  begin
    EdtPassword.PasswordChar := #0;
  end
  else
  begin
    EdtPassword.PasswordChar := '*';
  end;
end;

procedure TFrmStaffAccount.FormCreate(Sender: TObject);
var
  i: integer;
begin // intialising the form
  TTimeCentre.interval := 100;
  TTimeCentre.Enabled := true;
  FrmStaffAccount.BorderStyle := bsnone;
  FrmStaffAccount.BorderIcons := [];
  BtnUndo.Hide;
  BtnDone.Hide;
  LblTime.Font.Color := clWhite;
  TTime.interval := 1000;
  TTime.Enabled := true;
  CmbGender.Enabled := false;
  /// ////////////////////////
  CmbGender.Enabled := false;
  RgbOrders.Enabled := false;
  EdtName.ReadOnly := true;
  EdtPassword.ReadOnly := true;
  EdtSurname.ReadOnly := true;
  BtnDelete.Hide;
  EdtEmail.ReadOnly := true;
  EdtID.ReadOnly := true;
  EdtCellNumber.ReadOnly := true;
  EdtStaffID.ReadOnly := true;
  ImgAccount.Stretch := true;
  ImgAccount.Picture.LoadFromFile('BACKGROUNDS\ACCOUNT.jpg');
  ImgAccount.Align := Alclient;
  LblAccount.Font.Color := clWhite;
  LblName.Font.Color := clWhite;
  LblSurname.Font.Color := clWhite;
  LblID.Font.Color := clWhite;
  LblGender.Font.Color := clWhite;
  LblEmail.Font.Color := clWhite;
  PnlOrder.Font.Color := clWhite;
  LblCode.Font.Color := clWhite;
  LblCellNum.Font.Color := clWhite;
  LblLicense.Font.Color := clWhite;
  LblPassword.Font.Color := clWhite;
  for i := 0 to 2 do
  begin
    CmbGender.Items.Add(ArrGender[i]);
  end;

end;

procedure TFrmStaffAccount.FormShow(Sender: TObject);
var
  bAvailable: boolean;
  sgender: string;
  i: integer;
begin // initialising all the edts
  ObjStaffAccount := TStaffAccount.create(FrmStaffLogin.sadminid);
  EdtName.Text := ObjStaffAccount.getname;
  EdtSurname.Text := ObjStaffAccount.GetSurname;
  EdtEmail.Text := ObjStaffAccount.GetEmail;
  EdtID.Text := ObjStaffAccount.GetID;
  EdtCellNumber.Text := ObjStaffAccount.GetCell;
  EdtPassword.Text := ObjStaffAccount.GetPassword;
  EdtStaffID.Text := FrmStaffLogin.sadminid;
  EdtLicense.Text := ObjStaffAccount.GetLicenseType;
  bAvailable := ObjStaffAccount.GetAvailable;
  if bAvailable = true then
  begin
    RgbOrders.Checked := false;
    PnlOrder.Caption := 'There are no current orders';
    BtnViewOrder.Enabled := false;
  end
  else if bAvailable = false then
  begin
    RgbOrders.Checked := true;
    PnlOrder.Caption := 'Order for ' + ObjStaffAccount.GetOrder + ' ongoing';
    BtnViewOrder.Enabled := true;
  end;
  sgender := ObjStaffAccount.GetGender;
  if sgender = 'Male' then
  begin
    CmbGender.ItemIndex := 0;
  end;
  if sgender = 'Female' then
  begin
    CmbGender.ItemIndex := 1;
  end;
  if sgender = 'Non-Binary' then
  begin
    CmbGender.ItemIndex := 2;
  end;
end;

procedure TFrmStaffAccount.TTimeCentreTimer(Sender: TObject);
begin // centering the form
  FrmStaffAccount.Position := poScreenCenter;
  TTimeCentre.Enabled := false;
end;

procedure TFrmStaffAccount.TTimeTimer(Sender: TObject);
begin // showing the current time
  LblTime.Caption := FormatDateTime('hh:nn:ss', Now);
end;

end.
