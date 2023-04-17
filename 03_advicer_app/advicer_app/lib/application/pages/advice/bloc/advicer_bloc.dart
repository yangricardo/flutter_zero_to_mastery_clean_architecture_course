import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'advicer_event.dart';
part 'advicer_state.dart';

class AdvicerBloc extends Bloc<AdvicerEvent, AdvicerState> {
  AdvicerBloc() : super(AdvicerInitial()) {
    on<AdviceRequestedEvent>((event, emit) async {
      emit(AdvicerStateLoading());
      // execute business logic
      // like get and advice
      debugPrint('fake get advices triggered');
      await Future.delayed(const Duration(seconds: 3), () {});
      debugPrint('got advice');
      // emit(AdvicerStateLoaded(advice: 'fake advice to teste'));
      emit(AdvicerStateError('error message'));
    });
  }
}
