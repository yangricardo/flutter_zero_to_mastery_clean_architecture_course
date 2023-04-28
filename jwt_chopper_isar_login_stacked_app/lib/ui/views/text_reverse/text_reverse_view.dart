import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'text_reverse_viewmodel.dart';

class TextReverseView extends StackedView<TextReverseViewModel> {
  const TextReverseView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TextReverseViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  TextReverseViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TextReverseViewModel();
}
