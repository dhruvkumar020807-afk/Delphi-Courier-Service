unit DBReviews;

interface

uses
  SysUtils, Classes, ADODB, DB;

type
  TDMReviews = class(TDataModule)
    ADOConnection1: TADOConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ConReviews: TADOConnection;
    TblReviews: TADOTable;
    DscReviews: TDataSource;
    qryReviewQuery: TADOQuery;
    dscReviewQuery: TDataSource;
  end;

var
  DMReview: TDMReviews;

implementation

{$R *.dfm}

procedure TDMReviews.DataModuleCreate(Sender: TObject);
begin
  ConReviews := TADOConnection.Create(DMReview);
  TblReviews := TADOTable.Create(DMReview);
  DscReviews := TDataSource.Create(DMReview);

  ConReviews.ConnectionString :=
    'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=DATABASES\REVIEWS.mdb;Persist Security Info=False';
  ConReviews.LoginPrompt := false;
  ConReviews.Open;

  TblReviews.Connection := ConReviews;
  TblReviews.TableName := 'REVIEWS';

  DscReviews.DataSet := TblReviews;

  qryReviewQuery := TADOQuery.Create(DMReview);
  dscReviewQuery := TDataSource.Create(DMReview);

  qryReviewQuery.Connection := ConReviews;

  dscReviewQuery.DataSet := qryReviewQuery;
  qryReviewQuery.SQL.Text := 'SELECT * FROM REVIEWS';
  qryReviewQuery.Open;

  TblReviews.Open;
end;

end.
