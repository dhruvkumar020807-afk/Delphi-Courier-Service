unit UserView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids;

type
  TForm1 = class(TForm)
    Image1: TImage;
    LblUserView: TLabel;
    BtnHelp: TButton;
    BtnClose: TButton;
    BtnBack: TButton;
    LblTime: TLabel;
    TTime: TTimer;
    DBGUsers: TDBGrid;
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnBackClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TTimeTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

Uses
  AdminHub;
{$R *.dfm}

procedure TForm1.BtnBackClick(Sender: TObject);
begin
  Form1.Hide;
  Form8.Show;
end;

procedure TForm1.BtnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  LblUserView.Font.Color := clWhite;
  LblTime.Font.Color := clWhite;
  TTime.Interval := 1000;
  TTime.Enabled := true;
  DBGUsers.Enabled := true;
end;

procedure TForm1.TTimeTimer(Sender: TObject);
begin
  LblTime.Caption := FormatDateTime('hh:nn:ss', Now);
end;

end.
