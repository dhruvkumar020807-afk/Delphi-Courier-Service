program DK_IT_PAT_2025;

uses
  Forms,
  Welcome in 'Welcome.pas' { FrmWelcome },
  UserType in 'UserType.pas' { FrmUserType },
  AdminLogin in 'AdminLogin.pas' { FrmAdminLogin },
  StaffHub in 'StaffHub.pas' { FrmStaffHub },
  CustomerLogin in 'CustomerLogin.pas' { FrmCustomerLogin },
  CreateAccount in 'CreateAccount.pas' { FrmCreateCustomerAccount },
  DBUsers in 'DBUsers.pas' { DMUsers: TDataModule},
  CustomerHub in 'CustomerHub.pas' { FrmCustomerHub },
  StaffLogin in 'StaffLogin.pas' { FrmStaffLogin },
  CustomerAccount in 'CustomerAccount.pas' { FrmCustomerAccount },
  FindAccount in 'FindAccount.pas',
  PackageDelivery in 'PackageDelivery.pas' { FrmPackageDelivery },
  DBReviews in 'DBReviews.pas' { DMReviews: TDataModule },
  Help in 'Help.pas',
  CustomerReviews in 'CustomerReviews.pas' { FrmCustomerReviews },
  AdminHub in 'AdminHub.pas' { FrmAdminHub },
  AdminCustomerView in 'AdminCustomerView.pas' { FrmAdminUserView },
  StaffViewOrder in 'StaffViewOrder.pas' { FrmStaffViewOrder },
  CustomerViewOrder in 'CustomerViewOrder.pas' { FrmCustomerViewOrder },
  AdminViewOrder in 'AdminViewOrder.pas' { FrmAdminViewOrder },
  AdminViewLogs in 'AdminViewLogs.pas' { FrmAdminViewLogs },
  AdminStaffView in 'AdminStaffView.pas' { FrmAdminStaffView },
  DBOrders in 'DBOrders.pas' { DMOrders: TDataModule },
  AdminViewReviews in 'AdminViewReviews.pas' { FrmAdminViewReviews },
  AdminAllOrdersView in 'AdminAllOrdersView.pas' { FrmAllOrdersView },
  StaffOrder in 'StaffOrder.pas',
  StaffViewAccount in 'StaffViewAccount.pas' {FrmStaffAccount},
  StaffAccount in 'StaffAccount.pas',
  AdminViewAccount in 'AdminViewAccount.pas' {FrmAdminAccount},
  AdminAccount in 'AdminAccount.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDMReviews, DMReview);
  Application.CreateForm(TDMOrders, DMOrders);
  Application.CreateForm(TDMUsers, DMUsers);
  Application.CreateForm(TFrmWelcome, FrmWelcome);
  Application.CreateForm(TFrmCustomerReviews, FrmCustomerReviews);
  Application.CreateForm(TFrmUserType, FrmUserType);
  Application.CreateForm(TFrmAdminLogin, FrmAdminLogin);
  Application.CreateForm(TFrmStaffHub, FrmStaffHub);
  Application.CreateForm(TFrmCustomerLogin, FrmCustomerLogin);
  Application.CreateForm(TFrmCreateCustomerAccount, FrmCreateCustomerAccount);
  Application.CreateForm(TFrmCustomerHub, FrmCustomerHub);
  Application.CreateForm(TFrmStaffLogin, FrmStaffLogin);
  Application.CreateForm(TFrmCustomerAccount, FrmCustomerAccount);
  Application.CreateForm(TFrmPackageDelivery, FrmPackageDelivery);
  Application.CreateForm(TFrmAdminHub, FrmAdminHub);
  Application.CreateForm(TFrmAdminUserView, FrmAdminUserView);
  Application.CreateForm(TFrmAdminViewOrder, FrmAdminViewOrder);
  Application.CreateForm(TFrmCustomerViewOrder, FrmCustomerViewOrder);
  Application.CreateForm(TFrmStaffViewOrder, FrmStaffViewOrder);
  Application.CreateForm(TFrmAdminViewLogs, FrmAdminViewLogs);
  Application.CreateForm(TFrmAdminStaffView, FrmAdminStaffView);
  Application.CreateForm(TFrmAdminViewReviews, FrmAdminViewReviews);
  Application.CreateForm(TFrmAllOrdersView, FrmAllOrdersView);
  Application.CreateForm(TFrmStaffAccount, FrmStaffAccount);
  Application.CreateForm(TFrmAdminAccount, FrmAdminAccount);
  Application.Run;

end.
