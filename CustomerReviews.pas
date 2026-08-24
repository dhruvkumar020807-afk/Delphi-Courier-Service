unit CustomerReviews;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, jpeg, DBReviews, DBUsers, Help,
  FindAccount;

type
  TFrmCustomerReviews = class(TForm)
    Black1: TImage;
    Gold2: TImage;
    Gold3: TImage;
    Gold4: TImage;
    Gold1: TImage;
    Gold5: TImage;
    Black4: TImage;
    Black5: TImage;
    Black3: TImage;
    Black2: TImage;
    EdtName: TEdit;
    BtnClear: TButton;
    PnlRate: TPanel;
    CmbRecommend: TComboBox;
    BtnPost: TButton;
    RichEditReview: TRichEdit;
    LblReviews: TLabel;
    LblTime: TLabel;
    BtnClose: TButton;
    BtnHelp: TButton;
    TTime: TTimer;
    ImgReviews: TImage;
    PnlRecommend: TPanel;
    LblName: TLabel;
    LblComment: TLabel;
    TColour1: TTimer;
    TColour2: TTimer;
    procedure BtnCloseClick(Sender: TObject);
    procedure TTimeTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmbRecommendChange(Sender: TObject);
    procedure Black1Click(Sender: TObject);
    procedure Black2Click(Sender: TObject);
    procedure Black3Click(Sender: TObject);
    procedure Black4Click(Sender: TObject);
    procedure Black5Click(Sender: TObject);
    procedure Gold1Click(Sender: TObject);
    procedure Gold2Click(Sender: TObject);
    procedure Gold3Click(Sender: TObject);
    procedure Gold4Click(Sender: TObject);
    procedure Gold5Click(Sender: TObject);
    procedure BtnPostClick(Sender: TObject);
    procedure BtnClearClick(Sender: TObject);
    procedure TColour1Timer(Sender: TObject);
    procedure TColour2Timer(Sender: TObject);
    procedure BtnHelpClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ObjHelp: THelp; // Class for help button
  ObjAccount: TAccount; // Class for finding customer that logged in
  FrmCustomerReviews: TFrmCustomerReviews;

implementation

uses
  CustomerLogin;
{$R *.dfm}

procedure TFrmCustomerReviews.Black1Click(Sender: TObject);
begin // To show 1 star
  Gold1.Show;
  Black1.Hide;
end;

procedure TFrmCustomerReviews.Black2Click(Sender: TObject);
begin // To show 2 stars
  Gold1.Show;
  Gold2.Show;
  Black2.Hide;
  Black1.Hide;
end;

procedure TFrmCustomerReviews.Black3Click(Sender: TObject);
begin // To show 3 stars
  Gold1.Show;
  Gold2.Show;
  Gold3.Show;
  Black3.Hide;
  Black2.Hide;
  Black1.Hide;

end;

procedure TFrmCustomerReviews.Black4Click(Sender: TObject);
begin // To show 4 stars
  Gold1.Show;
  Gold2.Show;
  Gold3.Show;
  Gold4.Show;
  Black4.Hide;
  Black3.Hide;
  Black2.Hide;
  Black1.Hide;
end;

procedure TFrmCustomerReviews.Black5Click(Sender: TObject);
begin // To show 5 stars
  Gold1.Show;
  Gold2.Show;
  Gold3.Show;
  Gold4.Show;
  Gold5.Show;
  Black5.Hide;
  Black4.Hide;
  Black3.Hide;
  Black2.Hide;
  Black1.Hide;
end;

procedure TFrmCustomerReviews.BtnClearClick(Sender: TObject);
begin // To Clear whatever the user has put in
  EdtName.Text := ObjAccount.GetName + ' ' + ObjAccount.GetSurname;
  RichEditReview.Clear;
  Gold1.Hide;
  Gold2.Hide;
  Gold3.Hide;
  Gold4.Hide;
  Gold5.Hide;
  Black5.Show;
  Black4.Show;
  Black3.Show;
  Black2.Show;
  Black1.Show;
  CmbRecommend.ItemIndex := -1;
end;

procedure TFrmCustomerReviews.BtnCloseClick(Sender: TObject);
begin
  Application.Terminate; // Close the application
end;

procedure TFrmCustomerReviews.BtnHelpClick(Sender: TObject);
begin
  ObjHelp.Reviews; // To show the message for the help button
end;

procedure TFrmCustomerReviews.BtnPostClick(Sender: TObject);
var
  StarCount, ipos: Integer;
  Recommend, bfound: Boolean;
  sname, ssurname, sinput: string;
begin // posts the review onto the database
  bfound := false;
  StarCount := 0;
  if Gold1.Visible then
    Inc(StarCount);
  if Gold2.Visible then
    Inc(StarCount);
  if Gold3.Visible then
    Inc(StarCount);
  if Gold4.Visible then
    Inc(StarCount);
  if Gold5.Visible then
    Inc(StarCount);

  if Black1.Visible = true then
  begin
    showmessage('Please give us a review based on stars');
    exit;
  end;
  if CmbRecommend.ItemIndex = 0 then
  begin
    Recommend := true;
  end;
  if CmbRecommend.ItemIndex = 1 then
  begin
    Recommend := false;
  end;
  if EdtName.Text = '' then
  begin
    showmessage('Enter Name');
    exit;
  end;
  sinput := EdtName.Text;
  ipos := pos(' ', sinput);
  sname := Copy(sinput, 1, ipos - 1);
  ssurname := Copy(sinput, ipos + 1, length(sinput));
  DMUsers.TblCustomer.First;
  while not DMUsers.TblCustomer.Eof do
  begin
    if (sname = DMUsers.TblCustomer['NAME']) and
      (ssurname = DMUsers.TblCustomer['SURNAME']) then
    begin
      bfound := true;
      break;
    end
    else
    begin
      DMUsers.TblCustomer.Next;
    end;
  end;
  if (bfound = false) then
  begin
    showmessage(
      'Your Name could not be recognised, make sure you have entered your name correctly and that you have an account');
    EdtName.Text := '';
    exit;
  end;
  if bfound = true then
  begin
    if RichEditReview.Text = '' then
    begin
      showmessage('Please fill in your review');
      exit;
    end;

    if CmbRecommend.ItemIndex = -1 then
    begin
      showmessage('Please select your recommend thoughts');
      exit;
    end;

    // Insert the review into the database
    DMReview.TblReviews.Append;
    try
      DMReview.TblReviews['Name'] := EdtName.Text;
      DMReview.TblReviews['Review'] := RichEditReview.Text;
      DMReview.TblReviews['Stars'] := StarCount;
      DMReview.TblReviews['Recommend'] := Recommend;
      DMReview.TblReviews.Post;
      showmessage('Review added successfully.');
      Gold1.Hide;
      Gold2.Hide;
      Gold3.Hide;
      Gold4.Hide;
      Gold5.Hide;
      Black1.Show;
      Black2.Show;
      Black3.Show;
      Black4.Show;
      Black5.Show;

      EdtName.Text := '';
      RichEditReview.Clear;
      CmbRecommend.ItemIndex := -1;
      Application.Terminate;
    except
      on E: Exception do
      begin
        DMReview.TblReviews.Cancel;
        showmessage('Error adding review: ' + E.Message);
      end;
    end;
  end;
end;

procedure TFrmCustomerReviews.CmbRecommendChange(Sender: TObject);
begin
  // 0 = YES
  // 1 = NO
end;

procedure TFrmCustomerReviews.FormCreate(Sender: TObject);
begin // initialising the form
  FrmCustomerReviews.BorderStyle := bsnone;
  FrmCustomerReviews.BorderIcons := [];
  FrmCustomerReviews.Position := poScreenCenter;
  ImgReviews.Picture.LoadFromFile('BACKGROUNDS\REVIEWS.jpg');
  ImgReviews.Stretch := true;
  ImgReviews.Align := Alclient;
  LblReviews.Font.Color := clWhite;
  LblTime.Font.Color := clWhite;
  TTime.Interval := 1000;
  TTime.Enabled := true;
  TColour1.Interval := 1000;
  TColour2.Interval := 1000;
  TColour1.Enabled := true;
  TColour2.Enabled := false;
  LblName.Font.Color := clWhite;
  LblComment.Font.Color := clWhite;
end;

procedure TFrmCustomerReviews.FormShow(Sender: TObject);
begin // initialising the name on edtname
  ObjAccount := TAccount.Create(FrmCustomerLogin.scustomercode);
  EdtName.Text := ObjAccount.GetName + ' ' + ObjAccount.GetSurname;
end;

procedure TFrmCustomerReviews.Gold1Click(Sender: TObject);
begin // shows 0 stars
  Gold5.Hide;
  Black5.Show;
  Gold4.Hide;
  Black4.Show;
  Gold3.Hide;
  Black3.Show;
  Gold2.Hide;
  Black2.Show;
  Gold1.Hide;
  Black1.Show;
end;

procedure TFrmCustomerReviews.Gold2Click(Sender: TObject);
begin // shows 1 star
  Gold5.Hide;
  Black5.Show;
  Gold4.Hide;
  Black4.Show;
  Gold3.Hide;
  Black3.Show;
  Gold2.Hide;
  Black2.Show;
end;

procedure TFrmCustomerReviews.Gold3Click(Sender: TObject);
begin // shows 2 stars
  Gold5.Hide;
  Black5.Show;
  Gold4.Hide;
  Black4.Show;
  Gold3.Hide;
  Black3.Show;
end;

procedure TFrmCustomerReviews.Gold4Click(Sender: TObject);
begin // shows 3 stars
  Gold5.Hide;
  Black5.Show;
  Gold4.Hide;
  Black4.Show;
end;

procedure TFrmCustomerReviews.Gold5Click(Sender: TObject);
begin // shows 4 stars
  Gold5.Hide;
  Black5.Show;
end;

procedure TFrmCustomerReviews.TColour1Timer(Sender: TObject);
begin // animation
  TColour2.Enabled := true;
  TColour1.Enabled := false;
  PnlRate.Font.Color := clBlack;
end;

procedure TFrmCustomerReviews.TColour2Timer(Sender: TObject);
begin // animation
  TColour2.Enabled := false;
  TColour1.Enabled := true;
  PnlRate.Font.Color := clBackground;
end;

procedure TFrmCustomerReviews.TTimeTimer(Sender: TObject);
begin // shows the current time
  LblTime.Caption := FormatDateTime('hh:nn:ss', Now);
end;

end.
