import 'package:jwt_chopper_isar_login_stacked_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:jwt_chopper_isar_login_stacked_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:jwt_chopper_isar_login_stacked_app/ui/views/home/home_view.dart';
import 'package:jwt_chopper_isar_login_stacked_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:jwt_chopper_isar_login_stacked_app/ui/views/counter/counter_view.dart';
import 'package:jwt_chopper_isar_login_stacked_app/ui/views/login/login_view.dart';
import 'package:jwt_chopper_isar_login_stacked_app/services/authentication_service.dart';
import 'package:jwt_chopper_isar_login_stacked_app/ui/views/text_reverse/text_reverse_view.dart';
import 'package:jwt_chopper_isar_login_stacked_app/services/api_service.dart';
import 'package:jwt_chopper_isar_login_stacked_app/ui/views/users/users_view.dart';
import 'package:jwt_chopper_isar_login_stacked_app/ui/views/user_detail/user_detail_view.dart';
import 'package:jwt_chopper_isar_login_stacked_app/ui/views/settings/settings_view.dart';
import 'package:jwt_chopper_isar_login_stacked_app/services/local_data_service.dart';
import 'package:jwt_chopper_isar_login_stacked_app/ui/views/sign_up/sign_up_view.dart';
import 'package:jwt_chopper_isar_login_stacked_app/services/web3_service.dart';
import 'package:jwt_chopper_isar_login_stacked_app/ui/views/qr_code_scanner/qr_code_scanner_view.dart';
import 'package:jwt_chopper_isar_login_stacked_app/ui/views/pdf_previewer/pdf_previewer_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView),
    CustomRoute(
        page: HomeView,
        transitionsBuilder: TransitionsBuilders.slideRightWithFade),
    CustomRoute(
        page: LoginView,
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade),
    MaterialRoute(page: CounterView),
    MaterialRoute(page: TextReverseView),
    MaterialRoute(page: UsersView),
    MaterialRoute(page: UserDetailView),
    MaterialRoute(page: SettingsView),
    MaterialRoute(page: SignUpView),
    MaterialRoute(page: QrCodeScannerView),
    MaterialRoute(page: PdfPreviewerView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthenticationService),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: LocalDataService),
    LazySingleton(classType: Web3Service),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
