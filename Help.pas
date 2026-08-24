unit Help;

interface

uses
  SysUtils, Dialogs, Math;

type
  THelp = class
  private

  public
    procedure Welcome;
    Procedure UserType;
    Procedure Login;
    procedure CreateAccount;
    procedure CustomerAccount;
    procedure PackageDelivery;
    procedure Hub;
    procedure Reviews;
    procedure UserView;
    procedure ViewCustomerOrder;
    procedure AdminViewReview;
    procedure logs;
    procedure AssignUsers;
    procedure StaffViewOrder;
    procedure StaffAccount;
    procedure ManageOrders;
  end;

implementation

{ THelp }

procedure THelp.AdminViewReview;
begin
  showmessage(
    'You can view the stats of all the reviews. You can sort the reviews to your needs and view and delete the reviews as you require. You cannot edit the details of the reviews to keep the authenticity of the review.');
end;

procedure THelp.AssignUsers;
begin
  showmessage(
    'You can view all available and non-available staff, all the customers with current orders, and you can assign the customers with orders to staff that are currently available.');
end;

procedure THelp.CreateAccount;
begin
  showmessage(
    'Enter all the correct details and click the generate code button to confirm that all the information is correct and to get your personalized customer code, thereafter you may create your account.');
end;

procedure THelp.CustomerAccount;
begin
  showmessage(
    'You can access your account automatically using the information you logged in with and view your info and make changes that you need.');
end;

procedure THelp.Login;
begin
  showmessage(
    'Enter your details to log in, if you do not have an account, click "Create Account", if you have forgotten your details, click "Forgot Details" and enter the required information.');
end;

procedure THelp.logs;
begin
  showmessage(
    'You can view the login date and times of all customers, admins and staff.'
    );
end;

procedure THelp.ManageOrders;
begin
  showmessage(
    'You can see which customers are assigned or not, you can see which staff are available or not and you can assign the available staff to the unassigned customers');
end;

procedure THelp.Hub;
begin
  showmessage('Click on the page you would like to go to');
end;

procedure THelp.PackageDelivery;
begin
  showmessage(
    'Enter all the required details that are shown below and click the done button, thereafter you may choose to make changes or create your reciept');
end;

procedure THelp.Reviews;
begin
  showmessage(
    'Please enter your name and surname, along with all the details asked. Select the amount of stars you wouls like to rate us and leave feedback!');
end;

procedure THelp.StaffAccount;
begin

end;

procedure THelp.StaffViewOrder;
begin
  showmessage(
    'You can view your order details, change order status, unassign yourself from the order and view your own account details by pressing the designated buttons');
end;

procedure THelp.UserType;
begin
  showmessage('Select through which account you would like to log in to.');
end;

procedure THelp.UserView;
begin
  showmessage(
    'You can sort and search the users according to your needs and select each account and edit the information as needed.');
end;

procedure THelp.ViewCustomerOrder;
begin
  showmessage(
    'You can see your order details here and the progress of the order as well as able to cancel your order if needed');
end;

procedure THelp.Welcome;
begin
  showmessage(
    'Click "Continue" to continue to log in, click "About Us", to get more information about us.');
end;

end.
