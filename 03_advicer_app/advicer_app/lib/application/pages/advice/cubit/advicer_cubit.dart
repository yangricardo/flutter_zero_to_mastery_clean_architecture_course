import 'package:advicer_app/domain/failures/failure.dart';
import 'package:advicer_app/domain/usecases/advice.usecases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'advicer_state.dart';

class AdvicerCubit extends Cubit<AdvicerCubitState> {
  final AdviceUseCases adviceUseCases;

  AdvicerCubit({required this.adviceUseCases}) : super(AdvicerInitial());

  void requestAdvice() async {
    emit(AdvicerCubitStateLoading());
    final adviceOrFailure = await adviceUseCases.getAdvice();
    adviceOrFailure.fold(
        (advice) => emit(
            AdvicerCubitStateLoaded(advice: "${advice.id} - ${advice.advice}")),
        (failure) => emit(
            AdvicerCubitStateError(message: mapFailureToMessage(failure))));
  }
}
