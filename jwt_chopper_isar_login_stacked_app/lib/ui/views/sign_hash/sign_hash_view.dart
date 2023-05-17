import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'sign_hash_viewmodel.dart';

class SignHashView extends StackedView<SignHashViewModel> {
  const SignHashView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignHashViewModel viewModel,
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
  SignHashViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignHashViewModel();
}
