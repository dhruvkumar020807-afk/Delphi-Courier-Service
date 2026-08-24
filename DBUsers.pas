unit DBUsers;

interface

uses
  SysUtils, Classes, ADODB, DB;

type
  TDMUsers = class(TDataModule)
    ADOConnection1: TADOConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ConUsers: TADOConnection;
    TblAdmin: TADOTable;
    DscAdmin: TDataSource;
    TblStaff: TADOTable;
    DscStaff: TDataSource;
    TblCustomer: TADOTable;
    DscCustomer: TDataSource;
    qryCustomerQuery: TADOQuery;
    dscCustomerQuery: TDataSource;
    qryStaffQuery: TADOQuery;
    dscStaffQuery: TDataSource;
  end;

var
  DMUsers: TDMUsers;

implementation

{$R *.dfm}

procedure TDMUsers.DataModuleCreate(Sender: TObject);
begin
  ConUsers := TADOConnection.Create(DMUsers);
  TblAdmin := TADOTable.Create(DMUsers);
  DscAdmin := TDataSource.Create(DMUsers);

  ConUsers.ConnectionString :=
    'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=DATABASES\USERS DATABASE.mdb;Persist Security Info=False';
  ConUsers.LoginPrompt := false;
  ConUsers.Open;

  TblAdmin.Connection := ConUsers;
  TblAdmin.TableName := 'ADMIN';

  DscAdmin.DataSet := TblAdmin;

  TblAdmin.Open;
  /// ////////////////////////////////////////////////////////////////////////////////////
  ConUsers := TADOConnection.Create(DMUsers);
  TblStaff := TADOTable.Create(DMUsers);
  DscStaff := TDataSource.Create(DMUsers);

  ConUsers.ConnectionString :=
    'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=DATABASES\USERS DATABASE.mdb;Persist Security Info=False';
  ConUsers.LoginPrompt := false;
  ConUsers.Open;

  TblStaff.Connection := ConUsers;
  TblStaff.TableName := 'STAFF';

  DscStaff.DataSet := TblStaff;

  qryStaffQuery := TADOQuery.Create(DMUsers);
  dscStaffQuery := TDataSource.Create(DMUsers);

  qryStaffQuery.Connection := ConUsers;

  dscStaffQuery.DataSet := qryStaffQuery;
  qryStaffQuery.SQL.Text := 'SELECT * FROM STAFF';
  qryStaffQuery.Open;

  TblStaff.Open;
  /// /////////////////////////////////////////////////////////////////////////////////////
  ConUsers := TADOConnection.Create(DMUsers);
  TblCustomer := TADOTable.Create(DMUsers);
  DscCustomer := TDataSource.Create(DMUsers);

  ConUsers.ConnectionString :=
    'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=DATABASES\USERS DATABASE.mdb;Persist Security Info=False';
  ConUsers.LoginPrompt := false;
  ConUsers.Open;

  TblCustomer.Connection := ConUsers;
  TblCustomer.TableName := 'CUSTOMER';

  DscCustomer.DataSet := TblCustomer;

  qryCustomerQuery := TADOQuery.Create(DMUsers);
  dscCustomerQuery := TDataSource.Create(DMUsers);

  qryCustomerQuery.Connection := ConUsers;

  dscCustomerQuery.DataSet := qryCustomerQuery;
  qryCustomerQuery.SQL.Text := 'SELECT * FROM CUSTOMER';
  qryCustomerQuery.Open;

  TblCustomer.Open;
end;

end.
