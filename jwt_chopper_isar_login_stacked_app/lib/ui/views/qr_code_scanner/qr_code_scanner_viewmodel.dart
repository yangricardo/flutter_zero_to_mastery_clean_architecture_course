import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:stacked/stacked.dart';

class QrCodeScannerViewModel extends BaseViewModel {
  String? pdfHash;
  void onDetect(BarcodeCapture capture) async {
    final List<Barcode> barcodes = capture.barcodes;
    pdfHash = barcodes.firstOrNull?.rawValue;
    notifyListeners();
  }
}
