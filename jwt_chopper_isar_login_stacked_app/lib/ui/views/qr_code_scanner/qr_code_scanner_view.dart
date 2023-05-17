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
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: MobileScanner(
          // fit: BoxFit.contain,
          onDetect: viewModel.onDetect,
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
