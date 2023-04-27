import 'package:equatable/equatable.dart';

enum ValidationStatus { error, success, pending }

class FormValue<T> with EquatableMixin {
  final T value;
  final ValidationStatus validationStatus;

  const FormValue({
    required this.value,
    required this.validationStatus,
  });

  @override
  List<Object?> get props => [value, validationStatus];
}
