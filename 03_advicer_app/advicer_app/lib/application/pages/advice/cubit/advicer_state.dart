part of 'advicer_cubit.dart';

abstract class AdvicerCubitState extends Equatable {
  const AdvicerCubitState();

  @override
  List<Object?> get props => [];
}

class AdvicerInitial extends AdvicerCubitState {}

class AdvicerCubitStateLoading extends AdvicerCubitState {}

class AdvicerCubitStateLoaded extends AdvicerCubitState {
  final String advice;

  const AdvicerCubitStateLoaded({required this.advice});

  @override
  List<Object?> get props => [advice];
}

class AdvicerCubitStateError extends AdvicerCubitState {
  final String message;

  const AdvicerCubitStateError({required this.message});

  @override
  List<Object?> get props => [message];
}
