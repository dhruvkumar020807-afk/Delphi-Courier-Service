unit StaffAccount;

interface

uses
  SysUtils, Dialogs, Math, DBUsers;

type
  TStaffAccount = class

  private
    TStaffID: string;

  public
    constructor create(sStaffID: string);
    function GetEmail: string;
    function GetPassword: string;
    function GetID: string;
    function GetGender: string;
    function GetCell: string;
    function GetOrder: string;
    function GetName: string;
    function GetSurname: string;
    function GetLicenseType: string;
    function GetAvailable: boolean;

  end;

implementation

{ TStaffAccount }

constructor TStaffAccount.create(sStaffID: string);
begin
  TStaffID := sStaffID;
end;

function TStaffAccount.GetAvailable: boolean;
begin
  DMUsers.TblStaff.First;
  while not DMUsers.TblStaff.Eof do
  begin
    if DMUsers.TblStaff['STAFF ID'] = TStaffID then
    begin
      Result := DMUsers.TblStaff['AVAILABLE'];
      exit;
    end
    else
    begin
      DMUsers.TblStaff.Next;
    end;
  end;
end;

function TStaffAccount.GetCell: string;
begin
  DMUsers.TblStaff.First;
  while not DMUsers.TblStaff.Eof do
  begin
    if DMUsers.TblStaff['STAFF ID'] = TStaffID then
    begin
      Result := DMUsers.TblStaff['CELL NUMBER'];
      exit;
    end
    else
    begin
      DMUsers.TblStaff.Next;
    end;
  end;
end;

function TStaffAccount.GetEmail: string;
begin
  DMUsers.TblStaff.First;
  while not DMUsers.TblStaff.Eof do
  begin
    if DMUsers.TblStaff['STAFF ID'] = TStaffID then
    begin
      Result := DMUsers.TblStaff['EMAIL'];
      exit;
    end
    else
    begin
      DMUsers.TblStaff.Next;
    end;
  end;
end;

function TStaffAccount.GetGender: string;
begin
  DMUsers.TblStaff.First;
  while not DMUsers.TblStaff.Eof do
  begin
    if DMUsers.TblStaff['STAFF ID'] = TStaffID then
    begin
      Result := DMUsers.TblStaff['GENDER'];
      exit;
    end
    else
    begin
      DMUsers.TblStaff.Next;
    end;
  end;
end;

function TStaffAccount.GetID: string;
begin
  DMUsers.TblStaff.First;
  while not DMUsers.TblStaff.Eof do
  begin
    if DMUsers.TblStaff['STAFF ID'] = TStaffID then
    begin
      Result := DMUsers.TblStaff['ID NUMBER'];
      exit;
    end
    else
    begin
      DMUsers.TblStaff.Next;
    end;
  end;
end;

function TStaffAccount.GetLicenseType: string;
begin
  DMUsers.TblStaff.First;
  while not DMUsers.TblStaff.Eof do
  begin
    if DMUsers.TblStaff['STAFF ID'] = TStaffID then
    begin
      Result := DMUsers.TblStaff['LICENSE TYPE'];
      exit;
    end
    else
    begin
      DMUsers.TblStaff.Next;
    end;
  end;
end;

function TStaffAccount.GetName: string;
begin
  DMUsers.TblStaff.First;
  while not DMUsers.TblStaff.Eof do
  begin
    if DMUsers.TblStaff['STAFF ID'] = TStaffID then
    begin
      Result := DMUsers.TblStaff['NAME'];
      exit;
    end
    else
    begin
      DMUsers.TblStaff.Next;
    end;
  end;
end;

function TStaffAccount.GetOrder: string;
begin
  DMUsers.TblStaff.First;
  while not DMUsers.TblStaff.Eof do
  begin
    if DMUsers.TblStaff['STAFF ID'] = TStaffID then
    begin
      Result := DMUsers.TblStaff['CURRENT ORDER'];
      exit;
    end
    else
    begin
      DMUsers.TblStaff.Next;
    end;
  end;
end;

function TStaffAccount.GetPassword: string;
begin
  DMUsers.TblStaff.First;
  while not DMUsers.TblStaff.Eof do
  begin
    if DMUsers.TblStaff['STAFF ID'] = TStaffID then
    begin
      Result := DMUsers.TblStaff['PASSWORD'];
      exit;
    end
    else
    begin
      DMUsers.TblStaff.Next;
    end;
  end;
end;

function TStaffAccount.GetSurname: string;
begin
  DMUsers.TblStaff.First;
  while not DMUsers.TblStaff.Eof do
  begin
    if DMUsers.TblStaff['STAFF ID'] = TStaffID then
    begin
      Result := DMUsers.TblStaff['SURNAME'];
      exit;
    end
    else
    begin
      DMUsers.TblStaff.Next;
    end;
  end;
end;

end.
