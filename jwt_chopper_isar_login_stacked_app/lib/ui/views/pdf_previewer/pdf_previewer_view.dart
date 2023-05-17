import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'pdf_previewer_viewmodel.dart';

class PdfPreviewerView extends StackedView<PdfPreviewerViewModel> {
  const PdfPreviewerView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PdfPreviewerViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(title: const Text('PDF Preview'), actions: [
        IconButton(
          icon: const Icon(Icons.file_open),
          onPressed: viewModel.pickFile,
        ),
      ]),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Expanded(
          child: Center(
            child: Text(viewModel.pdfFilePath ?? 'No PDF file selected'),
          ),
        ),
      ),
    );
  }

  @override
  PdfPreviewerViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PdfPreviewerViewModel();
}
