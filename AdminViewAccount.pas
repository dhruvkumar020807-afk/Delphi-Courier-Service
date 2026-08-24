unit AdminViewAccount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Help, DBUsers, AdminAccount;

type
  TFrmAdminAccount = class(TForm)
    ImgAccount: TImage;
    LblName: TLabel;
    LblSurname: TLabel;
    LblEmail: TLabel;
    LblAdminID: TLabel;
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
    EdtCellNumber: TEdit;
    EdtPassword: TEdit;
    EdtAdminID: TEdit;
    BtnHelp: TButton;
    BtnClose: TButton;
    BtnBack: TButton;
    BtnDelete: TButton;
    ChkShow: TCheckBox;
    TTimeCentre: TTimer;
    TTime: TTimer;
    BtnLogOut: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ChkShowClick(Sender: TObject);
    procedure BtnBackClick(Sender: TObject);
    procedure BtnHelpClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnUndoClick(Sender: TObject);
    procedure BtnDoneClick(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
    procedure BtnLogOutClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAdminAccount: TFrmAdminAccount;
  ObjHelp: THelp; // class for the help button
  objAccount: TAdminAccount; // class to get the admnins info

implementation

uses
  AdminLogin, AdminHub;
{$R *.dfm}

procedure TFrmAdminAccount.BtnBackClick(Sender: TObject);
begin // goes back to the admin hub
  FrmAdminAccount.Hide;
  FrmAdminHub.Show;
end;

procedure TFrmAdminAccount.BtnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmAdminAccount.BtnDeleteClick(Sender: TObject);
var
  iAdminID: integer;
begin // confirming the deletion of the account
  if MessageDlg('Are you sure you would like to delete this account?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    iAdminID := FrmAdminLogin.iAdminID;
    DMUsers.TblAdmin.First;
    while not DMUsers.TblAdmin.Eof do
    begin
      if DMUsers.TblAdmin['ADMIM ID'] = iAdminID then
      begin
        DMUsers.TblAdmin.Delete;
        showmessage('Account Deleted');
        FrmAdminAccount.Hide;
        FrmAdminLogin.Show;
      end
      else
        DMUsers.TblAdmin.Next;
    end;
  end
  else
  begin
    showmessage('Account Deletion Canceled');
  end;
end;

procedure TFrmAdminAccount.BtnDoneClick(Sender: TObject);
var
  SID: string;
begin // confirming changes to the account information
  BtnUndo.Hide;
  BtnDone.Hide;
  BtnEdit.Show;
  BtnDelete.Hide;
  EdtName.ReadOnly := true;
  EdtPassword.ReadOnly := true;
  EdtSurname.ReadOnly := true;
  EdtEmail.ReadOnly := true;
  EdtCellNumber.ReadOnly := true;
  EdtAdminID.ReadOnly := true;
  if MessageDlg('Are you sure you want to save your changes?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
  begin
    SID := InputBox('Please confirm your Admin ID to make the changes',
      'This is to confirm your identity', '');
    DMUsers.TblAdmin.First;
    while not DMUsers.TblAdmin.Eof do
    begin
      if (SID = DMUsers.TblAdmin['ADMIN ID']) then
      begin
        DMUsers.TblAdmin.Edit;
        DMUsers.TblAdmin['NAME'] := EdtName.Text;
        DMUsers.TblAdmin['SURNAME'] := EdtSurname.Text;
        DMUsers.TblAdmin['ADMIN ID'] := SID;
        DMUsers.TblAdmin['EMAIL'] := EdtEmail.Text;
        DMUsers.TblAdmin['CELL NUMBER'] := EdtCellNumber.Text;
        DMUsers.TblAdmin['PASSWORD'] := EdtPassword.Text;
        DMUsers.TblAdmin.Post;
        showmessage('EDITS SAVED SUCCESSFULLY');
        break;
      end
      else
      begin
        DMUsers.TblAdmin.Next;
      end;
    end;
  end
  else
  begin
    showmessage('Changes have been canceled');
    exit;
  end;
end;

procedure TFrmAdminAccount.BtnEditClick(Sender: TObject);
begin // enables the user to edit their own details
  BtnEdit.Hide;
  BtnDone.Show;
  BtnDelete.Show;
  BtnUndo.Show;
  EdtName.ReadOnly := false;
  EdtPassword.ReadOnly := false;
  EdtSurname.ReadOnly := false;
  EdtEmail.ReadOnly := false;
  EdtCellNumber.ReadOnly := false;
  EdtAdminID.ReadOnly := false;
  ChkShow.Checked := true;
end;

procedure TFrmAdminAccount.BtnHelpClick(Sender: TObject);
begin
  ObjHelp.CustomerAccount;
end;

procedure TFrmAdminAccount.BtnLogOutClick(Sender: TObject);
begin
  if MessageDlg(
    'Are you sure you want to log out? you will need to log back in after.',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    FrmAdminAccount.Hide;
    FrmAdminLogin.Show;
  end
  else
  begin
    showmessage('Log Out procedure Cancelled');
  end;
end;

procedure TFrmAdminAccount.BtnUndoClick(Sender: TObject);
begin // undoes any changes made
  EdtName.ReadOnly := true;
  EdtPassword.ReadOnly := true;
  EdtSurname.ReadOnly := true;
  BtnDelete.Hide;
  EdtEmail.ReadOnly := true;
  EdtCellNumber.ReadOnly := true;
  EdtAdminID.ReadOnly := true;
  objAccount := TAdminAccount.create(FrmAdminLogin.iAdminID);
  EdtName.Text := objAccount.GetName;
  EdtSurname.Text := objAccount.GetSurname;
  EdtEmail.Text := objAccount.GetEmail;
  EdtCellNumber.Text := objAccount.GetCell;
  EdtPassword.Text := objAccount.GetPassword;
  EdtAdminID.Text := inttostr(FrmAdminLogin.iAdminID);
end;

procedure TFrmAdminAccount.ChkShowClick(Sender: TObject);
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

procedure TFrmAdminAccount.FormCreate(Sender: TObject);
var
  i: integer;
begin // intialising the form
  TTimeCentre.interval := 100;
  TTimeCentre.Enabled := true;
  FrmAdminAccount.BorderStyle := bsnone;
  FrmAdminAccount.BorderIcons := [];
  BtnUndo.Hide;
  BtnDone.Hide;
  LblTime.Font.Color := clWhite;
  TTime.interval := 1000;
  TTime.Enabled := true;
  /// ////////////////////////
  EdtName.ReadOnly := true;
  EdtPassword.ReadOnly := true;
  EdtSurname.ReadOnly := true;
  BtnDelete.Hide;
  EdtEmail.ReadOnly := true;
  EdtCellNumber.ReadOnly := true;
  EdtAdminID.ReadOnly := true;
  ImgAccount.Stretch := true;
  ImgAccount.Picture.LoadFromFile('BACKGROUNDS\ACCOUNT.jpg');
  ImgAccount.Align := Alclient;
  LblAccount.Font.Color := clWhite;
  LblName.Font.Color := clWhite;
  LblSurname.Font.Color := clWhite;
  LblEmail.Font.Color := clWhite;
  LblAdminID.Font.Color := clWhite;
  LblCellNum.Font.Color := clWhite;
  LblPassword.Font.Color := clWhite;

end;

procedure TFrmAdminAccount.FormShow(Sender: TObject);
begin // initialising the edts
  objAccount := TAdminAccount.create(FrmAdminLogin.iAdminID);
  EdtName.Text := objAccount.GetName;
  EdtSurname.Text := objAccount.GetSurname;
  EdtEmail.Text := objAccount.GetEmail;
  EdtCellNumber.Text := objAccount.GetCell;
  EdtPassword.Text := objAccount.GetPassword;
  EdtAdminID.Text := inttostr(FrmAdminLogin.iAdminID);

end;

end.
