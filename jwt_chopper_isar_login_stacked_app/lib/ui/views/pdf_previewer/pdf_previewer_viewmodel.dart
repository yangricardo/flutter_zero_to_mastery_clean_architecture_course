import 'package:jwt_chopper_isar_login_stacked_app/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:file_picker/file_picker.dart';
import 'package:stacked_services/stacked_services.dart';

class PdfPreviewerViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  String? pdfFilePath;

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        allowMultiple: false);
    if (result != null) {
      pdfFilePath = result.files.single.path;
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
}
