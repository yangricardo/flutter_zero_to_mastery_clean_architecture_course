import 'package:advicer_app/domain/usecases/advice.usecases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'advicer_state.dart';

class AdvicerCubit extends Cubit<AdvicerCubitState> {
  AdvicerCubit() : super(AdvicerInitial());
  final AdviceUseCases adviceUseCases = AdviceUseCases();

  void requestAdvice() async {
    emit(AdvicerCubitStateLoading());
    final String advice = await adviceUseCases.getAdvice();
    emit(AdvicerCubitStateLoaded(advice: advice));
  }
}
