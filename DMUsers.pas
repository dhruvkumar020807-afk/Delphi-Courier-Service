unit DMUsers;

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
    ConUser: TADOConnection;
    TblCustomer: TADOTable;
    TblAdmin: TADOTable;
    TblStaff: TADOTable;
    DscCustomer: TDataSource;
    DscAdmin: TDataSource;
    DscStaff: TDataSource;
  end;

var
  DMUser: TDMUsers;

implementation

{$R *.dfm}

procedure TDMUsers.DataModuleCreate(Sender: TObject);
begin
  ConUser := TADOConnection.Create(DMUsers);
  TblCustomer := TADOTable.Create(DMUsers);
  DscCustomer := TDataSource.Create(DMUsers);

  ConUser.ConnectionString :=
    'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\IT\IT PAT\PAT\DATABASES\USER DATABASE.mdb;Persist Security Info=False';
  ConUser.LoginPrompt := false;
  ConUser.Open;

  TblCustomer.Connection := ConUser;
  TblCustomer.TableName := 'CUSTOMER';

  DscCustomer.DataSet := TblCustomer;

  TblCustomer.Open;

  // -------------------------------------------

  ConUser := TADOConnection.Create(DMUsers);
  TblAdmin := TADOTable.Create(DMUsers);
  DscAdmin := TDataSource.Create(DMUsers);

  ConUser.ConnectionString :=
    'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\IT\IT PAT\PAT\DATABASES\USER DATABASE.mdb;Persist Security Info=False';
  ConUser.LoginPrompt := false;
  ConUser.Open;

  TblAdmin.Connection := ConUser;
  TblAdmin.TableName := 'ADMIN';

  DscAdmin.DataSet := TblAdmin;

  TblAdmin.Open;

  // -------------------------------------------

  ConUser := TADOConnection.Create(DMUsers);
  TblStaff := TADOTable.Create(DMUsers);
  DscStaff := TDataSource.Create(DMUsers);

  ConUser.ConnectionString :=
    'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\IT\IT PAT\PAT\DATABASES\USER DATABASE.mdb;Persist Security Info=False';
  ConUser.LoginPrompt := false;
  ConUser.Open;

  TblStaff.Connection := ConUser;
  TblStaff.TableName := 'STAFF';

  DscStaff.DataSet := TblStaff;

  TblStaff.Open;

end;

end.
