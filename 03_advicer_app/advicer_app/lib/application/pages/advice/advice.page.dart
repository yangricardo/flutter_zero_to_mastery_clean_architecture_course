import 'package:advicer_app/application/core/services/theme.service.dart';
import 'package:advicer_app/application/pages/advice/bloc/advicer_bloc.dart';
import 'package:advicer_app/application/pages/advice/widgets/get-advices.button.dart';
import 'package:advicer_app/application/pages/advice/widgets/error.message.dart';
import 'package:advicer_app/application/pages/advice/widgets/advice.field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:provider/provider.dart';

class AdvicerPageWrapperProvider extends StatelessWidget {
  const AdvicerPageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdvicerBloc(),
      child: const AdvicerPage(),
    );
  }
}

class AdvicerPage extends StatelessWidget {
  const AdvicerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Advicer', style: themeData.textTheme.headlineSmall),
        centerTitle: true,
        actions: [
          Switch(
              value: Provider.of<ThemeService>(context).isDarkModeOn,
              onChanged: (_) {
                Provider.of<ThemeService>(context, listen: false).toggleTheme();
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(children: [
          Expanded(
            child: Center(child: BlocBuilder<AdvicerBloc, AdvicerState>(
                builder: (context, state) {
              if (state is AdvicerInitial) {
                return Text('Your advice is waiting for you!',
                    style: themeData.textTheme.headlineSmall);
              } else if (state is AdvicerStateLoading) {
                return CircularProgressIndicator(
                    color: themeData.colorScheme.secondary);
              } else if (state is AdvicerStateLoaded) {
                return AdviceField(advice: state.advice);
              } else if (state is AdvicerStateError) {
                return ErrorMessage(message: state.message);
              }
              return const SizedBox();
            })),
          ),
          const SizedBox(height: 200, child: Center(child: GetAdvicesButton()))
        ]),
      ),
    );
  }
}
