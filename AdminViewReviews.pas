unit AdminViewReviews;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, DBReviews, jpeg, ComCtrls,
  Series, TeEngine, TeeProcs, Chart, Help;

type
  TFrmAdminViewReviews = class(TForm)
    BtnClose: TButton;
    BtnHelp: TButton;
    TTime: TTimer;
    DBGReviews: TDBGrid;
    BtnFirst: TButton;
    BtnBefore: TButton;
    BtnNext: TButton;
    BtnLast: TButton;
    BtnSortNameAsc: TButton;
    BtnStarsGreater: TButton;
    BtnStarsLess: TButton;
    BtnRefresh: TButton;
    BtnBack: TButton;
    BtnSortNameDesc: TButton;
    CmbSearch: TComboBox;
    ImgReviews: TImage;
    Gold1: TImage;
    Black1: TImage;
    Gold2: TImage;
    Gold3: TImage;
    Gold4: TImage;
    Gold5: TImage;
    Black4: TImage;
    Black5: TImage;
    Black3: TImage;
    Black2: TImage;
    EdtName: TLabel;
    EdtReview: TLabel;
    RBtnRecommend: TRadioButton;
    EdtSearchedName: TEdit;
    RedReview: TRichEdit;
    LblID: TLabel;
    EdtID: TEdit;
    BtnDelete: TButton;
    BtnRecommend: TButton;
    BarGraph: TChart;
    Series2: TBarSeries;
    PiChart: TChart;
    Series1: TPieSeries;
    PnlBackground: TPanel;
    BtnHide: TButton;
    BtnShow: TButton;
    LblReviews: TLabel;
    LblTime: TLabel;
    procedure BtnBackClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure TTimeTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnSortNameDescClick(Sender: TObject);
    procedure BtnSortNameAscClick(Sender: TObject);
    procedure BtnStarsLessClick(Sender: TObject);
    procedure BtnStarsGreaterClick(Sender: TObject);
    procedure BtnLastClick(Sender: TObject);
    procedure BtnFirstClick(Sender: TObject);
    procedure BtnBeforeClick(Sender: TObject);
    procedure BtnNextClick(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
    procedure BtnRefreshClick(Sender: TObject);
    procedure CmbSearchChange(Sender: TObject);
    procedure BtnRecommendClick(Sender: TObject);
    procedure BtnHideClick(Sender: TObject);
    procedure BtnShowClick(Sender: TObject);
    procedure BtnHelpClick(Sender: TObject);
  private
    { Private declarations }
    procedure LoadStarBarGraph;
  public
    { Public declarations }
  end;

var
  FrmAdminViewReviews: TFrmAdminViewReviews;
  ArrSearch: array [0 .. 2] of string = ( // array to show search options
    'ID',
    'Name',
    'Stars'
  );
  ObjHelp: THelp; // class for the help button

implementation

uses
  AdminHub;
{$R *.dfm}

procedure TFrmAdminViewReviews.BtnBackClick(Sender: TObject);
begin // go back to the admin hub
  FrmAdminViewReviews.Hide;
  FrmAdminHub.Show;
end;

procedure TFrmAdminViewReviews.BtnBeforeClick(Sender: TObject);
var
  sname, sreview, sID: string;
  brecommend: boolean;
  istars: integer;
begin // show prior record
  DBGReviews.DataSource := DMReview.DscReviews;
  DMReview.TblReviews.prior;
  istars := DMReview.TblReviews['Stars'];
  DBGReviews.DataSource := DMReview.DscReviews;
  case istars of
    1:
      begin
        Gold1.Show;
        Gold2.Hide;
        Gold3.Hide;
        Gold4.Hide;
        Gold5.Hide;
      end;
    2:
      begin
        Gold1.Show;
        Gold2.Show;
        Gold3.Hide;
        Gold4.Hide;
        Gold5.Hide;
      end;
    3:
      begin
        Gold1.Show;
        Gold2.Show;
        Gold3.Show;
        Gold4.Hide;
        Gold5.Hide;
      end;
    4:
      begin
        Gold1.Show;
        Gold2.Show;
        Gold3.Show;
        Gold4.Show;
        Gold5.Hide;
      end;
    5:
      begin
        Gold1.Show;
        Gold2.Show;
        Gold3.Show;
        Gold4.Show;
        Gold5.Show;
      end;
  else
    begin
      Gold1.Hide;
      Gold2.Hide;
      Gold3.Hide;
      Gold4.Hide;
      Gold5.Hide;
    end;
  end;

  sname := DMReview.TblReviews['Name'];
  sreview := DMReview.TblReviews['Review'];
  sID := inttostr(DMReview.TblReviews['ID']);
  brecommend := DMReview.TblReviews['Recommend'];

  EdtSearchedName.Text := sname;
  RedReview.Lines.Add(sreview);
  EdtID.Text := sID;

  if brecommend = true then
  begin
    RBtnRecommend.Checked := true;
  end;

  if brecommend = false then
  begin
    RBtnRecommend.Checked := false;
  end;

end;

procedure TFrmAdminViewReviews.BtnCloseClick(Sender: TObject);
begin // close the application
  Application.Terminate;
end;

procedure TFrmAdminViewReviews.BtnDeleteClick(Sender: TObject);
begin // delete the record
  if MessageDlg('Are you sure you would like to delete this users review?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DBGReviews.DataSource := DMReview.DscReviews;
    with DMReview do
    begin
      qryReviewQuery.Close;
      qryReviewQuery.SQL.Text :=
        'DELETE FROM REVIEWS WHERE Name = :sSearchedName';
      qryReviewQuery.Parameters.ParamByName('sSearchedName').Value :=
        EdtSearchedName.Text;
      qryReviewQuery.ExecSQL;
    end;
  end
  else
    showmessage('Deletion canceled');
end;

procedure TFrmAdminViewReviews.BtnFirstClick(Sender: TObject);
var
  sname, sreview, sID: string;
  brecommend: boolean;
  istars: integer;
begin // view first record
  DBGReviews.DataSource := DMReview.DscReviews;
  DMReview.TblReviews.First;
  istars := DMReview.TblReviews['Stars'];
  DBGReviews.DataSource := DMReview.DscReviews;
  case istars of
    1:
      begin
        Gold1.Show;
        Gold2.Hide;
        Gold3.Hide;
        Gold4.Hide;
        Gold5.Hide;
      end;
    2:
      begin
        Gold1.Show;
        Gold2.Show;
        Gold3.Hide;
        Gold4.Hide;
        Gold5.Hide;
      end;
    3:
      begin
        Gold1.Show;
        Gold2.Show;
        Gold3.Show;
        Gold4.Hide;
        Gold5.Hide;
      end;
    4:
      begin
        Gold1.Show;
        Gold2.Show;
        Gold3.Show;
        Gold4.Show;
        Gold5.Hide;
      end;
    5:
      begin
        Gold1.Show;
        Gold2.Show;
        Gold3.Show;
        Gold4.Show;
        Gold5.Show;
      end;
  else
    begin
      Gold1.Hide;
      Gold2.Hide;
      Gold3.Hide;
      Gold4.Hide;
      Gold5.Hide;
    end;
  end;

  sname := DMReview.TblReviews['Name'];
  sreview := DMReview.TblReviews['Review'];
  sID := inttostr(DMReview.TblReviews['ID']);
  brecommend := DMReview.TblReviews['Recommend'];

  EdtSearchedName.Text := sname;
  RedReview.Lines.Add(sreview);
  EdtID.Text := sID;

  if brecommend = true then
  begin
    RBtnRecommend.Checked := true;
  end;

  if brecommend = false then
  begin
    RBtnRecommend.Checked := false;
  end;

end;

procedure TFrmAdminViewReviews.BtnLastClick(Sender: TObject);
var
  sname, sreview, sID: string;
  brecommend: boolean;
  istars: integer;
begin // view last record
  DBGReviews.DataSource := DMReview.DscReviews;
  DMReview.TblReviews.Last;

  istars := DMReview.TblReviews['Stars'];
  DBGReviews.DataSource := DMReview.DscReviews;
  case istars of
    1:
      begin
        Gold1.Show;
        Gold2.Hide;
        Gold3.Hide;
        Gold4.Hide;
        Gold5.Hide;
      end;
    2:
      begin
        Gold1.Show;
        Gold2.Show;
        Gold3.Hide;
        Gold4.Hide;
        Gold5.Hide;
      end;
    3:
      begin
        Gold1.Show;
        Gold2.Show;
        Gold3.Show;
        Gold4.Hide;
        Gold5.Hide;
      end;
    4:
      begin
        Gold1.Show;
        Gold2.Show;
        Gold3.Show;
        Gold4.Show;
        Gold5.Hide;
      end;
    5:
      begin
        Gold1.Show;
        Gold2.Show;
        Gold3.Show;
        Gold4.Show;
        Gold5.Show;
      end;
  else
    begin
      Gold1.Hide;
      Gold2.Hide;
      Gold3.Hide;
      Gold4.Hide;
      Gold5.Hide;
    end;
  end;

  sname := DMReview.TblReviews['Name'];
  sreview := DMReview.TblReviews['Review'];
  sID := inttostr(DMReview.TblReviews['ID']);
  brecommend := DMReview.TblReviews['Recommend'];

  EdtSearchedName.Text := sname;
  RedReview.Lines.Add(sreview);
  EdtID.Text := sID;

  if brecommend = true then
  begin
    RBtnRecommend.Checked := true;
  end;

  if brecommend = false then
  begin
    RBtnRecommend.Checked := false;
  end;
end;

procedure TFrmAdminViewReviews.BtnNextClick(Sender: TObject);
var
  sname, sreview, sID: string;
  brecommend: boolean;
  istars: integer;
begin // view next record
  DBGReviews.DataSource := DMReview.DscReviews;
  DMReview.TblReviews.next;
  istars := DMReview.TblReviews['Stars'];
  DBGReviews.DataSource := DMReview.DscReviews;
  case istars of
    1:
      begin
        Gold1.Show;
        Gold2.Hide;
        Gold3.Hide;
        Gold4.Hide;
        Gold5.Hide;
      end;
    2:
      begin
        Gold1.Show;
        Gold2.Show;
        Gold3.Hide;
        Gold4.Hide;
        Gold5.Hide;
      end;
    3:
      begin
        Gold1.Show;
        Gold2.Show;
        Gold3.Show;
        Gold4.Hide;
        Gold5.Hide;
      end;
    4:
      begin
        Gold1.Show;
        Gold2.Show;
        Gold3.Show;
        Gold4.Show;
        Gold5.Hide;
      end;
    5:
      begin
        Gold1.Show;
        Gold2.Show;
        Gold3.Show;
        Gold4.Show;
        Gold5.Show;
      end;
  else
    begin
      Gold1.Hide;
      Gold2.Hide;
      Gold3.Hide;
      Gold4.Hide;
      Gold5.Hide;
    end;
  end;

  sname := DMReview.TblReviews['Name'];
  sreview := DMReview.TblReviews['Review'];
  sID := inttostr(DMReview.TblReviews['ID']);
  brecommend := DMReview.TblReviews['Recommend'];

  EdtSearchedName.Text := sname;
  RedReview.Lines.Add(sreview);
  EdtID.Text := sID;

  if brecommend = true then
  begin
    RBtnRecommend.Checked := true;
  end;

  if brecommend = false then
  begin
    RBtnRecommend.Checked := false;
  end;
end;

procedure TFrmAdminViewReviews.BtnRecommendClick(Sender: TObject);
begin // sort by recommended
  DBGReviews.DataSource := DMReview.dscReviewQuery;
  with DMReview do
  begin
    qryReviewQuery.Close;
    qryReviewQuery.SQL.Text := 'SELECT * FROM REVIEWS WHERE Recommend = True';
    qryReviewQuery.Open;
  end;
  BtnSortNameDesc.Show;
  BtnSortNameAsc.Hide;
end;

procedure TFrmAdminViewReviews.BtnRefreshClick(Sender: TObject);
begin // refresh the dbg
  DBGReviews.DataSource := DMReview.DscReviews; // ⇐ ← →⇒
  with DMReview do
  begin
    qryReviewQuery.Close;
    qryReviewQuery.SQL.Text := 'SELECT * FROM REVIEWS';
    qryReviewQuery.Open;
  end;
  BtnSortNameDesc.Hide;
  BtnSortNameAsc.Show;
  CmbSearch.Text := 'SEARCHED BY:';
end;

procedure TFrmAdminViewReviews.BtnShowClick(Sender: TObject);
var
  YesCount, NoCount: integer;
  StarCounts: array [1 .. 5] of integer;
begin // shows the stats

  YesCount := 0;
  NoCount := 0;

  DMReview.TblReviews.First;
  while not DMReview.TblReviews.Eof do
  begin
    if DMReview.TblReviews.FieldByName('Recommend').AsBoolean then
      Inc(YesCount)
    else
      Inc(NoCount);

    DMReview.TblReviews.next;
  end;

  PiChart.Series[0].Clear;

  with PiChart.Series[0] do
  begin
    Add(YesCount, Format('YES - %d', [YesCount]), clGreen);
    Add(NoCount, Format('N0 - %d', [NoCount]), clRed);
  end;

  LoadStarBarGraph;

  PiChart.Show;
  BarGraph.Show;
  PnlBackground.Show;
  BtnHide.Show;
  BtnShow.Hide;
  BtnFirst.Click;
end;

procedure TFrmAdminViewReviews.BtnSortNameAscClick(Sender: TObject);
begin // sort by name alphabetically
  DBGReviews.DataSource := DMReview.DscReviews;
  with DMReview do
  begin
    qryReviewQuery.Close;
    qryReviewQuery.SQL.Text := 'SELECT * FROM REVIEWS ORDER BY NAME ASC';
    qryReviewQuery.Open;
  end;
  BtnSortNameDesc.Show;
  BtnSortNameAsc.Hide;
end;

procedure TFrmAdminViewReviews.BtnSortNameDescClick(Sender: TObject);
begin // sort by name alphabetically
  DBGReviews.DataSource := DMReview.dscReviewQuery;
  with DMReview do
  begin
    qryReviewQuery.Close;
    qryReviewQuery.SQL.Text := 'SELECT * FROM REVIEWS ORDER BY NAME DESC';
    qryReviewQuery.Open;
  end;
  BtnSortNameDesc.Hide;
  BtnSortNameAsc.Show;
end;

procedure TFrmAdminViewReviews.BtnStarsGreaterClick(Sender: TObject);
var // sort by stars greater than
  ssearched: string;
begin
  ssearched := InputBox('Enter Number of Stars',
    'Enter the Number of stars greater than you would like to view', '');
  DBGReviews.DataSource := DMReview.dscReviewQuery;
  with DMReview do
  begin
    qryReviewQuery.Close;
    qryReviewQuery.SQL.Text :=
      'SELECT * FROM REVIEWS WHERE STARS > :sSearchedNumber';
    qryReviewQuery.Parameters.ParamByName('sSearchedNumber').Value := strtoint
      (ssearched);
    qryReviewQuery.Open;
  end;
end;

procedure TFrmAdminViewReviews.BtnStarsLessClick(Sender: TObject);
var
  ssearched: string;
begin // sort by stars less than
  ssearched := InputBox('Enter Number of Stars',
    'Enter the Number of stars less than you would like to view', '');
  DBGReviews.DataSource := DMReview.dscReviewQuery;
  with DMReview do
  begin
    qryReviewQuery.Close;
    qryReviewQuery.SQL.Text :=
      'SELECT * FROM REVIEWS WHERE STARS < :sSearchedNumber';
    qryReviewQuery.Parameters.ParamByName('sSearchedNumber').Value := strtoint
      (ssearched);
    qryReviewQuery.Open;
  end;
end;

procedure TFrmAdminViewReviews.BtnHelpClick(Sender: TObject);
begin // displays the help message
  ObjHelp.AdminViewReview;
end;

procedure TFrmAdminViewReviews.BtnHideClick(Sender: TObject);
begin // hides the stats
  PiChart.Hide;
  BarGraph.Hide;
  PnlBackground.Hide;
  BtnHide.Hide;
  BtnShow.Show;
end;

procedure TFrmAdminViewReviews.CmbSearchChange(Sender: TObject);
// 0 = ID
// 1 = Name
// 2 = Stars
var
  ssearched: string;
begin // searching
  if CmbSearch.ItemIndex = 0 then
  begin
    ssearched := InputBox('Enter ID',
      'Enter the ID of the review you would like to view', '');
    DBGReviews.DataSource := DMReview.dscReviewQuery;
    with DMReview do
    begin
      qryReviewQuery.Close;
      qryReviewQuery.SQL.Text := 'SELECT NAME, ID FROM REVIEWS WHERE ID = sID';
      qryReviewQuery.Parameters.ParamByName('sID').Value := strtoint(ssearched);
      qryReviewQuery.Open;
    end;
  end;

  if CmbSearch.ItemIndex = 1 then
  begin
    ssearched := InputBox('Enter Name',
      'Enter the Name of the reviewer you would like to view', '');
    DBGReviews.DataSource := DMReview.dscReviewQuery;
    with DMReview do
    begin
      qryReviewQuery.Close;
      qryReviewQuery.SQL.Text := 'SELECT * FROM REVIEWS WHERE NAME = sName';
      qryReviewQuery.Parameters.ParamByName('sName').Value := ssearched;
      qryReviewQuery.Open;
    end;
  end;

  if CmbSearch.ItemIndex = 2 then
  begin
    ssearched := InputBox('Enter Number of Stars',
      'Enter the Number of stars of the reviews you would like to view', '');
    DBGReviews.DataSource := DMReview.dscReviewQuery;
    with DMReview do
    begin
      qryReviewQuery.Close;
      qryReviewQuery.SQL.Text := 'SELECT * FROM REVIEWS WHERE Stars = sStars';
      qryReviewQuery.Parameters.ParamByName('sStars').Value := strtoint
        (ssearched);
      qryReviewQuery.Open;
    end;
  end;

end;

procedure TFrmAdminViewReviews.FormCreate(Sender: TObject);
var
  i, j: integer;
  YesCount, NoCount: integer;
  StarCounts: array [1 .. 5] of integer;
begin // initialising the form

  YesCount := 0;
  NoCount := 0;

  DMReview.TblReviews.First;
  while not DMReview.TblReviews.Eof do
  begin
    if DMReview.TblReviews.FieldByName('Recommend').AsBoolean then
      Inc(YesCount)
    else
      Inc(NoCount);

    DMReview.TblReviews.next;
  end;

  PiChart.Series[0].Clear;

  with PiChart.Series[0] do
  begin
    Add(YesCount, Format('YES - %d', [YesCount]), clGreen);
    Add(NoCount, Format('N0 - %d', [NoCount]), clRed);
  end;

  FrmAdminViewReviews.BorderStyle := bsnone;
  FrmAdminViewReviews.BorderIcons := [];
  FrmAdminViewReviews.Position := poScreenCenter;
  ImgReviews.Stretch := true;
  ImgReviews.Picture.LoadFromFile('BACKGROUNDS\REVIEWS.jpg');
  ImgReviews.Align := Alclient;
  LblReviews.Font.Color := clWhite;
  LblTime.Font.Color := clWhite;
  TTime.Interval := 1000;
  TTime.Enabled := true;
  BtnShow.Hide;

  DBGReviews.DataSource := DMReview.DscReviews; // ⇐ ← →⇒
  with DMReview do
  begin
    qryReviewQuery.Close;
    qryReviewQuery.SQL.Text := 'SELECT * FROM REVIEWS';
    qryReviewQuery.Open;
  end;
  BtnSortNameDesc.Hide;

  for i := low(ArrSearch) to high(ArrSearch) do
  begin
    CmbSearch.Items.Add(ArrSearch[i])
  end;

  EdtSearchedName.Text := '';
  EdtID.Text := '';
  RedReview.Clear;
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

  EdtSearchedName.Enabled := false;
  EdtID.Enabled := false;
  RedReview.ReadOnly := true;
  RBtnRecommend.Enabled := false;

  LoadStarBarGraph;

  DMReview.TblReviews.First;

  BtnRefresh.Click;
end;

procedure TFrmAdminViewReviews.LoadStarBarGraph;
var
  StarCounts: array [1 .. 5] of integer;
  i: integer;
begin // loading the bar graph
  // Initialise counts
  for i := 1 to 5 do
    StarCounts[i] := 0;

  // Count stars in the table
  if not DMReview.TblReviews.Active then
    DMReview.TblReviews.Open;

  DMReview.TblReviews.First;
  while not DMReview.TblReviews.Eof do
  begin
    i := DMReview.TblReviews.FieldByName('Stars').AsInteger;
    if (i >= 1) and (i <= 5) then
      Inc(StarCounts[i]);

    DMReview.TblReviews.next;
  end;

  // Clear the bar series and add counts
  BarGraph.Series[0].Clear; // Assuming Series2 is your TBarSeries

  for i := 1 to 5 do
    BarGraph.Series[0].Add(StarCounts[i], inttostr(i) + ' Stars', clBlue);
end;

procedure TFrmAdminViewReviews.TTimeTimer(Sender: TObject);
begin // shows the current time
  LblTime.Caption := FormatDateTime('hh:nn:ss', Now);
end;

end.
