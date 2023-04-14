import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'advicer_state.dart';

class AdvicerCubit extends Cubit<AdvicerCubitState> {
  AdvicerCubit() : super(AdvicerInitial());

  void requestAdvice() async {
    emit(AdvicerCubitStateLoading());
    // execute business logic
    // like get and advice
    debugPrint('fake get advices triggered');
    await Future.delayed(const Duration(seconds: 3), () {});
    debugPrint('got advice');
    emit(const AdvicerCubitStateLoaded(advice: 'fake advice to test'));
  }
}
