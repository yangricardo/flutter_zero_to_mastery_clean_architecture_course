import 'package:jwt_chopper_isar_login_stacked_app/app/app.locator.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class QrCodeScannerViewModel extends BaseViewModel {
  String? pdfHash;

  final _dialogService = locator<DialogService>();
  void onDetect(BarcodeCapture capture) async {
    final List<Barcode> barcodes = capture.barcodes;
    pdfHash = barcodes.firstOrNull?.rawValue;
    await _dialogService.showDialog(
        title: 'PDF Hash',
        description: pdfHash ?? 'No hash detected',
        barrierDismissible: true);
    notifyListeners();
  }
}
