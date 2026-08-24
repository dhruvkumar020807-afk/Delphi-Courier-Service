unit AdminLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBUsers, Math, Help;

type
  TFrmAdminLogin = class(TForm)
    ImgAdminLogin: TImage;
    BtnClose: TButton;
    BtnHelp: TButton;
    BtnBack: TButton;
    LblAdmin: TLabel;
    LblEmail: TLabel;
    LblPass: TLabel;
    lblshow: TLabel;
    LblForgot: TLabel;
    EdtID: TEdit;
    EdtPass: TEdit;
    BtnLogin: TButton;
    BtnForgot: TButton;
    chkshow: TCheckBox;
    TimerForgot: TTimer;
    LblTime: TLabel;
    TTime: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnBackClick(Sender: TObject);
    procedure BtnLoginClick(Sender: TObject);
    procedure TimerForgotTimer(Sender: TObject);
    procedure BtnForgotClick(Sender: TObject);
    procedure chkshowClick(Sender: TObject);
    procedure TTimeTimer(Sender: TObject);
    procedure BtnHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iAdminID: integer;
  end;

var
  FrmAdminLogin: TFrmAdminLogin;
  ObjHelp: THelp;
  scode: string;
  bcode: boolean;
  CountdownTime: integer;

implementation

uses
  Usertype, AdminHub;
{$R *.dfm}

procedure TFrmAdminLogin.BtnBackClick(Sender: TObject);
begin
  FrmAdminLogin.Hide;
  FrmUserType.Show;
end;

procedure TFrmAdminLogin.BtnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmAdminLogin.BtnForgotClick(Sender: TObject);
var
  sCellNumber, sEmail: string;
begin
  sEmail := InputBox('Enter Your Email', 'eg: john@gmail.com', '');
  sCellNumber := InputBox('Enter  Your Phone Number', 'eg: 0123456789', '');
  CountdownTime := 60;
  DMUsers.TblAdmin.First;
  while not DMUsers.TblAdmin.Eof do
  begin
    if (sEmail = DMUsers.TblAdmin['EMAIL']) and
      (sCellNumber = DMUsers.TblAdmin['CELL NUMBER']) then
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
      DMUsers.TblAdmin.Next;
    end;
  end;
  if DMUsers.TblAdmin.Eof then
  begin
    showmessage('Account Not Found');
    TimerForgot.Enabled := false;
    LblForgot.Caption := '';
  end;
end;

procedure TFrmAdminLogin.BtnHelpClick(Sender: TObject);
begin
  ObjHelp.Login;
end;

procedure TFrmAdminLogin.BtnLoginClick(Sender: TObject);
var
  sID, sPassword, sPassCheck: string;
  BFound: boolean;
  TUsers: TextFile;
  slogs, sdate: string;
begin

  sdate := DateTimeToStr(Now);
  sID := EdtID.Text;
  sPassword := EdtPass.Text;
  BFound := false;
  if bcode = false then
  begin
    sPassCheck := DMUsers.TblAdmin['PASSWORD'];
  end;
  if bcode = true then
  begin
    sPassCheck := scode;
  end;
  DMUsers.TblAdmin.First;
  while not DMUsers.TblAdmin.Eof do
  begin
    if sID = DMUsers.TblAdmin['ADMIN ID'] then
    begin
      if bcode then
        sPassCheck := scode
      else
        sPassCheck := DMUsers.TblAdmin['PASSWORD'];

      if sPassword = sPassCheck then
      begin
        slogs := DMUsers.TblAdmin['Name'] + ' ' + DMUsers.TblAdmin['SURNAME']
          + ' Logged in at ' + sdate;
        AssignFile(TUsers, 'ADMIN LOGIN LOG.txt');
        if FileExists('ADMIN LOGIN LOG.txt') then
          Append(TUsers)
        else
          Rewrite(TUsers); // Creates the file
        Writeln(TUsers, slogs);
        CloseFile(TUsers);
        iAdminID := DMUsers.TblAdmin.FieldByName('ADMIN ID').AsInteger;
        FrmAdminLogin.Hide;
        FrmAdminHub.Show;
        BFound := true;
      end
      else
      begin
        showmessage('Incorrect Password');
        EdtPass.Text := '';
        Exit;
      end;
    end;
    DMUsers.TblAdmin.Next;
  end;
  if BFound = false then
  begin
    showmessage('User Not Found.');
  end;
end;

procedure TFrmAdminLogin.chkshowClick(Sender: TObject);
begin
  if chkshow.Checked = true then
  begin
    EdtPass.PasswordChar := #0;
  end;
  if chkshow.Checked = false then
  begin
    EdtPass.PasswordChar := '*';
  end;
end;

procedure TFrmAdminLogin.FormCreate(Sender: TObject);
begin
  FrmAdminLogin.BorderStyle := bsnone;
  FrmAdminLogin.BorderIcons := [];
  FrmAdminLogin.Position := poScreenCenter;
  ImgAdminLogin.Stretch := true;
  ImgAdminLogin.Picture.LoadFromFile('BACKGROUNDS\LOGIN.jpg');
  LblAdmin.Font.Color := clWhite;
  LblForgot.Font.Color := clWhite;
  LblTime.Font.Color := clWhite;
  bcode := false;
  TimerForgot.Enabled := false;
  TTime.Enabled := true;
  ImgAdminLogin.Align := Alclient;
end;

procedure TFrmAdminLogin.TimerForgotTimer(Sender: TObject);
begin
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

procedure TFrmAdminLogin.TTimeTimer(Sender: TObject);
begin
  LblTime.Caption := FormatDateTime('hh:nn:ss', Now);
end;

end.
