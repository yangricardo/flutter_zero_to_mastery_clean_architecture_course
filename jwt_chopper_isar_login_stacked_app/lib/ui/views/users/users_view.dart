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
      appBar: AppBar(title: const Text('Users'), actions: [
        IconButton(
          icon: const Icon(Icons.help),
          onPressed: viewModel.showBottomSheet,
        )
      ]),
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
                  padding: const EdgeInsets.all(10),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 8,
                      ),
                  itemCount: viewModel.data?.length ?? 0,
                  itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)),
                      alignment: Alignment.centerLeft,
                      child: Card(
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      viewModel.data?[index].name ?? '',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      viewModel.data?[index].company?.name ??
                                          '',
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                child: IconButton(
                                    icon: const Icon(Icons.arrow_forward_sharp),
                                    onPressed: () => _navigationService
                                        .navigateToUserDetailView(
                                            index: viewModel.data?[index].id ??
                                                0)),
                              )
                            ],
                          ),
                        ),
                      )))
              : Container(
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
