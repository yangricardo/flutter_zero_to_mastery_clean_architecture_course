import 'package:advicer_app/domain/entities/advice.entity.dart';
import 'package:advicer_app/domain/usecases/advice.usecases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'advicer_state.dart';

class AdvicerCubit extends Cubit<AdvicerCubitState> {
  AdvicerCubit() : super(AdvicerInitial());
  final AdviceUseCases adviceUseCases = AdviceUseCases();

  void requestAdvice() async {
    emit(AdvicerCubitStateLoading());
    final AdviceEntity advice = await adviceUseCases.getAdvice();
    emit(AdvicerCubitStateLoaded(advice: "${advice.id} - ${advice.advice}"));
  }
}
