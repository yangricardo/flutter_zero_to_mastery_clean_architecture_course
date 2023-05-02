import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'users_viewmodel.dart';

class UsersView extends StackedView<UsersViewModel> {
  const UsersView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    UsersViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
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
                                    "${viewModel.data?[index].name}",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    "${viewModel.data?[index].company}",
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              child: Icon(
                                Icons.star,
                                color: Colors.purple[200],
                              ),
                            )
                          ],
                        ),
                      ))
              : Container(
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: Text(
                    viewModel.error.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
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