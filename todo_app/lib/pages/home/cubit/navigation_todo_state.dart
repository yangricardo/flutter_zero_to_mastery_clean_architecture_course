part of 'navigation_todo_cubit.dart';

class NavigationTodoState extends Equatable {
  final CollectionId? selectedCollectionId;
  final bool? isSecondBodyDisplayed;
  const NavigationTodoState({
    this.selectedCollectionId,
    this.isSecondBodyDisplayed,
  });

  @override
  List<Object?> get props => [selectedCollectionId, isSecondBodyDisplayed];
}
