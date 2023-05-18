import 'package:flutter/material.dart';
import 'package:jwt_chopper_isar_login_stacked_app/ui/common/ui_helpers.dart';
import 'package:jwt_chopper_isar_login_stacked_app/ui/views/login/login_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'login_viewmodel.dart';

@FormView(fields: [
  FormTextField(
    name: 'email',
  ),
  FormTextField(
    name: 'password',
  ),
])
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    border: OutlineInputBorder()),
              ),
              verticalSpaceMedium,
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    border: OutlineInputBorder()),
              ),
              verticalSpaceMedium,
              ElevatedButton(
                onPressed: () {
                  viewModel.login();
                },
                child: const Text('Login'),
              ),
              verticalSpaceMedium,
              TextButton(
                onPressed: () {
                  viewModel.goSignUp();
                },
                child: const Text('Sign Up'),
              )
            ],
          )),
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(LoginViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}
