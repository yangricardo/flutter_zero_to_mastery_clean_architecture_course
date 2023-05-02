import 'package:flutter/material.dart';
import 'package:jwt_chopper_isar_login_stacked_app/ui/views/text_reverse/text_reverse_view.dart';
import 'package:jwt_chopper_isar_login_stacked_app/ui/views/users/users_view.dart';
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
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      body: getViewForIndex(viewModel.currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[800],
        currentIndex: viewModel.currentIndex,
        onTap: viewModel.setIndex,
        items: const [
          BottomNavigationBarItem(
            label: "Users",
            icon: Icon(Icons.person),
          ),
          BottomNavigationBarItem(
            label: 'To DO',
            icon: Icon(Icons.list),
          ),
        ],
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) {
    return HomeViewModel();
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return UsersView();
      case 1:
        return const TextReverseView();
      default:
        return UsersView();
    }
  }
}
