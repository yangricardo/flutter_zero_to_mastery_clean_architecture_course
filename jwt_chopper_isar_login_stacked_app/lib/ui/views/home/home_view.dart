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

  // @override
  // Widget builder(
  //   BuildContext context,
  //   HomeViewModel viewModel,
  //   Widget? child,
  // ) {
  //   return Scaffold(
  //     backgroundColor: Colors.blue,
  //     body: Container(
  //       padding: const EdgeInsets.only(left: 25.0, right: 25.0),
  //       child: Center(
  //         child: Stack(
  //           alignment: AlignmentDirectional.bottomEnd,
  //           children: [
  //             viewModel.isLoading == true
  //                 ? const CircularProgressIndicator()
  //                 : ListView.builder(
  //                     itemBuilder: (context, index) {
  //                       if (index >= 0) {
  //                         return Text("${viewModel.users[index].name}");
  //                       }
  //                       return ElevatedButton(
  //                           onPressed: () {
  //                             viewModel.getUsers();
  //                           },
  //                           style: ElevatedButton.styleFrom(
  //                             backgroundColor: Colors.green,
  //                           ),
  //                           child: const Text('Get Users'));
  //                     },
  //                     itemCount: viewModel.users.length,
  //                   ),
  //             Padding(
  //               padding:
  //                   const EdgeInsets.symmetric(vertical: 25.0, horizontal: 0),
  //               child: FloatingActionButton(
  //                   onPressed: () {
  //                     viewModel.getUsers();
  //                   },
  //                   child: const Icon(Icons.refresh)),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey[800],
          currentIndex: model.currentIndex,
          onTap: model.setIndex,
          items: const [
            BottomNavigationBarItem(
              label: 'Posts',
              icon: Icon(Icons.art_track),
            ),
            BottomNavigationBarItem(
              label: 'To DOs',
              icon: Icon(Icons.list),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
