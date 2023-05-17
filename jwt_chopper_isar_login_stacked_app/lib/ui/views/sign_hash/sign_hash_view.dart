import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'sign_hash_viewmodel.dart';

class SignHashView extends StackedView<SignHashViewModel> {
  final String? pdfHash;
  const SignHashView({Key? key, this.pdfHash}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignHashViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        child: Column(children: [
          Text('PDF Hash: $pdfHash'),
          ElevatedButton(
            onPressed: () => viewModel.signHash(pdfHash!),
            child: const Text('Sign Hash'),
          ),
          if (viewModel.signatureHex != null)
            Text('Signature: ${viewModel.signatureHex}'),
          if (viewModel.isValid != null)
            Text('Signature is valid: ${viewModel.isValid}'),
          if (viewModel.ethereumAddress != null)
            Text('Ethereum Address: ${viewModel.ethereumAddress}'),
        ]),
      ),
    );
  }

  @override
  SignHashViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignHashViewModel();
}
