unit CreateAccount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBUsers, Help;

type
  TFrmCreateCustomerAccount = class(TForm)
    ImgCreateAccount: TImage;
    LblCreate: TLabel;
    BtnBack: TButton;
    BtnClose: TButton;
    BtnHelp: TButton;
    EdtName: TEdit;
    EdtID: TEdit;
    EdtCell: TEdit;
    EdtEmail: TEdit;
    EdtConfirm: TEdit;
    CmbGender: TComboBox;
    LblName: TLabel;
    LblID: TLabel;
    LblCell: TLabel;
    LblEmail: TLabel;
    LbLPassword: TLabel;
    LblConfirm: TLabel;
    BtnGenerate: TButton;
    PnlCode: TPanel;
    BtnCreate: TButton;
    LblCheckName: TLabel;
    LblCheckID: TLabel;
    LblCheckCell: TLabel;
    LblCheckEmail: TLabel;
    LblCheckPass: TLabel;
    LblCheckConf: TLabel;
    LblCheckGender: TLabel;
    LblPassRules: TLabel;
    EdtPassword: TEdit;
    RbtShow1: TRadioButton;
    RbtnShow2: TRadioButton;
    LblTime: TLabel;
    TTime: TTimer;
    BtnReset: TButton;
    BtnHint: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnBackClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnGenerateClick(Sender: TObject);
    procedure BtnCreateClick(Sender: TObject);
    procedure RbtShow1Click(Sender: TObject);
    procedure RbtnShow2Click(Sender: TObject);
    procedure TTimeTimer(Sender: TObject);
    procedure BtnHelpClick(Sender: TObject);
    procedure BtnResetClick(Sender: TObject);
    procedure BtnHintClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function HasCapitalLetters(Sword: string): boolean;
    // checks for capital letters
    function HasNumber(Sword: string): boolean; // checks for numbers
  public
    { Public declarations }
  end;

var
  FrmCreateCustomerAccount: TFrmCreateCustomerAccount;
  scode: string;
  ObjHelp: THelp; // class for help button

implementation

uses CustomerLogin, UserType;
{$R *.dfm}

procedure TFrmCreateCustomerAccount.BtnBackClick(Sender: TObject);
begin
  FrmCreateCustomerAccount.Hide; // goes back to customer login
  FrmCustomerLogin.Show;
end;

procedure TFrmCreateCustomerAccount.BtnCloseClick(Sender: TObject);
begin
  Application.Terminate; // closes the application
end;

procedure TFrmCreateCustomerAccount.BtnCreateClick(Sender: TObject);
var
  senter, sname, ssur, semail, scell, sid, sgender, spass: string;
  ipos: integer;
begin // creates the acccount and adds it to the database
  senter := EdtName.Text;
  ipos := pos(' ', senter);
  sname := copy(senter, 1, ipos - 1);
  ssur := copy(senter, ipos + 1, length(senter));
  semail := EdtEmail.Text;
  scell := EdtCell.Text;
  sid := EdtID.Text;
  if CmbGender.ItemIndex = 0 then
  begin
    sgender := 'Male';
  end;
  if CmbGender.ItemIndex = 1 then
  begin
    sgender := 'Female';
  end;
  if CmbGender.ItemIndex = 2 then
  begin
    sgender := 'Non-Binary';
  end;
  spass := EdtConfirm.Text;
  DMUsers.TblCustomer.Append;
  DMUsers.TblCustomer['NAME'] := sname;
  DMUsers.TblCustomer['SURNAME'] := ssur;
  DMUsers.TblCustomer['ID NUMBER'] := sid;
  DMUsers.TblCustomer['EMAIL'] := semail;
  DMUsers.TblCustomer['CELL NUMBER'] := scell;
  DMUsers.TblCustomer['CUSTOMER CODE'] := scode;
  DMUsers.TblCustomer['PASSWORD'] := spass;
  DMUsers.TblCustomer['GENDER'] := sgender;
  DMUsers.TblCustomer['CURRENT ORDERS'] := false;
  DMUsers.TblCustomer['ASSIGNED STAFF ID'] := '-';
  DMUsers.TblCustomer.Post;
  ShowMessage('Account Succesfully created!');
  FrmCustomerLogin.Show;
  FrmCreateCustomerAccount.Hide;

end;

procedure TFrmCreateCustomerAccount.BtnHelpClick(Sender: TObject);
begin
  ObjHelp.CreateAccount; // displays the message for the help button
end;

procedure TFrmCreateCustomerAccount.BtnHintClick(Sender: TObject);
begin
  ShowMessage(
    'password must contain numbers, atleast 1 captial letters and be atleast 8 letters long');
end;

procedure TFrmCreateCustomerAccount.BtnResetClick(Sender: TObject);
begin // resets the information entered by user
  EdtName.Text := '';
  EdtID.Text := '';
  EdtCell.Text := '';
  EdtEmail.Text := '';
  EdtPassword.Text := '';
  EdtConfirm.Text := '';
  EdtPassword.PasswordChar := '*';
  EdtConfirm.PasswordChar := '*';
  CmbGender.Text := 'Choose your gender.';
end;

procedure TFrmCreateCustomerAccount.BtnGenerateClick(Sender: TObject);
var
  sname, ssur, sid, sent, scell, semail, spass: string;
  ipos: integer;
begin // checks if all information entered is correct and generates a unique customer code
  sent := EdtName.Text;
  sid := EdtID.Text;
  scell := EdtCell.Text;
  semail := EdtEmail.Text;

  if (pos(' ', EdtName.Text) = -1) or (EdtName.Text = '') then
  begin
    LblCheckName.Show;
    LblCheckName.Caption := ('Enter your full name and surname.');
    exit;
  end;
  if (length(sid) <> 13) or (sid = '') then
  begin
    LblCheckID.Show;
    LblCheckID.Caption := ('Enter your correct 13 Digit ID Number.');
    exit;
  end;
  if (length(scell) <> 10) and (copy(scell, 1, 1) <> '0') or (scell = '') then
  begin
    LblCheckCell.Show;
    LblCheckCell.Caption := (
      'Enter the correct 10 digit phone number eg: 012 345 6789');
    exit;
  end;
  if (copy(semail, length(semail) - 3, length(semail)) <> '.com') and
    (pos('@', semail) < 0) or (semail = '') then
  begin
    LblCheckEmail.Show;
    LblCheckEmail.Caption := ('Enter the correct email eg: someone@gmail.com');
    exit;
  end;
  if CmbGender.ItemIndex = -1 then
  begin
    LblCheckGender.Show;
    LblCheckGender.Caption := ('Select your gender.');
    exit;
  end;

  if (EdtPassword.Text = '') or (EdtConfirm.Text = '') then
  begin
    LblCheckConf.Show;
    LblCheckConf.Caption := 'Fill in the passwords';
    exit;
  end;

  spass := EdtPassword.Text;
  if not HasCapitalLetters(spass) then
  begin
    LblCheckPass.Show;
    LblCheckName.Caption := (
      'Please make sure your password has a Capital letters.');
    exit;
  end;
  if not HasNumber(spass) then
  begin
    LblPassRules.Hide;
    LblPassRules.Hide;
    LblCheckPass.Show;
    LblCheckName.Caption := ('Please make sure your password has a number');
    exit;
  end;
  if length(spass) < 8 then
  begin
    LblPassRules.Hide;
    LblCheckPass.Show;
    LblCheckName.Caption := (
      'Please make sure your password is atleast 8 characters long');
    exit;
  end;

  if (EdtPassword.Text <> EdtConfirm.Text) then
  begin
    LblCheckConf.Show;
    LblCheckConf.Caption := ('Passwords do not match');
    exit;
  end;
  PnlCode.Show;
  ipos := pos(' ', sent);
  sname := copy(sent, 1, ipos - 1);
  ssur := copy(sent, ipos + 1, length(sent));
  scode := uppercase(copy(sname, 1, 2)) + uppercase(copy(ssur, 1, 2))
    + '#' + copy(sid, length(sid) - 3, length(sid));
  PnlCode.Caption := scode;
  BtnCreate.Show;
end;

procedure TFrmCreateCustomerAccount.FormCreate(Sender: TObject);
begin // initialises the form
  FrmCreateCustomerAccount.BorderStyle := bsnone;
  FrmCreateCustomerAccount.BorderIcons := [];
  FrmCreateCustomerAccount.Position := poScreenCenter;
  ImgCreateAccount.Stretch := true;
  ImgCreateAccount.Picture.LoadFromFile('BACKGROUNDS/CREATE.jpg');
  ImgCreateAccount.Align := Alclient;
  LblCreate.Font.Color := clWhite;
  EdtName.Text := '';
  EdtID.Text := '';
  EdtCell.Text := '';
  EdtEmail.Text := '';
  EdtPassword.Text := '';
  EdtConfirm.Text := '';
  EdtPassword.PasswordChar := '*';
  EdtConfirm.PasswordChar := '*';
  PnlCode.Color := clWhite;
  PnlCode.Caption := '';
  PnlCode.Hide;
  BtnCreate.Hide;
  LblCheckName.Caption := '';
  LblCheckID.Caption := '';
  LblCheckCell.Caption := '';
  LblCheckEmail.Caption := '';
  LblCheckPass.Caption := '';
  LblCheckConf.Caption := '';
  LblCheckGender.Caption := '';
  LblPassRules.Caption := '';
  LblPassRules.Font.Color := clWhite;
  LblCheckName.Font.Color := clRed;
  LblCheckID.Font.Color := clRed;
  LblCheckCell.Font.Color := clRed;
  LblCheckEmail.Font.Color := clRed;
  LblCheckPass.Font.Color := clRed;
  LblCheckConf.Font.Color := clRed;
  LblCheckGender.Font.Color := clRed;
  LblPassRules.Show;
  LblCheckName.Hide;
  LblCheckID.Hide;
  LblCheckCell.Hide;
  LblCheckEmail.Hide;
  LblCheckPass.Hide;
  LblCheckConf.Hide;
  LblCheckGender.Hide;
  LblTime.Font.Color := clWhite;
  TTime.Enabled := true;

end;

procedure TFrmCreateCustomerAccount.FormShow(Sender: TObject);
begin
  CmbGender.Text := 'SELECT YOUR GENDER';
end;

function TFrmCreateCustomerAccount.HasCapitalLetters(Sword: string): boolean;
var
  I: integer;
begin // checks for capital letters
  Result := false;
  for I := 1 to length(Sword) do
  begin
    if (Sword[I] >= 'A') and (Sword[I] <= 'Z') then
    begin
      Result := true;
      exit;
    end;
  end;
end;

function TFrmCreateCustomerAccount.HasNumber(Sword: string): boolean;
var
  I: integer;
begin // checks for numbers
  Result := false;
  for I := 1 to length(Sword) do
  begin
    if CharInSet(Sword[I], ['0' .. '9']) then
    begin
      Result := true;
      exit;
    end;
  end;
end;

procedure TFrmCreateCustomerAccount.RbtnShow2Click(Sender: TObject);
begin // shows the password on the edt
  if RbtnShow2.Checked = true then
  begin
    EdtConfirm.PasswordChar := #0;
  end;
  if RbtnShow2.Checked = false then
  begin
    EdtConfirm.PasswordChar := '*';
  end;
end;

procedure TFrmCreateCustomerAccount.RbtShow1Click(Sender: TObject);
begin // shows the password on the edt
  if RbtShow1.Checked = true then
  begin
    EdtPassword.PasswordChar := #0;
  end;
  if RbtShow1.Checked = false then
  begin
    EdtPassword.PasswordChar := '*';
  end;
end;

procedure TFrmCreateCustomerAccount.TTimeTimer(Sender: TObject);
begin // shows the current time
  LblTime.Caption := FormatDateTime('hh:nn:ss', Now);
end;

end.
