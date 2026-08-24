unit AdminAccount;

interface

uses
  SysUtils, Dialogs, Math, DBUsers;

type
  TAdminAccount = class

  private
    TAdminID: integer;

  public
    constructor create(sAdminID: integer);
    function GetEmail: string;
    function GetPassword: string;
    function GetCell: string;
    function GetName: string;
    function GetSurname: string;

  end;

implementation

{ TStaffAccount }

constructor TAdminAccount.create(sAdminID: integer);
begin
  TAdminID := sAdminID;
end;

function TAdminAccount.GetCell: string;
begin
  DMUsers.TblAdmin.First;
  while not DMUsers.TblAdmin.Eof do
  begin
    if DMUsers.TblAdmin['ADMIN ID'] = TAdminID then
    begin
      result := DMUsers.TblAdmin['CELL NUMBER'];
      exit;
    end
    else
    begin
      DMUsers.TblAdmin.Next;
    end;
  end;
end;

function TAdminAccount.GetEmail: string;
begin
  DMUsers.TblAdmin.First;
  while not DMUsers.TblAdmin.Eof do
  begin
    if DMUsers.TblAdmin['ADMIN ID'] = TAdminID then
    begin
      result := DMUsers.TblAdmin['EMAIL'];
      exit;
    end
    else
    begin
      DMUsers.TblAdmin.Next;
    end;
  end;

end;

function TAdminAccount.GetName: string;
begin
  DMUsers.TblAdmin.First;
  while not DMUsers.TblAdmin.Eof do
  begin
    if DMUsers.TblAdmin['ADMIN ID'] = TAdminID then
    begin
      result := DMUsers.TblAdmin['NAME'];
      exit;
    end
    else
    begin
      DMUsers.TblAdmin.Next;
    end;
  end;
end;

function TAdminAccount.GetPassword: string;
begin
  DMUsers.TblAdmin.First;
  while not DMUsers.TblAdmin.Eof do
  begin
    if DMUsers.TblAdmin['ADMIN ID'] = TAdminID then
    begin
      result := DMUsers.TblAdmin['PASSWORD'];
      exit;
    end
    else
    begin
      DMUsers.TblAdmin.Next;
    end;
  end;
end;

function TAdminAccount.GetSurname: string;
begin
  DMUsers.TblAdmin.First;
  while not DMUsers.TblAdmin.Eof do
  begin
    if DMUsers.TblAdmin['ADMIN ID'] = TAdminID then
    begin
      result := DMUsers.TblAdmin['SURNAME'];
      exit;
    end
    else
    begin
      DMUsers.TblAdmin.Next;
    end;
  end;
end;

end.
