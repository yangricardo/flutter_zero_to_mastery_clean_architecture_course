import 'package:flutter/material.dart';
import 'package:jwt_chopper_isar_login_stacked_app/app/app.locator.dart';
import 'package:jwt_chopper_isar_login_stacked_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'users_viewmodel.dart';

class UsersView extends StackedView<UsersViewModel> {
  final _navigationService = locator<NavigationService>();

  UsersView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    UsersViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      backgroundColor: Colors.grey[900],
      body: viewModel.isBusy
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.purple[200]),
                  ),
                  const Text(
                    'Loading Users',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            )
          : !viewModel.hasError
              ? ListView.separated(
                  padding: const EdgeInsets.only(top: 55),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                  itemCount: viewModel.data?.length ?? 0,
                  itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                            color: Colors.purple[100],
                            borderRadius: BorderRadius.circular(5)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 20),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    viewModel.data?[index].name ?? '',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    viewModel.data?[index].company?.name ?? '',
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              child: IconButton(
                                  icon: const Icon(Icons.arrow_forward_sharp),
                                  color: Colors.purple[200],
                                  onPressed: () => _navigationService
                                      .navigateToUserDetailView(
                                          index:
                                              viewModel.data?[index].id ?? 0)),
                            )
                          ],
                        ),
                      ))
              : Container(
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: Expanded(
                    child: Text(
                      viewModel.error.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                      maxLines: 20,
                    ),
                  ),
                ),
    );
  }

  @override
  UsersViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UsersViewModel();
}
