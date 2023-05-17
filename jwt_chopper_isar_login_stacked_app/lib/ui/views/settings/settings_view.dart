import 'package:flutter/material.dart';
import 'package:jwt_chopper_isar_login_stacked_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'settings_viewmodel.dart';

class SettingsView extends StackedView<SettingsViewModel> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SettingsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Text(viewModel.ethereumAddress ?? 'No Ethereum Address'),
              verticalSpaceMedium,
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red)),
                onPressed: () {
                  viewModel.logout();
                },
                child: const Text('Logout'),
              )
            ],
          )),
    );
  }

  @override
  SettingsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SettingsViewModel();
}
