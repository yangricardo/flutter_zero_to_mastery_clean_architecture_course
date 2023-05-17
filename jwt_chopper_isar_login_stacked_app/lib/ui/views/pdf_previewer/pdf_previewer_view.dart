import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
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
        padding: const EdgeInsets.all(25.0),
        child: viewModel.pdfFilePath != null
            ? Column(
                children: [
                  Expanded(
                    child: PDFView(
                      filePath: viewModel.pdfFilePath!,
                      onViewCreated: (PDFViewController viewController) {
                        viewModel.updatePdfViewController(viewController);
                      },
                      enableSwipe: true,
                      autoSpacing: true,
                      fitEachPage: true,
                      defaultPage: 1,
                      fitPolicy: FitPolicy.WIDTH,
                      preventLinkNavigation: true,
                    ),
                  ),
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
              )
            : const Center(child: Text('No PDF file selected')),
      ),
    );
  }

  @override
  PdfPreviewerViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PdfPreviewerViewModel();
}
