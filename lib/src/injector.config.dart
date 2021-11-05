// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'config/routes/navigation.dart' as _i12;
import 'config/routes/router.dart' as _i6;
import 'core/notifiers/auth_notifier.dart' as _i7;
import 'core/notifiers/notifiers.dart' as _i9;
import 'data/datasources/remote/remote_data_source.dart' as _i13;
import 'data/datasources/remote/remote_data_source_impl.dart' as _i14;
import 'data/repositories/task_repository_impl.dart' as _i19;
import 'data/repositories/user_repository_impl.dart' as _i22;
import 'domain/repositories/task_repository.dart' as _i18;
import 'domain/repositories/user_repository.dart' as _i21;
import 'domain/usecases/auth/auth_user_usecase.dart' as _i24;
import 'domain/usecases/auth/create_user_usecase.dart' as _i26;
import 'domain/usecases/tasks/create_task_usecase.dart' as _i25;
import 'domain/usecases/tasks/delete_task_usecase.dart' as _i27;
import 'domain/usecases/tasks/get_task_by_id_usecase.dart' as _i28;
import 'domain/usecases/tasks/get_task_list_use_case.dart' as _i29;
import 'domain/usecases/tasks/update_task_usecase.dart' as _i20;
import 'domain/usecases/usecases.dart' as _i5;
import 'presentation/blocs/addedittaskbloc/add_edit_task_bloc.dart' as _i3;
import 'presentation/blocs/authbloc/auth_bloc.dart' as _i30;
import 'presentation/blocs/authstayloggedincubit/auth_stay_logged_in_cubit.dart'
    as _i8;
import 'presentation/blocs/blocs.dart' as _i4;
import 'presentation/blocs/credentialtype/credential_type_cubit.dart' as _i10;
import 'presentation/blocs/filtercubit/filter_cubit.dart' as _i11;
import 'presentation/blocs/selectdate/select_date_cubit.dart' as _i15;
import 'presentation/blocs/showtaskcubit/show_task_cubit.dart' as _i16;
import 'presentation/blocs/tasklistbloc/task_list_bloc.dart' as _i17;
import 'presentation/blocs/visibilitypassword/visibility_password_bloc.dart'
    as _i23; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.AddEditTaskBloc>(_i3.AddEditTaskBloc(
      tasksBloc: get<_i4.TaskListBloc>(),
      createTaskUseCase: get<_i5.CreateTaskUseCase>(),
      updateTaskUseCase: get<_i5.UpdateTaskUseCase>()));
  gh.lazySingleton<_i6.AppRouter>(() => _i6.AppRouter());
  gh.singleton<_i7.AuthNotifier>(_i7.AuthNotifier());
  gh.factory<_i8.AuthStateCubit>(
      () => _i8.AuthStateCubit(authNotifier: get<_i9.AuthNotifier>()));
  gh.factory<_i10.CredentialTypeCubit>(() => _i10.CredentialTypeCubit());
  gh.factory<_i11.FilterCubit>(() => _i11.FilterCubit());
  gh.lazySingleton<_i12.NavigationService>(() => _i12.NavigationService());
  gh.lazySingleton<_i13.RemoteDataSource>(
      () => _i14.RemoteDataSourceImpl(get<_i9.AuthNotifier>()));
  gh.factory<_i15.SelectDateCubit>(() => _i15.SelectDateCubit());
  gh.factory<_i16.ShowTaskCubit>(() => _i16.ShowTaskCubit());
  gh.singleton<_i17.TaskListBloc>(_i17.TaskListBloc(
      getTaskListUseCase: get<_i5.GetTaskListUseCase>(),
      deleteTaskUseCase: get<_i5.DeleteTaskUseCase>()));
  gh.lazySingleton<_i18.TaskRepository>(
      () => _i19.TaskRepositoryImpl(get<_i13.RemoteDataSource>()));
  gh.singleton<_i20.UpdateTaskUseCase>(
      _i20.UpdateTaskUseCase(get<_i18.TaskRepository>()));
  gh.lazySingleton<_i21.UserRepository>(
      () => _i22.UserRepositoryImpl(get<_i13.RemoteDataSource>()));
  gh.factory<_i23.VisibilityPasswordBloc>(() => _i23.VisibilityPasswordBloc());
  gh.singleton<_i24.AuthUserUseCase>(
      _i24.AuthUserUseCase(get<_i21.UserRepository>()));
  gh.singleton<_i25.CreateTaskUseCase>(
      _i25.CreateTaskUseCase(get<_i18.TaskRepository>()));
  gh.singleton<_i26.CreateUserUseCase>(
      _i26.CreateUserUseCase(get<_i21.UserRepository>()));
  gh.singleton<_i27.DeleteTaskUseCase>(
      _i27.DeleteTaskUseCase(get<_i18.TaskRepository>()));
  gh.singleton<_i28.GetTaskByIdUseCase>(
      _i28.GetTaskByIdUseCase(get<_i18.TaskRepository>()));
  gh.singleton<_i29.GetTaskListUseCase>(
      _i29.GetTaskListUseCase(get<_i18.TaskRepository>()));
  gh.factory<_i30.AuthBloc>(() => _i30.AuthBloc(
      createUserUseCase: get<_i26.CreateUserUseCase>(),
      authUserUseCase: get<_i24.AuthUserUseCase>()));
  return get;
}
