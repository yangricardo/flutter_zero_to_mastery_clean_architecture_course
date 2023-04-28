import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeViewArguments {
  final int startingIndex;
  HomeViewArguments({
    required this.startingIndex,
  });
}

class HomeView extends StackedView<HomeViewModel> {
  final int startingIndex;

  const HomeView({
    Key? key,
    required this.startingIndex,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Center(
          child: Column(
            children: [
              Center(child: Text('HomeView Starting index $startingIndex')),
              ElevatedButton(
                  onPressed: () {
                    viewModel.logout();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text('Logout'))
            ],
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
