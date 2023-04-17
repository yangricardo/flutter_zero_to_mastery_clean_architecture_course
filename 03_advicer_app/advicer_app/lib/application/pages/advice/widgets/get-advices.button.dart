import 'package:advicer_app/application/pages/advice/cubit/advicer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAdvicesButton extends StatelessWidget {
  const GetAdvicesButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return InkResponse(
      onTap: () {
        BlocProvider.of<AdvicerCubit>(context).requestAdvice();
      },
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: themeData.colorScheme.secondary),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Text(
              'Get Advice',
              style: themeData.textTheme.headlineSmall,
            ),
          ),
        ),
      ),
    );
  }
}
