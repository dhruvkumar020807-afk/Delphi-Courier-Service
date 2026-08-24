unit DBOrders;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDMOrders = class(TDataModule)
    ADOConnection1: TADOConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ConOrders: TADOConnection;
    TblOrders: TADOTable;
    DscOrders: TDataSource;
    qryOrderQuery: TADOQuery;
    dscOrderQuery: TDataSource;
  end;

var
  DMOrders: TDMOrders;

implementation

{$R *.dfm}

procedure TDMOrders.DataModuleCreate(Sender: TObject);
begin
  ConOrders := TADOConnection.Create(DMOrders);
  TblOrders := TADOTable.Create(DMOrders);
  DscOrders := TDataSource.Create(DMOrders);

  ConOrders.ConnectionString :=
    'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=DATABASES\PACKAGE ORDER.mdb;Persist Security Info=False';
  ConOrders.LoginPrompt := false;
  ConOrders.Open;

  TblOrders.Connection := ConOrders;
  TblOrders.TableName := 'ORDERS';

  DscOrders.DataSet := TblOrders;

  qryOrderQuery := TADOQuery.Create(DMOrders);
  dscOrderQuery := TDataSource.Create(DMOrders);

  qryOrderQuery.Connection := ConOrders;

  dscOrderQuery.DataSet := qryOrderQuery;
  qryOrderQuery.SQL.Text := 'SELECT * FROM ORDERS';
  qryOrderQuery.Open;

  TblOrders.Open;
end;

end.
