import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'sign_up_viewmodel.dart';

@FormView(fields: [
  FormTextField(
    name: 'name',
  ),
  FormTextField(
    name: 'email',
  ),
  FormTextField(
    name: 'password',
  ),
])
class SignUpView extends StackedView<SignUpViewModel> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignUpViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(children: const []),
      ),
    );
  }

  @override
  SignUpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignUpViewModel();
}
