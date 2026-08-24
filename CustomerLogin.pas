unit CustomerLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, CreateAccount, Math, Help;

type
  TFrmCustomerLogin = class(TForm)
    ImgLogin: TImage;
    BtnClose: TButton;
    BtnHelp: TButton;
    BtnBack: TButton;
    LblCustomer: TLabel;
    LblEmail: TLabel;
    LblPass: TLabel;
    LblInfo: TLabel;
    LblSignUp: TLabel;
    lblshow: TLabel;
    EdtEmail: TEdit;
    EdtPass: TEdit;
    BtnLogin: TButton;
    BtnForgot: TButton;
    chkshow: TCheckBox;
    TimerForgot: TTimer;
    LblForgot: TLabel;
    LblTime: TLabel;
    TTime: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnBackClick(Sender: TObject);
    procedure LblSignUpClick(Sender: TObject);
    procedure chkshowClick(Sender: TObject);
    procedure BtnLoginClick(Sender: TObject);
    procedure BtnForgotClick(Sender: TObject);
    procedure TimerForgotTimer(Sender: TObject);
    procedure EdtPassChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BtnHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    scustomercode: string; // public variable for future use
  end;

var
  FrmCustomerLogin: TFrmCustomerLogin;
  scode: string;
  bcode: boolean;
  CountdownTime: integer;
  ObjHelp: THelp; // class for the help button

implementation

uses
  Usertype, CustomerHub, DBUsers, CustomerAccount, PackageDelivery,
  CustomerViewOrder;
{$R *.dfm}

procedure TFrmCustomerLogin.BtnBackClick(Sender: TObject);
begin // goes back to selecting the user type
  FrmCustomerLogin.Hide;
  FrmUserType.Show;
end;

procedure TFrmCustomerLogin.BtnCloseClick(Sender: TObject);
begin // closes the application
  Application.Terminate;
end;

procedure TFrmCustomerLogin.BtnForgotClick(Sender: TObject);
var
  sEmail, sCellNumber, sID: string;
begin // asks you questions based on the info typed when account was made and gives you a temporary code to allow you to log in
  sEmail := InputBox('Enter Your Email', 'eg: john@gmail.com', '');
  sCellNumber := InputBox('Enter  Your Phone Number', 'eg: 0123456789', '');
  sID := InputBox('Enter Your ID Number', 'eg: 0123456789101', '');
  CountdownTime := 60;
  DMUsers.TblCustomer.First;
  while not DMUsers.TblCustomer.Eof do
  begin
    if (sEmail = DMUsers.TblCustomer['EMAIL']) and
      (sCellNumber = DMUsers.TblCustomer['CELL NUMBER']) and
      (sID = DMUsers.TblCustomer['ID NUMBER']) then
    begin
      randomize;
      scode := inttostr(RandomRange(999, 9999));
      showmessage('Your temporary code is ' + scode +
          '. This is valid for only 1 Minute.');
      LblForgot.Caption := 'Time remaining ' + inttostr(CountdownTime)
        + ' seconds';
      TimerForgot.Enabled := true;
      bcode := true;
      break;
    end
    else
    begin
      DMUsers.TblCustomer.Next;
    end;
  end;
  if DMUsers.TblCustomer.Eof then
  begin
    showmessage('Account Not Found');
    TimerForgot.Enabled := false;
    LblForgot.Caption := '';
  end;
end;

procedure TFrmCustomerLogin.BtnHelpClick(Sender: TObject);
begin // shows the message for the help button
  ObjHelp.Login;
end;

procedure TFrmCustomerLogin.BtnLoginClick(Sender: TObject);
var
  sEmail, sPassword, sPassCheck, sLogs, sDate, stime: string;
  BFound: boolean;
  TUsers: TextFile;
begin // checks the info typed in and allows you to log in

  sDate := DateTimeToStr(Now);
  stime := TimeToStr(Now);
  sEmail := EdtEmail.Text;
  sPassword := EdtPass.Text;
  BFound := false;
  if bcode = false then
  begin
    sPassCheck := DMUsers.TblCustomer['PASSWORD'];
  end;
  if bcode = true then
  begin
    sPassCheck := scode;
  end;
  DMUsers.TblCustomer.First;
  while not DMUsers.TblCustomer.Eof do
  begin
    if sEmail = DMUsers.TblCustomer['EMAIL'] then
    begin
      if bcode then
        sPassCheck := scode
      else
        sPassCheck := DMUsers.TblCustomer['PASSWORD'];

      if sPassword = sPassCheck then
      begin
        sLogs := DMUsers.TblCustomer['Name'] + ' ' + DMUsers.TblCustomer
          ['SURNAME'] + ' Logged in at ' + sDate;
        if FileExists('CUSTOMER LOGIN LOG.txt') then
        begin
          AssignFile(TUsers, 'CUSTOMER LOGIN LOG.txt');
          Append(TUsers)
        end
        else
          Rewrite(TUsers);

        Writeln(TUsers, sLogs);
        CloseFile(TUsers);
        BFound := true;
        scustomercode := DMUsers.TblCustomer['CUSTOMER CODE'];

        FrmCustomerLogin.Hide;
        FrmCustomerHub.Show;
      end
      else
      begin
        showmessage('Incorrect Password');
        EdtPass.Text := '';
        Exit;
      end;
    end;
    DMUsers.TblCustomer.Next;
  end;
  if BFound = false then
  begin
    showmessage('User Not Found.');
  end;
end;

procedure TFrmCustomerLogin.chkshowClick(Sender: TObject);
begin // shows or hides the info types on edtpassword
  if chkshow.Checked = true then
  begin
    EdtPass.PasswordChar := #0;
  end;
  if chkshow.Checked = false then
  begin
    EdtPass.PasswordChar := '*';
  end;
end;

procedure TFrmCustomerLogin.EdtPassChange(Sender: TObject);
begin // checks validity of email
  if EdtEmail.Text = '' then
  begin
    showmessage('Please enter your email before you continue.');
  end;
end;

procedure TFrmCustomerLogin.FormCreate(Sender: TObject);
begin // initialises the form
  FrmCustomerLogin.BorderStyle := bsnone;
  FrmCustomerLogin.BorderIcons := [];
  FrmCustomerLogin.Position := poScreenCenter;
  ImgLogin.Picture.LoadFromFile('BACKGROUNDS\LOGIN.jpg');
  ImgLogin.Stretch := true;
  ImgLogin.Align := Alclient;
  LblCustomer.Font.Color := clWhite;
  LblForgot.Font.Color := clWhite;
  bcode := false;
  TimerForgot.Enabled := false;
  LblTime.Font.Color := clWhite;
  TTime.Interval := 1000;
  TTime.Enabled := true;
end;

procedure TFrmCustomerLogin.LblSignUpClick(Sender: TObject);
begin // takes you to the form to create an account
  FrmCustomerLogin.Hide;
  FrmCreateCustomerAccount.Show;
end;

procedure TFrmCustomerLogin.Timer1Timer(Sender: TObject);
begin // shows current time
  LblTime.Caption := FormatDateTime('hh:nn:ss', Now);
end;

procedure TFrmCustomerLogin.TimerForgotTimer(Sender: TObject);
begin // gives timer for how long the temporary code is valid
  Dec(CountdownTime);
  LblForgot.Caption := 'Time remaining ' + inttostr(CountdownTime) + ' seconds';

  if CountdownTime = 0 then
  begin
    TimerForgot.Enabled := false;
    bcode := false;
    LblForgot.Font.Color := clRed;
    LblForgot.Caption := 'Code Expired';
  end;

end;

end.
