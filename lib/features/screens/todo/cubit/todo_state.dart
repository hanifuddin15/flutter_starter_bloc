part of 'todo_cubit.dart';

enum TodoStatus { initial, loading, added, deleted, updated }

class TodoState extends Equatable {
  final TodoStatus status;
  final bool previousDisconnected;

  const TodoState({
    this.status = TodoStatus.initial,
    this.previousDisconnected = false,
  });

  TodoState copyWith(
      {
        final TodoStatus? status,
        final bool? previousDisconnected
      }) {
    return TodoState(
      status: status ?? this.status,
      previousDisconnected: previousDisconnected ?? this.previousDisconnected,
    );
  }

  @override
  List<Object> get props => [
    status,
    previousDisconnected
  ];
}

