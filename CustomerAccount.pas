unit CustomerAccount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBUsers, FindAccount, Help;

type
  TFrmCustomerAccount = class(TForm)
    ImgAccount: TImage;
    LblAccount: TLabel;
    BtnClose: TButton;
    BtnHelp: TButton;
    BtnBack: TButton;
    LblName: TLabel;
    LblSurname: TLabel;
    LblID: TLabel;
    LblGender: TLabel;
    LblEmail: TLabel;
    LblCode: TLabel;
    LblPassword: TLabel;
    LblCellNum: TLabel;
    EdtName: TEdit;
    EdtSurname: TEdit;
    EdtEmail: TEdit;
    EdtID: TEdit;
    EdtCellNumber: TEdit;
    EdtPassword: TEdit;
    EdtCustomerCode: TEdit;
    CmbGender: TComboBox;
    RgbOrders: TRadioButton;
    BtnEdit: TButton;
    BtnUndo: TButton;
    BtnDone: TButton;
    TTimeCentre: TTimer;
    BtnViewOrder: TButton;
    BtnDelete: TButton;
    LblTime: TLabel;
    TTime: TTimer;
    BtnPackageDelivery: TButton;
    ChkShow: TCheckBox;
    BtnLogOut: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnBackClick(Sender: TObject);
    procedure CmbGenderChange(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure BtnUndoClick(Sender: TObject);
    procedure BtnDoneClick(Sender: TObject);
    procedure TTimeCentreTimer(Sender: TObject);
    procedure TTimeTimer(Sender: TObject);
    procedure BtnPackageDeliveryClick(Sender: TObject);
    procedure BtnViewOrderClick(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
    procedure BtnHelpClick(Sender: TObject);
    procedure ChkShowClick(Sender: TObject);
    procedure BtnLogOutClick(Sender: TObject);
  private
    { Private declarations }
  public { Public declarations }
    SExtractedCustomerCode: string;
  end;

var
  FrmCustomerAccount: TFrmCustomerAccount;
  ObjAccount: TAccount; // class to find account of customer
  ObjHelp: THelp; // class for help button

implementation

uses
  CustomerHub, CustomerLogin, CustomerReviews, PackageDelivery,
  CustomerViewOrder;
{$R *.dfm}

procedure TFrmCustomerAccount.BtnBackClick(Sender: TObject);
begin // goes back to customer hub
  FrmCustomerAccount.Hide;
  FrmCustomerHub.Show;
end;

procedure TFrmCustomerAccount.BtnCloseClick(Sender: TObject);
begin // asks for a review and closes application
  if MessageDlg('Would you like to leave a review?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
  begin
    FrmCustomerReviews.Show;
    FrmCustomerAccount.Hide;
  end
  else
  begin
    Application.Terminate;
  end;
end;

procedure TFrmCustomerAccount.BtnDeleteClick(Sender: TObject);
var
  scustomercode: string;
begin // deletion of the accoount
  if MessageDlg('Are you sure you would like to delete your account?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    BtnUndo.Hide;
    BtnDone.Hide;
    BtnDelete.Hide;
    BtnEdit.Show;
    CmbGender.Enabled := false;
    RgbOrders.Enabled := false;
    EdtName.ReadOnly := true;
    EdtPassword.ReadOnly := true;
    EdtSurname.ReadOnly := true;
    EdtEmail.ReadOnly := true;
    EdtID.ReadOnly := true;
    EdtCellNumber.ReadOnly := true;
    EdtCustomerCode.ReadOnly := true;
    EdtID.ReadOnly := true;
    scustomercode := FrmCustomerLogin.scustomercode;
    DMUsers.TblCustomer.First;
    while not DMUsers.TblCustomer.Eof do
    begin
      if DMUsers.TblCustomer['CUSTOMER CODE'] = scustomercode then
      begin
        DMUsers.TblCustomer.Delete;
        showmessage('Account Deleted');
        FrmCustomerAccount.Hide;
        FrmCustomerLogin.Show;
      end
      else
        DMUsers.TblCustomer.Next;
    end;
  end
  else
    showmessage('Account Deletion Canceled');
end;

procedure TFrmCustomerAccount.BtnDoneClick(Sender: TObject);
var
  SID: string;
begin // complete changes made by user and posts it to database
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
  EdtCustomerCode.ReadOnly := true;
  EdtID.ReadOnly := true;
  if MessageDlg('Are you sure you want to save your changes?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
  begin
    SID := InputBox('Please confirm your ID to make the changes',
      'This is to confirm your identity', '');
    DMUsers.TblCustomer.First;
    while not DMUsers.TblCustomer.Eof do
    begin
      if (SID = DMUsers.TblCustomer['ID NUMBER']) then
      begin
        DMUsers.TblCustomer.Edit;
        DMUsers.TblCustomer['NAME'] := EdtName.Text;
        DMUsers.TblCustomer['SURNAME'] := EdtSurname.Text;
        DMUsers.TblCustomer['ID NUMBER'] := SID;
        DMUsers.TblCustomer['EMAIL'] := EdtEmail.Text;
        DMUsers.TblCustomer['CELL NUMBER'] := EdtCellNumber.Text;
        DMUsers.TblCustomer['CUSTOMER CODE'] := EdtCustomerCode.Text;
        DMUsers.TblCustomer['PASSWORD'] := EdtPassword.Text;
        if RgbOrders.Checked = true then
        begin
          DMUsers.TblCustomer['CURRENT ORDERS'] := true;
        end;
        if RgbOrders.Checked = false then
        begin
          DMUsers.TblCustomer['CURRENT ORDERS'] := false;
        end;
        if CmbGender.ItemIndex = 0 then
        begin
          DMUsers.TblCustomer['GENDER'] := 'Male';
        end;
        if CmbGender.ItemIndex = 1 then
        begin
          DMUsers.TblCustomer['GENDER'] := 'Female';
        end;
        if CmbGender.ItemIndex = 2 then
        begin
          DMUsers.TblCustomer['GENDER'] := 'Non-Binary';
        end;
        DMUsers.TblCustomer.Post;
        showmessage('EDITS SAVED SUCCESSFULLY');
        break;
      end
      else
      begin
        DMUsers.TblCustomer.Next;
      end;
    end;
  end
  else
  begin
    showmessage('Changes have been canceled');
  end;
end;

procedure TFrmCustomerAccount.BtnEditClick(Sender: TObject);
begin // enables the user to edit their account info
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
  EdtCustomerCode.ReadOnly := false;
  EdtID.ReadOnly := false;
end;

procedure TFrmCustomerAccount.BtnHelpClick(Sender: TObject);
begin // shows the message for the help button
  ObjHelp.CustomerAccount;
end;

procedure TFrmCustomerAccount.BtnLogOutClick(Sender: TObject);
begin
  if MessageDlg(
    'Are you sure you want to log out? you will need to log back in after.',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    FrmCustomerAccount.Hide;
    FrmCustomerLogin.Show;
  end
  else
  begin
    showmessage('Log Out procedure Cancelled');
  end;
end;

procedure TFrmCustomerAccount.BtnPackageDeliveryClick(Sender: TObject);
begin // takes you to make a courier order
  if RgbOrders.Checked = false then
  begin
    FrmCustomerAccount.Hide;
    FrmPackageDelivery.Show;
  end
  else
  begin
    showmessage('You have an order currently in progress.');
  end;
end;

procedure TFrmCustomerAccount.BtnUndoClick(Sender: TObject);
var // cancels any changes made by the user
  sgender: string;
  borders: boolean;
begin
  BtnEdit.Show;
  BtnUndo.Hide;
  BtnDelete.Hide;
  BtnDone.Hide;
  CmbGender.Enabled := false;
  RgbOrders.Enabled := false;
  EdtName.ReadOnly := true;
  EdtPassword.ReadOnly := true;
  EdtSurname.ReadOnly := true;
  BtnDelete.Hide;
  EdtEmail.ReadOnly := true;
  EdtID.ReadOnly := true;
  EdtCellNumber.ReadOnly := true;
  EdtCustomerCode.ReadOnly := true;
  EdtPassword.Text := ObjAccount.GetPassword;
  EdtName.Text := ObjAccount.GetName;
  EdtSurname.Text := ObjAccount.GetSurname;
  EdtEmail.Text := ObjAccount.GetEmail;
  EdtID.Text := ObjAccount.GetID;
  EdtCellNumber.Text := ObjAccount.GetCell;
  EdtCustomerCode.Text := ObjAccount.GetCode;
  sgender := ObjAccount.GetGender;
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
  borders := ObjAccount.GetOrder;
  if borders = true then
  begin
    RgbOrders.Checked := true;
  end;
  if borders = false then
  begin
    RgbOrders.Checked := false;
  end;
end;

procedure TFrmCustomerAccount.BtnViewOrderClick(Sender: TObject);
begin
  if RgbOrders.Checked = true then
  begin
    FrmCustomerAccount.Hide;
    FrmCustomerViewOrder.Show;
  end
  else
  begin
    showmessage('You have no orders currently in progress.');
  end;
end;

procedure TFrmCustomerAccount.ChkShowClick(Sender: TObject);
begin
  if ChkShow.Checked = true then
  begin
    EdtPassword.PasswordChar := #0;
  end
  else
  begin
    EdtPassword.PasswordChar := '*';
  end;
end;

procedure TFrmCustomerAccount.CmbGenderChange(Sender: TObject);
begin
  // 0 = Male
  // 1 = Female
  // 2 = Non-Binary
end;

procedure TFrmCustomerAccount.FormCreate(Sender: TObject);
var
  borders: boolean;
  sgender: string;
begin // initialises the form
  TTimeCentre.interval := 100;
  TTimeCentre.Enabled := true;
  FrmCustomerAccount.BorderStyle := bsnone;
  FrmCustomerAccount.BorderIcons := [];
  BtnUndo.Hide;
  BtnDone.Hide;
  BtnEdit.Show;
  BtnDelete.Hide;
  LblTime.Font.Color := clWhite;
  TTime.interval := 1000;
  TTime.Enabled := true;
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
  EdtCustomerCode.ReadOnly := true;
  ImgAccount.Stretch := true;
  ImgAccount.Picture.LoadFromFile('BACKGROUNDS\ACCOUNT.jpg');
  ImgAccount.Align := Alclient;
  LblAccount.Font.Color := clWhite;
  LblName.Font.Color := clWhite;
  LblSurname.Font.Color := clWhite;
  LblID.Font.Color := clWhite;
  LblGender.Font.Color := clWhite;
  LblEmail.Font.Color := clWhite;
  LblCode.Font.Color := clWhite;
  LblCellNum.Font.Color := clWhite;
  LblPassword.Font.Color := clWhite;
  /// ///////////////////////////////////////////
  ObjAccount := TAccount.Create(FrmCustomerLogin.scustomercode);
  EdtName.Text := ObjAccount.GetName;
  EdtSurname.Text := ObjAccount.GetSurname;
  EdtPassword.Text := ObjAccount.GetPassword;
  EdtEmail.Text := ObjAccount.GetEmail;
  EdtID.Text := ObjAccount.GetID;
  EdtCellNumber.Text := ObjAccount.GetCell;
  EdtCustomerCode.Text := ObjAccount.GetCode;
  borders := ObjAccount.GetOrder;
  sgender := ObjAccount.GetGender;
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
  if borders = true then
  begin
    RgbOrders.Checked := true;
    BtnViewOrder.Show;
  end;
  if borders = false then
  begin
    RgbOrders.Checked := false;
    BtnViewOrder.Hide;
  end;

end;

procedure TFrmCustomerAccount.TTimeCentreTimer(Sender: TObject);
begin // centres the form
  FrmCustomerAccount.Position := poScreenCenter;
  TTimeCentre.Enabled := false;
end;

procedure TFrmCustomerAccount.TTimeTimer(Sender: TObject);
begin // shows currrent time
  LblTime.Caption := FormatDateTime('hh:nn:ss', Now);
end;

end.
