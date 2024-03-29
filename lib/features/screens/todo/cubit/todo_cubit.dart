import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:unsplash_gallery/core/app/app_preference.dart';
import 'package:unsplash_gallery/features/screens/todo/repository/todo_repo_imp.dart';

import '../../../components/custom_refresh/src/smart_refresher.dart';

part 'todo_state.dart';

@injectable
class TodoCubit extends Cubit<TodoState> {
  final TodoRepositoryImp _todoRepositoryImp;
  final AppPreferences _appPreferences;

  TodoCubit(this._todoRepositoryImp, this._appPreferences)
      : super(TodoState());
  RefreshController homeTodayController =
  RefreshController(initialRefresh: false);
  RefreshController homeController = RefreshController(initialRefresh: false);




}
