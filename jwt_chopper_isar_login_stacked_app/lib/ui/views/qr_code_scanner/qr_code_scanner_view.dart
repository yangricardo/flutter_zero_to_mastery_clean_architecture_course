import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:stacked/stacked.dart';

import 'qr_code_scanner_viewmodel.dart';

class QrCodeScannerView extends StackedView<QrCodeScannerViewModel> {
  const QrCodeScannerView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    QrCodeScannerViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Code Scanner')),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Expanded(
                child: MobileScanner(
              fit: BoxFit.contain,
              onDetect: viewModel.onDetect,
              controller: MobileScannerController(
                  detectionSpeed: DetectionSpeed.normal,
                  facing: CameraFacing.back,
                  torchEnabled: false,
                  autoStart: true,
                  formats: [BarcodeFormat.qrCode]),
            )),
            const SizedBox(height: 16),
            Flexible(
              child: Center(
                child: Text(
                  viewModel.pdfHash ?? 'No PDF file selected for hashing',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  QrCodeScannerViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      QrCodeScannerViewModel();
}
