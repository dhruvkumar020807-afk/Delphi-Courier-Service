unit CustomerReview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, DBReviews, ComCtrls;

type
  TForm12 = class(TForm)
    Black1: TImage;
    Gold2: TImage;
    Gold3: TImage;
    Gold4: TImage;
    Gold1: TImage;
    Gold5: TImage;
    Black4: TImage;
    Black5: TImage;
    Black2: TImage;
    Black3: TImage;
    BtnClose: TButton;
    BtnHelp: TButton;
    PnlName: TPanel;
    EdtName: TEdit;
    PnlFeed: TPanel;
    BtnClear: TButton;
    Panel2: TPanel;
    PnlRecommend: TPanel;
    CmbRecommend: TComboBox;
    BtnPost: TButton;
    RichEditReview: TRichEdit;
    procedure FormShow(Sender: TObject);
    procedure Black4Click(Sender: TObject);
    procedure Black5Click(Sender: TObject);
    procedure Black1Click(Sender: TObject);
    procedure Black2Click(Sender: TObject);
    procedure Black3Click(Sender: TObject);
    procedure Gold1Click(Sender: TObject);
    procedure Gold2Click(Sender: TObject);
    procedure Gold5Click(Sender: TObject);
    procedure Gold3Click(Sender: TObject);
    procedure Gold4Click(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnClearClick(Sender: TObject);
    procedure BtnPostClick(Sender: TObject);
    procedure BtnHelpClick(Sender: TObject);
  private
    Procedure Clear;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12: TForm12;

implementation

{$R *.dfm}

procedure TForm12.Black1Click(Sender: TObject);
begin
  Gold1.Show;
  Black1.Hide;
end;

procedure TForm12.Black2Click(Sender: TObject);
begin
  Gold1.Show;
  Gold2.Show;
  Black2.Hide;
  Black1.Hide;
end;

procedure TForm12.Black3Click(Sender: TObject);
begin
  Gold1.Show;
  Gold2.Show;
  Gold3.Show;
  Black3.Hide;
  Black2.Hide;
  Black1.Hide;

end;

procedure TForm12.Black4Click(Sender: TObject);
begin
  Gold1.Show;
  Gold2.Show;
  Gold3.Show;
  Gold4.Show;
  Black4.Hide;
  Black3.Hide;
  Black2.Hide;
  Black1.Hide;
end;

procedure TForm12.Black5Click(Sender: TObject);
begin
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

procedure TForm12.BtnClearClick(Sender: TObject);
begin
  Clear; // clears everything
end;

procedure TForm12.BtnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm12.BtnHelpClick(Sender: TObject);
begin
  showmessage(
    'Click the amount of stars you would like to rate us, then simply enter your name, review and if you would recommend, after that click the "Post Review" button!');
end;

procedure TForm12.BtnPostClick(Sender: TObject);
var
  StarCount: Integer;
  Recommend: Boolean;
begin
  StarCount := 0; // posts the review
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

  if EdtName.Text = '' then
  begin
    showmessage('Enter Name');
    exit;
  end;

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

  if Black1.Visible = True then
  begin
    showmessage('Please give us a review based on stars');
    exit;
  end;
  Recommend := CmbRecommend.Text = 'Yes';

  // Insert the review into the database
  DMReviews.TblReviews.Append;
  try
    DMReviews.TblReviews.FieldByName('Name').AsString := EdtName.Text;
    DMReviews.TblReviews.FieldByName('Review').AsString := RichEditReview.Text;
    DMReviews.TblReviews.FieldByName('Stars').AsInteger := StarCount;
    DMReviews.TblReviews.FieldByName('Recommend').AsBoolean := Recommend;
    DMReviews.TblReviews.Post;
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
      DMReviews.TblReviews.Cancel;
      showmessage('Error adding review: ' + E.Message);
    end;
  end;

end;

procedure TForm12.Clear;
begin
  EdtName.Text := '';
  RichEditReview.Clear;
end;

procedure TForm12.FormShow(Sender: TObject);
begin
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
end;

procedure TForm12.Gold1Click(Sender: TObject);
begin
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

procedure TForm12.Gold2Click(Sender: TObject);
begin
  Gold5.Hide;
  Black5.Show;
  Gold4.Hide;
  Black4.Show;
  Gold3.Hide;
  Black3.Show;
  Gold2.Hide;
  Black2.Show;
end;

procedure TForm12.Gold3Click(Sender: TObject);
begin
  Gold5.Hide;
  Black5.Show;
  Gold4.Hide;
  Black4.Show;
  Gold3.Hide;
  Black3.Show;
end;

procedure TForm12.Gold4Click(Sender: TObject);
begin
  Gold5.Hide;
  Black5.Show;
  Gold4.Hide;
  Black4.Show;
end;

procedure TForm12.Gold5Click(Sender: TObject);
begin
  Gold5.Hide;
  Black5.Show;
end;

end.
