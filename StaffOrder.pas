unit StaffOrder;

interface

uses
  SysUtils, Dialogs, Math, DBUsers, DBOrders;

type
  TOrders = class

  private
    TStaffID: string;

  public
    constructor create(sStaffID: string);
    function getCustomerName: string;
    function getCustomerNumber: string;
    function getPackageTo: string;
    function getPickUpLocation: string;
    function getDestination: string;
    function getType: string;
    function getFragile: boolean;
    function getStatus: integer;

  end;

implementation

{ TOrders }

constructor TOrders.create(sStaffID: string);
begin
  TStaffID := sStaffID;
end;

function TOrders.getCustomerName: string;
begin
  DMUsers.TblCustomer.First;
  while not DMUsers.TblCustomer.Eof do
  begin
    if DMUsers.TblCustomer['ASSIGNED STAFF ID'] = TStaffID then
    begin
      Result := DMUsers.TblCustomer['NAME'] + ' ' + DMUsers.TblCustomer['SURNAME'];
      Exit;
    end
    else
    begin
      DMUsers.TblCustomer.Next;
    end;
  end;
end;

function TOrders.getCustomerNumber: string;
begin
  DMUsers.TblCustomer.First;
  while not DMUsers.TblCustomer.Eof do
  begin
    if DMUsers.TblCustomer['ASSIGNED STAFF ID'] = TStaffID then
    begin
      Result := DMUsers.TblCustomer['CELL NUMBER'];
      Exit;
    end
    else
    begin
      DMUsers.TblCustomer.Next;
    end;
  end;
end;

function TOrders.getDestination: string;
begin
  DMOrders.TblOrders.First;
  while not DMOrders.TblOrders.Eof do
  begin
    if DMOrders.TblOrders['STAFF ID'] = TStaffID then
    begin
      Result := DMOrders.TblOrders['PACKAGE DESTINATION'];
      Exit;
    end
    else
    begin
      DMOrders.TblOrders.Next;
    end;
  end;
end;

function TOrders.getFragile: boolean;
begin
  DMOrders.TblOrders.First;
  while not DMOrders.TblOrders.Eof do
  begin
    if DMOrders.TblOrders['STAFF ID'] = TStaffID then
    begin
      Result := DMOrders.TblOrders['FRAGILE'];
      Exit;
    end
    else
    begin
      DMOrders.TblOrders.Next;
    end;
  end;
end;

function TOrders.getPackageTo: string;
begin
  DMOrders.TblOrders.First;
  while not DMOrders.TblOrders.Eof do
  begin
    if DMOrders.TblOrders['STAFF ID'] = TStaffID then
    begin
      Result := DMOrders.TblOrders['PACKAGE TO'];
      Exit;
    end
    else
    begin
      DMOrders.TblOrders.Next;
    end;
  end;
end;

function TOrders.getPickUpLocation: string;
begin
  DMOrders.TblOrders.First;
  while not DMOrders.TblOrders.Eof do
  begin
    if DMOrders.TblOrders['STAFF ID'] = TStaffID then
    begin
      Result := DMOrders.TblOrders['PICK-UP LOCATION'];
      Exit;
    end
    else
    begin
      DMOrders.TblOrders.Next;
    end;
  end;
end;

function TOrders.getStatus: integer;
begin
  DMOrders.TblOrders.First;
  while not DMOrders.TblOrders.Eof do
  begin
    if DMOrders.TblOrders['STAFF ID'] = TStaffID then
    begin
      Result := DMOrders.TblOrders.FieldByName('DELIVERY STATUS').AsInteger;
      Exit;
    end
    else
    begin
      DMOrders.TblOrders.Next;
    end;
  end;
end;

function TOrders.getType: string;
begin
  DMOrders.TblOrders.First;
  while not DMOrders.TblOrders.Eof do
  begin
    if DMOrders.TblOrders['STAFF ID'] = TStaffID then
    begin
      Result := DMOrders.TblOrders['DELIVERY TYPE'];
      Exit;
    end
    else
    begin
      DMOrders.TblOrders.Next;
    end;
  end;
end;

end.

