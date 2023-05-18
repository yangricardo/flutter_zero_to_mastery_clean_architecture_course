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
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          IconButton(
            onPressed: () {
              viewModel.logout();
            },
            icon: const Icon(Icons.logout, color: Colors.red),
          )
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
          padding: const EdgeInsets.all(25.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Name',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                verticalSpaceSmall,
                Text(
                  viewModel.name ?? '',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                verticalSpaceMedium,
                Text(
                  'Email',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                verticalSpaceSmall,
                Text(
                  viewModel.email ?? '',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                verticalSpaceMedium,
                Text(
                  'Ethereum Address',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                verticalSpaceSmall,
                Text(
                  viewModel.ethereumAddress ?? 'No Ethereum Address',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          )),
    );
  }

  @override
  SettingsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SettingsViewModel();
}
