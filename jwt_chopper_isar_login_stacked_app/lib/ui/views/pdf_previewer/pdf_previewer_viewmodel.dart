import 'dart:io';

import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:jwt_chopper_isar_login_stacked_app/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:file_picker/file_picker.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:web3dart/crypto.dart';

class PdfPreviewerViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  String? pdfFilePath;
  String? pdfHash;
  PDFViewController? pdfViewController;

  void pickFile() async {
    pdfFilePath = null;
    pdfHash = null;
    notifyListeners();
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        allowMultiple: false);
    if (result != null) {
      final file = result.files.single;
      pdfFilePath = file.path;
      final fileRaw = File(pdfFilePath!).readAsBytesSync();
      pdfHash = bytesToHex(keccak256(fileRaw));
      await _dialogService.showDialog(
        title: 'File found!',
        description: '$pdfFilePath',
      );
    } else {
      await _dialogService.showDialog(
        title: 'File not found!',
        description: 'Please try again.',
      );
    }
    notifyListeners();
  }

  void updatePdfViewController(PDFViewController? pdfViewController) {
    this.pdfViewController = pdfViewController;
    notifyListeners();
  }
}
