unit AdminViewLogs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Help;

type
  TFrmAdminViewLogs = class(TForm)
    ImgViewLogs: TImage;
    LblViewLogs: TLabel;
    LblTime: TLabel;
    BtnClose: TButton;
    BtnHelp: TButton;
    TTime: TTimer;
    PGCLogs: TPageControl;
    TSFirst: TTabSheet;
    TSCustomerLogs: TTabSheet;
    TSStaffLogs: TTabSheet;
    RedSelectLogs: TRichEdit;
    RedStaffLogs: TRichEdit;
    RedCustomerLogs: TRichEdit;
    BtnCustomerEdit: TButton;
    BtnCustomerDone: TButton;
    BtnCustomerUndo: TButton;
    BtnStaffDone: TButton;
    BtnStaffEdit: TButton;
    BtnStaffUndo: TButton;
    TSAdminLogs: TTabSheet;
    RedAdminLogs: TRichEdit;
    BtnAdminDone: TButton;
    BtnAdminEdit: TButton;
    BtnAdminUndo: TButton;
    BtnBack: TButton;
    BtnViewCustomerLogs: TButton;
    BtnViewStaffLogs: TButton;
    BtnViewAdminLogs: TButton;
    BtnViewStaff: TButton;
    BtnViewCustomers: TButton;
    procedure BtnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TTimeTimer(Sender: TObject);
    procedure BtnBackClick(Sender: TObject);
    procedure BtnViewCustomerLogsClick(Sender: TObject);
    procedure BtnViewStaffLogsClick(Sender: TObject);
    procedure BtnViewAdminLogsClick(Sender: TObject);
    procedure PGCLogsChange(Sender: TObject);
    procedure BtnViewCustomersClick(Sender: TObject);
    procedure BtnViewStaffClick(Sender: TObject);
    procedure BtnStaffEditClick(Sender: TObject);
    procedure BtnStaffUndoClick(Sender: TObject);
    procedure BtnStaffDoneClick(Sender: TObject);
    procedure BtnAdminEditClick(Sender: TObject);
    procedure BtnAdminUndoClick(Sender: TObject);
    procedure BtnAdminDoneClick(Sender: TObject);
    procedure BtnCustomerDoneClick(Sender: TObject);
    procedure BtnCustomerEditClick(Sender: TObject);
    procedure BtnHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAdminViewLogs: TFrmAdminViewLogs;
  TStaffLogs: TextFile; // all textfiles for the logs
  TCustomerLogs: TextFile;
  TAdminLogs: TextFile;
  ObjHelp: THelp; // class for the help button

implementation

uses
  AdminHub, AdminCustomerView, AdminStaffView;
{$R *.dfm}

procedure TFrmAdminViewLogs.BtnAdminDoneClick(Sender: TObject);
begin // confirming changes made to the logs
  if MessageDlg('Are you sure about these changes?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
  begin
    rewrite(TAdminLogs);
    Writeln(TAdminLogs, RedAdminLogs.Text);
    CloseFile(TAdminLogs);
    BtnViewAdminLogs.Click;
    BtnAdminDone.Hide;
    BtnAdminUndo.Hide;
    BtnAdminEdit.Show;
    showmessage('Changes have been made');
  end
  else
  begin
    showmessage('Edits have been Canceled');
    BtnAdminDone.Hide;
    BtnAdminUndo.Hide;
    BtnAdminEdit.Show;
  end;
end;

procedure TFrmAdminViewLogs.BtnAdminEditClick(Sender: TObject);
begin // enabling user to make changes
  BtnAdminDone.Show;
  BtnAdminDone.Show;
  BtnAdminDone.Hide;
  RedAdminLogs.ReadOnly := false;
end;

procedure TFrmAdminViewLogs.BtnAdminUndoClick(Sender: TObject);
begin // canceling any changes made
  RedAdminLogs.Clear;
  if FileExists('ADMIN LOGIN LOG.txt') then
    RedAdminLogs.Lines.LoadFromFile('ADMIN LOGIN LOG.txt');
  BtnViewAdminLogs.Click;
end;

procedure TFrmAdminViewLogs.BtnBackClick(Sender: TObject);
begin // to go back to the admin hub
  FrmAdminViewLogs.Hide;
  FrmAdminHub.Show;
end;

procedure TFrmAdminViewLogs.BtnCloseClick(Sender: TObject);
begin // closing the application
  Application.Terminate;
end;

procedure TFrmAdminViewLogs.BtnCustomerDoneClick(Sender: TObject);
begin // confirming changes made to the logs
  if MessageDlg('Are you sure about these changes?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
  begin
    rewrite(TCustomerLogs);
    Writeln(TCustomerLogs, RedCustomerLogs.Text);
    CloseFile(TCustomerLogs);
    BtnViewCustomerLogs.Click;
    BtnCustomerDone.Hide;
    BtnCustomerUndo.Hide;
    BtnCustomerEdit.Show;
    showmessage('Changes have been made');
  end
  else
  begin
    showmessage('Edits have been Canceled');
    BtnViewCustomerLogs.Click;
    BtnCustomerDone.Hide;
    BtnCustomerUndo.Hide;
    BtnCustomerEdit.Show;
  end;
end;

procedure TFrmAdminViewLogs.BtnCustomerEditClick(Sender: TObject);
begin // enabling user to make changes
  BtnCustomerDone.Show;
  BtnCustomerUndo.Show;
  BtnCustomerEdit.Hide;
  RedCustomerLogs.ReadOnly := false;
end;

procedure TFrmAdminViewLogs.BtnHelpClick(Sender: TObject);
begin // showing the help message
  ObjHelp.logs;
end;

procedure TFrmAdminViewLogs.BtnStaffDoneClick(Sender: TObject);
begin // confirming changes made to the logs
  if MessageDlg('Are you sure about these changes?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
  begin
    rewrite(TStaffLogs);
    Writeln(TStaffLogs, RedStaffLogs.Text);
    CloseFile(TStaffLogs);
    BtnViewStaffLogs.Click;
    BtnStaffDone.Hide;
    BtnStaffUndo.Hide;
    BtnStaffEdit.Show;
    showmessage('Changes have been made');
  end
  else
  begin
    showmessage('Edits have been Canceled');
    BtnViewStaffLogs.Click;
    BtnStaffDone.Hide;
    BtnStaffUndo.Hide;
    BtnStaffEdit.Show;
  end;
end;

procedure TFrmAdminViewLogs.BtnStaffEditClick(Sender: TObject);
begin // enabling user to make changes
  BtnStaffDone.Show;
  BtnStaffUndo.Show;
  BtnStaffEdit.Hide;
  RedStaffLogs.ReadOnly := false;
end;

procedure TFrmAdminViewLogs.BtnStaffUndoClick(Sender: TObject);
begin // canceling any changes made
  RedStaffLogs.Clear;
  if FileExists('STAFF LOGIN LOG.txt') then
    RedStaffLogs.Lines.LoadFromFile('STAFF LOGIN LOG.txt');
  RedStaffLogs.ReadOnly := true;
  BtnViewStaffLogs.Click;
end;

procedure TFrmAdminViewLogs.BtnViewAdminLogsClick(Sender: TObject);
begin // view the admin logs
  RedAdminLogs.Clear;
  if FileExists('ADMIN LOGIN LOG.txt') then
    RedAdminLogs.Lines.LoadFromFile('ADMIN LOGIN LOG.txt');
  RedAdminLogs.ReadOnly := true;
  TSAdminLogs.Show;
end;

procedure TFrmAdminViewLogs.BtnViewCustomerLogsClick(Sender: TObject);
begin // view the customer logs
  RedCustomerLogs.Clear;
  if FileExists('CUSTOMER LOGIN LOG.txt') then
    RedCustomerLogs.Lines.LoadFromFile('CUSTOMER LOGIN LOG.txt');
  RedCustomerLogs.ReadOnly := true;
  TSCustomerLogs.Show;
end;

procedure TFrmAdminViewLogs.BtnViewCustomersClick(Sender: TObject);
begin // shpw all customers
  FrmAdminUserView.Show;
  FrmAdminViewLogs.Hide;
end;

procedure TFrmAdminViewLogs.BtnViewStaffClick(Sender: TObject);
begin // view all staff
  FrmAdminViewLogs.Hide;
  FrmAdminStaffView.Show;
end;

procedure TFrmAdminViewLogs.BtnViewStaffLogsClick(Sender: TObject);
var
  TUsers: TextFile;
  sLine: string;
begin // view staff logs
  RedStaffLogs.Clear;
  if FileExists('STAFF LOGIN LOG.txt') then
  begin
    AssignFile(TUsers, 'STAFF LOGIN LOG.txt');
    Reset(TUsers);
    while not Eof(TUsers) do
    begin
      ReadLn(TUsers, sLine);
      RedStaffLogs.Lines.Add(sLine);
    end;
    CloseFile(TUsers);
  end;
  RedStaffLogs.ReadOnly := true;
  TSStaffLogs.Show;
end;

procedure TFrmAdminViewLogs.FormCreate(Sender: TObject);
begin // initialising the form
  FrmAdminViewLogs.BorderStyle := bsnone;
  FrmAdminViewLogs.BorderIcons := [];
  FrmAdminViewLogs.Position := poScreenCenter;
  ImgViewLogs.Stretch := true;
  ImgViewLogs.Picture.LoadFromFile('BACKGROUNDS\VIEW LOGS.jpg');
  ImgViewLogs.Align := Alclient;
  LblViewLogs.Font.Color := clWhite;
  LblTime.Font.Color := clWhite;
  TTime.Interval := 1000;
  TTime.Enabled := true;
  TSFirst.Show;
  RedSelectLogs.Lines.Clear;
  RedStaffLogs.Lines.Clear;
  RedCustomerLogs.Lines.Clear;
  RedSelectLogs.Lines.Add('PLEASE SELECT WHICH LOGS YOU WOULD LIKE TO VIEW');

  RedSelectLogs.ReadOnly := true;
  RedStaffLogs.ReadOnly := true;
  RedCustomerLogs.ReadOnly := true;
  RedAdminLogs.ReadOnly := true;

  AssignFile(TStaffLogs, 'STAFF LOGIN LOG.txt');
  AssignFile(TAdminLogs, 'ADMIN LOGIN LOG.txt');
  AssignFile(TCustomerLogs, 'CUSTOMER LOGIN LOG.txt');

  BtnStaffDone.Hide;
  BtnStaffUndo.Hide;
  BtnCustomerDone.Hide;
  BtnCustomerUndo.Hide;
  BtnAdminDone.Hide;
  BtnAdminUndo.Hide;
end;

procedure TFrmAdminViewLogs.PGCLogsChange(Sender: TObject);
begin // shows the first page
  TSFirst.Show;
end;

procedure TFrmAdminViewLogs.TTimeTimer(Sender: TObject);
begin // shows the current time
  LblTime.Caption := FormatDateTime('hh:nn:ss', Now);
end;

end.
