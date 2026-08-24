unit FindAccount;

interface

uses
  SysUtils, Dialogs, Math, DBUsers;

type
  TAccount = class

  private
    TCustomerCode: string;

  public
    constructor Create(SCode: string);
    function GetEmail: string;
    function GetPassword: string;
    function GetID: string;
    function GetGender: string;
    function GetCell: string;
    function GetCode: string;
    function GetOrder: boolean;
    function GetName: string;
    function GetSurname: string;

  end;

implementation

{ TAccount }

constructor TAccount.Create(SCode: string);
begin
  TCustomerCode := SCode
end;

function TAccount.GetCell: string;
begin
  DMUsers.TblCustomer.First;
  while not DMUsers.TblCustomer.Eof do
  begin
    if (TCustomerCode = DMUsers.TblCustomer['CUSTOMER CODE']) then
    begin
      result := DMUsers.TblCustomer['CELL NUMBER'];
      exit;
    end
    else
      DMUsers.TblCustomer.Next;
  end;
end;

function TAccount.GetCode: string;
begin
  DMUsers.TblCustomer.First;
  while not DMUsers.TblCustomer.Eof do
  begin
    if (TCustomerCode = DMUsers.TblCustomer['CUSTOMER CODE']) then
    begin
      result := DMUsers.TblCustomer['CUSTOMER CODE'];
      exit;
    end
    else
      DMUsers.TblCustomer.Next;
  end;
end;

function TAccount.GetEmail: string;
begin
  DMUsers.TblCustomer.First;
  while not DMUsers.TblCustomer.Eof do
  begin
    if (TCustomerCode = DMUsers.TblCustomer['CUSTOMER CODE']) then
    begin
      result := DMUsers.TblCustomer['EMAIL'];
      exit;
    end
    else
      DMUsers.TblCustomer.Next;
  end;
end;

function TAccount.GetGender: string;
begin
  DMUsers.TblCustomer.First;
  while not DMUsers.TblCustomer.Eof do
  begin
    if (TCustomerCode = DMUsers.TblCustomer['CUSTOMER CODE']) then
    begin
      result := DMUsers.TblCustomer['GENDER'];
      exit;
    end
    else
      DMUsers.TblCustomer.Next;
  end;

end;

function TAccount.GetID: string;
begin
  DMUsers.TblCustomer.First;
  while not DMUsers.TblCustomer.Eof do
  begin
    if (TCustomerCode = DMUsers.TblCustomer['CUSTOMER CODE']) then
    begin
      result := DMUsers.TblCustomer['ID NUMBER'];
      exit;
    end
    else
      DMUsers.TblCustomer.Next;
  end;
end;

function TAccount.GetName: string;
begin
  DMUsers.TblCustomer.First;
  while not DMUsers.TblCustomer.Eof do
  begin
    if (TCustomerCode = DMUsers.TblCustomer['CUSTOMER CODE']) then
    begin
      result := DMUsers.TblCustomer['NAME'];
      exit;
    end
    else
      DMUsers.TblCustomer.Next;
  end;
end;

function TAccount.GetOrder: boolean;
begin
  DMUsers.TblCustomer.First;
  while not DMUsers.TblCustomer.Eof do
  begin
    if (TCustomerCode = DMUsers.TblCustomer['CUSTOMER CODE']) then
    begin
      if DMUsers.TblCustomer['CURRENT ORDERS'] = true then
      begin
        result := true;
        exit;
      end;
      if DMUsers.TblCustomer['CURRENT ORDERS'] = false then
      begin
        result := false;
        exit;
      end;
    end
    else
      DMUsers.TblCustomer.Next;
  end;
end;

function TAccount.GetPassword: string;
begin
  DMUsers.TblCustomer.First;
  while not DMUsers.TblCustomer.Eof do
  begin
    if (TCustomerCode = DMUsers.TblCustomer['CUSTOMER CODE']) then
    begin
      result := DMUsers.TblCustomer['PASSWORD'];
      exit;
    end
    else
      DMUsers.TblCustomer.Next;
  end;
end;

function TAccount.GetSurname: string;
begin
  DMUsers.TblCustomer.First;
  while not DMUsers.TblCustomer.Eof do
  begin
    if (TCustomerCode = DMUsers.TblCustomer['CUSTOMER CODE']) then
    begin
      result := DMUsers.TblCustomer['SURNAME'];
      exit;
    end
    else
      DMUsers.TblCustomer.Next;
  end;
end;

end.
