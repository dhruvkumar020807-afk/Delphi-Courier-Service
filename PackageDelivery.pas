unit PackageDelivery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, DBusers, DBOrders, FindAccount, Math,
  Help, Buttons, Printers;

type
  TFrmPackageDelivery = class(TForm)
    ImgPackage: TImage;
    LblPackage: TLabel;
    BtnHelp: TButton;
    BtnClose: TButton;
    BtnBack: TButton;
    EdtName: TEdit;
    EdtHeight: TEdit;
    EdtLength: TEdit;
    EdtWidth: TEdit;
    EdtWeight: TEdit;
    LblName: TLabel;
    LblHeight: TLabel;
    LblWidth: TLabel;
    LblLength: TLabel;
    LblInfo: TLabel;
    LblWeight: TLabel;
    BtnLoad: TButton;
    RedDisplay: TRichEdit;
    CmbTo: TComboBox;
    BtnConfirm: TButton;
    BtnReset: TButton;
    RgpDistance: TRadioGroup;
    LblTo: TLabel;
    EdtTo: TEdit;
    LblPackageInfo: TLabel;
    ImgRectangle: TImage;
    LblReciept: TLabel;
    LblTime: TLabel;
    Ttimer: Ttimer;
    RbtnFragile: TRadioButton;
    CmbFrom: TComboBox;
    BitBtnHint1: TBitBtn;
    BitBtnHint2: TBitBtn;
    BtnPrint: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnBackClick(Sender: TObject);
    procedure BtnLoadClick(Sender: TObject);
    procedure BtnConfirmClick(Sender: TObject);
    procedure BtnResetClick(Sender: TObject);
    procedure RgpDistanceClick(Sender: TObject);
    procedure TtimerTimer(Sender: TObject);
    procedure CmbToChange(Sender: TObject);
    procedure BtnHelpClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtnHint1Click(Sender: TObject);
    procedure BitBtnHint2Click(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
  private
    { Private declarations }
  public { Public declarations }
    sExtractedCustomerCode: string;
  end;

var
  FrmPackageDelivery: TFrmPackageDelivery;
  sarea, sdistance, sordertext, sto, sfrom, scollect: string;
  rfinalprice: real;
  bfragile: boolean;
  ArrDeliveryType: array [0 .. 2, 0 .. 6] of string;
  // double array for dynamic cmb
  ArrLocal: array [0 .. 6] of string = ( // array for local delivery areas
    'Durban Central',
    'Springfield',
    'Pine Town',
    'Durban North',
    'Hillcrest',
    'Westville',
    'Berea'
  );
  ArrDomestic: array [0 .. 6] of string = ( // array for domestic delivery areas
    'Johannesburg',
    'Capetown',
    'Pretoria',
    'Polokwane',
    'Bloemfontein',
    'East London',
    'Port Elizabeth'
  );
  ArrInternational: array [0 .. 6] of string = (
    // array for international delivery areas
    'Nigeria',
    'United States of America',
    'London',
    'Zimbabwe',
    'Dubai',
    'Pakistan',
    'Australia'
  );
  ObjHelp: THelp; // class for the help button
  ObjAccount: TAccount; // class to find the customer

implementation

uses
  CustomerHub, CustomerReviews, CustomerLogin;
{$R *.dfm}

procedure TFrmPackageDelivery.BitBtnHint1Click(Sender: TObject);
begin
  showmessage(
    'Enter your name on the account you have made, the persons name that the package is going to, select the pick-up point that the package must be picked up from, select the type of delivery it is and where the drop-off point is.');
end;

procedure TFrmPackageDelivery.BitBtnHint2Click(Sender: TObject);
begin
  showmessage(
    'Enter the package dimensions, weight and fragility. The program will calculate the final cost with this information.');
end;

procedure TFrmPackageDelivery.BtnBackClick(Sender: TObject);
begin // go back to the customer hub
  FrmPackageDelivery.hide;
  FrmCustomerHub.show;
end;

procedure TFrmPackageDelivery.BtnCloseClick(Sender: TObject);
begin // ask for a review and close the application
  if MessageDlg('Would you like to leave a review?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
  begin
    FrmCustomerReviews.show;
    FrmPackageDelivery.hide;
  end
  else
  begin
    Application.Terminate;
  end;
end;

procedure TFrmPackageDelivery.BtnConfirmClick(Sender: TObject);
var
  TReciept: TextFile;
  sreceipttext, spriceb, spricea, saccountname, saccountsurname, sname: string;
  rpriceb, rpricea: real;
  bfound: boolean;
  ipos: integer;
begin // confirm the order
  bfound := false;
  sname := EdtName.Text;
  ipos := pos(' ', sname);
  saccountname := copy(sname, 1, ipos - 1);
  saccountsurname := copy(sname, ipos + 1, length(sname));
  if MessageDlg('Are you sure these are the correct dimensions and details.',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DMUsers.TblCustomer.First;
    while not DMUsers.TblCustomer.Eof do
    begin
      if (saccountname = DMUsers.TblCustomer['NAME']) and
        (saccountsurname = DMUsers.TblCustomer['SURNAME']) then
      begin
        BtnConfirm.hide;
        BtnPrint.show;
        BtnLoad.show;
        sreceipttext := RedDisplay.Text;
        showmessage('Your Receipt named "' + sExtractedCustomerCode +
            '" has been created');
        AssignFile(TReciept, sExtractedCustomerCode + '.txt');
        Rewrite(TReciept);
        Writeln(TReciept, sreceipttext);
        CloseFile(TReciept);

        bfound := true;
        rpricea := 0;
        rpriceb := 0;

        DMOrders.TblOrders.Append;
        DMOrders.TblOrders['CUSTOMER CODE'] := sExtractedCustomerCode;
        DMOrders.TblOrders['PACKAGE FROM'] := sname;
        DMOrders.TblOrders['PACKAGE TO'] := sto;
        DMOrders.TblOrders['DELIVERY TYPE'] := sdistance;
        DMOrders.TblOrders['DELIVERY STATUS'] := 1;
        DMOrders.TblOrders['FRAGILE'] := bfragile;
        DMOrders.TblOrders['STAFF ID'] := '-';
        DMOrders.TblOrders['PICK-UP LOCATION'] := sfrom;
        DMOrders.TblOrders['PACKAGE DESTINATION'] := sarea;
        DMOrders.TblOrders.Post;

        showmessage('ORDER DONE');
        rpriceb := DMUsers.TblCustomer['AMOUNT OWED'];
        rpricea := rpriceb + rfinalprice;
        DMUsers.TblCustomer.Edit;
        DMUsers.TblCustomer['AMOUNT OWED'] := rpricea;
        DMUsers.TblCustomer['CURRENT ORDERS'] := true;
        DMUsers.TblCustomer['ASSIGNED STAFF ID'] := null;
        DMUsers.TblCustomer.Post;
        BREAK;
      end
      else
      begin
        DMUsers.TblCustomer.Next;
      end;
    end;
    if (DMUsers.TblCustomer.Eof) and (bfound = false) then
    begin
      showmessage('User Not Found');
    end;

  end
  else
    showmessage('Order Not Processed');
end;

procedure TFrmPackageDelivery.BtnHelpClick(Sender: TObject);
begin // shows the help message
  ObjHelp.PackageDelivery;
end;

procedure TFrmPackageDelivery.BtnLoadClick(Sender: TObject);
var
  sname, saccountname, saccountsurname: string;
  rweight, rheight, rwidth, rlength, rprice, rvolume, rVAT, rfragileprice: real;
  idistance, ipos: integer;
  bfound: boolean;
begin // loads the order and saves it to a text file
  if (EdtName.Text = '') or (EdtHeight.Text = '') or (EdtLength.Text = '') or
    (EdtWidth.Text = '') or (EdtWeight.Text = '') or (CmbTo.ItemIndex < 0) or
    (EdtTo.Text = '') or (RgpDistance.ItemIndex = -1) or
    (CmbFrom.ItemIndex < 0) then
  begin
    showmessage(
      'Please make sure to enter all details and select all the correct information');
    Exit;
  end;

  idistance := RgpDistance.ItemIndex;
  rfragileprice := 0;
  rprice := 0;
  rVAT := 0;
  rfinalprice := 0;
  RedDisplay.Clear;
  bfound := false;

  sname := EdtName.Text;
  ipos := pos(' ', sname);
  saccountname := copy(sname, 1, ipos - 1);
  saccountsurname := copy(sname, ipos + 1, length(sname));

  DMUsers.TblCustomer.First;
  while not DMUsers.TblCustomer.Eof do
  begin
    if (saccountname = DMUsers.TblCustomer['NAME']) and
      (saccountsurname = DMUsers.TblCustomer['SURNAME']) then
    begin
      sExtractedCustomerCode := DMUsers.TblCustomer['CUSTOMER CODE'];
      // Assign here
      bfound := true;
      BREAK;
    end
    else
      DMUsers.TblCustomer.Next;
  end;

  if not bfound then
  begin
    showmessage(
      'Your Name could not be recognised, make sure you have entered your name correctly and that you have an account');
    EdtName.Text := '';
    Exit;
  end;
  if bfound = true then
  begin
    if RbtnFragile.Checked = true then
    begin
      bfragile := true;
      rfragileprice := 50;
    end;
    if RbtnFragile.Checked = false then
    begin
      bfragile := false;
      rfragileprice := 0;
    end;
    LblReciept.show;
    RedDisplay.show;
    BtnConfirm.show;
    BtnReset.show;
    BtnLoad.hide;
    sfrom := CmbFrom.Text;
    sto := EdtTo.Text;
    rweight := strtofloat(EdtWeight.Text);
    rheight := strtofloat(EdtHeight.Text);
    rwidth := strtofloat(EdtWidth.Text);
    rlength := strtofloat(EdtLength.Text);
    rvolume := rlength * rwidth * rheight;
    if idistance = 0 then
    begin
      rprice := ((rvolume + rweight) / 1000) * 10;
    end;
    if idistance = 1 then
    begin
      rprice := ((rvolume + rweight) / 1000) * 30;
    end;
    if idistance = 2 then
    begin
      rprice := ((rvolume + rweight) / 1000) * 100;
    end;
    rVAT := rprice / 100 * 15;
    rfinalprice := rVAT + rprice;
    if bfragile = true then
    begin
      rfinalprice := rfinalprice + rfragileprice;
    end;
    RedDisplay.Lines.Add(#9 + '***DELIVERY RECIEPT***');
    RedDisplay.Lines.Add('Ordered By: ' + #9 + sname);
    RedDisplay.Lines.Add('Delivery To: ' + #9 + sto);
    RedDisplay.Lines.Add('Package details: ' + #9 + FloatToStrF(rlength,
        fffixed, 8, 2) + 'cm x ' + FloatToStrF(rwidth, fffixed, 8,
        2) + 'cm x ' + FloatToStrF(rheight, fffixed, 8, 2) + 'cm');
    RedDisplay.Lines.Add('Volume: ' + #9 + #9 + FloatToStrF(rvolume, fffixed,
        8, 2) + 'cm²');
    RedDisplay.Lines.Add('Weight: ' + #9 + #9 + FloatToStrF(rweight, fffixed,
        8, 2) + 'Kg');
    RedDisplay.Lines.Add('Collection Zone:' + #9 + sfrom);
    RedDisplay.Lines.Add('Delivery Type:' + #9 + sdistance);
    RedDisplay.Lines.Add('Delivery Zone:' + #9 + sarea);
    RedDisplay.Lines.Add('Fragile Package Fee:' + #9 + FloatToStrF
        (rfragileprice, ffCurrency, 8, 2));
    RedDisplay.Lines.Add('Price before VAT: ' + #9 + #9 + FloatToStrF(rprice,
        ffCurrency, 8, 2));
    RedDisplay.Lines.Add('Total VAT: ' + #9 + #9 + FloatToStrF(rVAT,
        ffCurrency, 8, 2));
    RedDisplay.Lines.Add('Final Price after VAT: ' + #9 + FloatToStrF
        (rfinalprice, ffCurrency, 8, 2));
  end;
end;

procedure TFrmPackageDelivery.BtnPrintClick(Sender: TObject);
var
  i, y: integer;
begin // print the reciept
  if MessageDlg('Are you sure you want to print this reciept?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
  begin
    Printer.BeginDoc;
    Printer.Canvas.Font.Name := 'Courier New';
    Printer.Canvas.Font.Size := 10;

    y := 100;
    for i := 0 to RedDisplay.Lines.Count - 1 do
    begin
      Printer.Canvas.TextOut(100, y, RedDisplay.Lines[i]);
      Inc(y, 100);
    end;

    Printer.EndDoc;
  end
  else
  begin
    showmessage('Printing procedure canceled.');
  end;
end;

procedure TFrmPackageDelivery.BtnResetClick(Sender: TObject);
begin // resets the form
  RedDisplay.hide;
  LblReciept.hide;
  BtnLoad.show;
  BtnReset.hide;
  BtnConfirm.hide;
  RedDisplay.Clear;
  EdtName.Text := '';
  EdtHeight.Text := '';
  EdtLength.Text := '';
  EdtWidth.Text := '';
  EdtWeight.Text := '';
  CmbTo.ItemIndex := -1;
  RgpDistance.ItemIndex := -1;
  EdtTo.Text := '';
  RbtnFragile.Checked := false;
  CmbFrom.ItemIndex := -1;

end;

procedure TFrmPackageDelivery.CmbToChange(Sender: TObject);
var
  iarea: integer;
begin
  iarea := CmbTo.ItemIndex;
  sarea := CmbTo.Items[iarea];
end;

procedure TFrmPackageDelivery.FormCreate(Sender: TObject);
var
  i, j, k: integer;
begin // initialising the form
  FrmPackageDelivery.BorderStyle := bsnone;
  FrmPackageDelivery.BorderIcons := [];
  FrmPackageDelivery.Position := poScreenCenter;
  LblPackage.Font.Color := clwhite;
  LblName.Font.Color := clwhite;
  LblHeight.Font.Color := clwhite;
  LblWidth.Font.Color := clwhite;
  LblLength.Font.Color := clwhite;
  LblInfo.Font.Color := clwhite;
  LblWeight.Font.Color := clwhite;
  BtnConfirm.hide;
  BtnReset.hide;
  BtnPrint.hide;
  EdtName.Text := '';
  EdtHeight.Text := '';
  EdtLength.Text := '';
  EdtWidth.Text := '';
  EdtWeight.Text := '';
  EdtTo.Text := '';
  RedDisplay.Clear;
  ImgPackage.Stretch := true;
  ImgPackage.Picture.LoadFromFile('BACKGROUNDS\PACKAGE.jpg');
  LblPackage.Font.Color := clwhite;
  ImgPackage.Align := Alclient;
  ImgRectangle.Stretch := true;
  ImgRectangle.Picture.LoadFromFile('BACKGROUNDS\RECTANGULAR PRISM.jpg');
  LblReciept.Font.Color := clwhite;
  LblTo.Font.Color := clwhite;
  LblPackageInfo.Font.Color := clwhite;
  LblReciept.hide;
  RedDisplay.hide;
  LblTime.Font.Color := clwhite;
  Ttimer.Interval := 1000;
  Ttimer.Enabled := true;
  RbtnFragile.Font.Color := clwhite;
  for i := Low(ArrLocal) to High(ArrLocal) do
  begin
    CmbFrom.Items.Add(ArrLocal[i]);
  end;
  DMUsers.TblCustomer.First;
  while not DMUsers.TblCustomer.Eof do
  begin
    if DMUsers.TblCustomer['CUSTOMER CODE']
      = FrmCustomerLogin.scustomercode then
    begin
      EdtName.Text := DMUsers.TblCustomer['NAME'] + ' ' + DMUsers.TblCustomer
        ['SURNAME'];
      BREAK;
    end
    else
    begin
      DMUsers.TblCustomer.Next;
    end;
  end;

  // j = 0 is Local
  // j = 1 is Domestic
  // j = 2 is International
  for j := 0 to 2 do
  begin
    case j of
      0:
        begin
          for k := 0 to 6 do
          begin
            ArrDeliveryType[j, k] := ArrLocal[k];
          end;
        end;

      1:
        begin
          for k := 0 to 6 do
          begin
            ArrDeliveryType[j, k] := ArrDomestic[k];
          end;
        end;

      2:
        begin
          for k := 0 to 6 do
          begin
            ArrDeliveryType[j, k] := ArrInternational[k];
          end;
        end;
    end;
  end;
end;

procedure TFrmPackageDelivery.FormShow(Sender: TObject);
begin // initialising the edtname
  ObjAccount := TAccount.Create(FrmCustomerLogin.scustomercode);
  EdtName.Text := ObjAccount.GetName + ' ' + ObjAccount.GetSurname;
end;

procedure TFrmPackageDelivery.RgpDistanceClick(Sender: TObject);
var
  i, j: integer;
begin // showing the destination options dynamically
  CmbTo.Items.Clear;
  j := RgpDistance.ItemIndex;
  case j of
    0:
      begin
        sdistance := 'Local';
        for i := 0 to 6 do
        begin
          CmbTo.Items.Add(ArrDeliveryType[j, i])
        end;
      end;
    1:
      begin
        sdistance := 'Domestic';
        for i := 0 to 6 do
        begin
          CmbTo.Items.Add(ArrDeliveryType[j, i])
        end;
      end;
    2:
      begin
        sdistance := 'International';
        for i := 0 to 6 do
        begin
          CmbTo.Items.Add(ArrDeliveryType[j, i])
        end;
      end;
  end;
end;

procedure TFrmPackageDelivery.TtimerTimer(Sender: TObject);
begin // showing the current time
  LblTime.Caption := FormatDateTime('hh:nn:ss', Now);
end;

end.
