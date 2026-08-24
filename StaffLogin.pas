unit StaffLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Math, DBUsers, ExtCtrls, StdCtrls, Help;

type
  TFrmStaffLogin = class(TForm)
    ImgLogin: TImage;
    LblEmail: TLabel;
    LblPass: TLabel;
    lblshow: TLabel;
    LblForgot: TLabel;
    EdtID: TEdit;
    EdtPass: TEdit;
    BtnLogin: TButton;
    BtnForgot: TButton;
    chkshow: TCheckBox;
    BtnClose: TButton;
    BtnHelp: TButton;
    BtnBack: TButton;
    TimerForgot: TTimer;
    LblStaff: TLabel;
    LblTime: TLabel;
    TTime: TTimer;
    procedure BtnLoginClick(Sender: TObject);
    procedure BtnBackClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnForgotClick(Sender: TObject);
    procedure TimerForgotTimer(Sender: TObject);
    procedure chkshowClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnHelpClick(Sender: TObject);
    procedure TTimeTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sadminid: string;
  end;

var
  FrmStaffLogin: TFrmStaffLogin;
  scode: string;
  bcode: boolean;
  CountdownTime: integer;
  ObjHelp: THelp; // class for help button

implementation

uses
  Usertype, StaffHub;
{$R *.dfm}

procedure TFrmStaffLogin.BtnBackClick(Sender: TObject);
begin // goes back to the user type
  FrmStaffLogin.Hide;
  FrmUserType.Show;
end;

procedure TFrmStaffLogin.BtnCloseClick(Sender: TObject);
begin // closes the application
  Application.Terminate;
end;

procedure TFrmStaffLogin.BtnForgotClick(Sender: TObject);
var
  sCellNumber, sEmail: string;
begin // forgot the password, asks for details and gives a temporary code
  sEmail := InputBox('Enter Your Email', 'eg: john@gmail.com', '');
  sCellNumber := InputBox('Enter  Your Phone Number', 'eg: 0123456789', '');
  CountdownTime := 60;
  DMUsers.TblStaff.First;
  while not DMUsers.TblStaff.Eof do
  begin
    if (sEmail = DMUsers.TblStaff['EMAIL']) and
      (sCellNumber = DMUsers.TblStaff['CELL NUMBER']) then
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
      DMUsers.TblStaff.Next;
    end;
  end;
  if DMUsers.TblStaff.Eof then
  begin
    showmessage('Account Not Found');
    TimerForgot.Enabled := false;
    LblForgot.Caption := '';
  end;
end;

procedure TFrmStaffLogin.BtnHelpClick(Sender: TObject);
begin // shows the help button
  ObjHelp.Login;
end;

procedure TFrmStaffLogin.BtnLoginClick(Sender: TObject);
var
  sID, sPassword, sPassCheck: string;
  BFound: boolean;
  TUsers: TextFile;
  slogs, sdate: string;
begin
  sdate := DateTimeToStr(Now);
  sID := Trim(EdtID.Text);
  sPassword := Trim(EdtPass.Text);
  BFound := false;

  DMUsers.TblStaff.First;
  while not DMUsers.TblStaff.Eof do
  begin
    if sID = DMUsers.TblStaff['STAFF ID'] then
    begin
      // User found
      if bcode then
        sPassCheck := scode
      else
        sPassCheck := DMUsers.TblStaff['PASSWORD'];

      if sPassword = sPassCheck then
      begin
        // Success log
        slogs := DMUsers.TblStaff['Name'] + ' ' + DMUsers.TblStaff['SURNAME']
          + ' Logged in at ' + sdate;

        AssignFile(TUsers, 'STAFF LOGIN LOG.txt');
        if FileExists('STAFF LOGIN LOG.txt') then
          Append(TUsers)
        else
          Rewrite(TUsers);
        Writeln(TUsers, slogs);
        CloseFile(TUsers);

        sadminid := sID;
        BFound := true;

        FrmStaffLogin.Hide;
        FrmStaffHub.Show;
      end
      else
      begin
        showmessage('Incorrect Password');
        EdtPass.Text := '';
        exit;
      end;

      break; // Exit loop once ID found
    end;

    DMUsers.TblStaff.Next;
  end;

  if not BFound then
    showmessage('User Not Found.');
end;

procedure TFrmStaffLogin.chkshowClick(Sender: TObject);
begin // shows the password in the edt
  if chkshow.Checked = true then
  begin
    EdtPass.PasswordChar := #0;
  end;
  if chkshow.Checked = false then
  begin
    EdtPass.PasswordChar := '*';
  end;
end;

procedure TFrmStaffLogin.FormCreate(Sender: TObject);
begin // initialising the form
  FrmStaffLogin.BorderStyle := bsnone;
  FrmStaffLogin.BorderIcons := [];
  FrmStaffLogin.Position := poScreenCenter;
  ImgLogin.Stretch := true;
  ImgLogin.Picture.LoadFromFile('BACKGROUNDS\LOGIN.jpg');
  ImgLogin.Align := Alclient;
  LblStaff.Font.Color := clWhite;
  LblForgot.Font.Color := clWhite;
  bcode := false;
  TimerForgot.Enabled := false;
  LblTime.Font.Color := clWhite;
  TTime.Interval := 1000;
  TTime.Enabled := true;
end;

procedure TFrmStaffLogin.TimerForgotTimer(Sender: TObject);
begin // timer for temporary code
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

procedure TFrmStaffLogin.TTimeTimer(Sender: TObject);
begin // shows the current time
  LblTime.Caption := FormatDateTime('hh:nn:ss', Now);
end;

end.
