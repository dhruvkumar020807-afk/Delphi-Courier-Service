unit ClsHelp;

interface

uses
  SysUtils, Math, Dialogs;

Type
  THelp = class

  private

  public
    Procedure WelcomeHelp;
    Procedure UserTypeHelp;
  end;

implementation

{ THelp }

procedure THelp.UserTypeHelp;
begin

end;

procedure THelp.WelcomeHelp;
begin
  Showmessage('Click the "Continue" button to continue.');
end;

end.
