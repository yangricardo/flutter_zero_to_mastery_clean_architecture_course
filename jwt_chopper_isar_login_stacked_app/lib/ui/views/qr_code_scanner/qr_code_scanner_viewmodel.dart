import 'dart:typed_data';

import 'package:jwt_chopper_isar_login_stacked_app/app/app.locator.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class QrCodeScannerViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  void onDetect(BarcodeCapture capture) async {
    final List<Barcode> barcodes = capture.barcodes;
    final Uint8List? image = capture.image;
    for (final barcode in barcodes) {
      await _dialogService.showDialog(
        title: 'Barcode found!',
        description: '${barcode.rawValue}',
      );
    }
  }
}
