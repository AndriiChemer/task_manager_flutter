// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i18;

import '../config/routes/navigation.dart' as _i14;
import '../config/routes/router.dart' as _i6;
import '../core/notifiers/auth_notifier.dart' as _i8;
import '../core/notifiers/notifiers.dart' as _i10;
import '../core/preferences/preferences.dart' as _i13;
import '../core/preferences/shared_preference_module.dart' as _i32;
import 'data/datasources/remote/remote_data_source.dart' as _i15;
import 'data/datasources/remote/remote_data_source_impl.dart' as _i16;
import 'data/repositories/task_repository_impl.dart' as _i22;
import 'data/repositories/user_repository_impl.dart' as _i24;
import 'domain/repositories/repositories.dart' as _i21;
import 'domain/usecases/auth/auth_user_usecase.dart' as _i26;
import 'domain/usecases/auth/create_user_usecase.dart' as _i28;
import 'domain/usecases/tasks/create_task_usecase.dart' as _i27;
import 'domain/usecases/tasks/delete_task_usecase.dart' as _i29;
import 'domain/usecases/tasks/get_task_by_id_usecase.dart' as _i30;
import 'domain/usecases/tasks/get_task_list_use_case.dart' as _i31;
import 'domain/usecases/tasks/update_task_usecase.dart' as _i23;
import 'domain/usecases/usecases.dart' as _i5;
import 'presentation/blocs/addedittaskbloc/add_edit_task_bloc.dart' as _i3;
import 'presentation/blocs/authbloc/auth_bloc.dart' as _i7;
import 'presentation/blocs/authstayloggedincubit/auth_stay_logged_in_cubit.dart'
    as _i9;
import 'presentation/blocs/blocs.dart' as _i4;
import 'presentation/blocs/credentialtype/credential_type_cubit.dart' as _i11;
import 'presentation/blocs/filtercubit/filter_cubit.dart' as _i12;
import 'presentation/blocs/selectdate/select_date_cubit.dart' as _i17;
import 'presentation/blocs/showtaskcubit/show_task_cubit.dart' as _i19;
import 'presentation/blocs/tasklistbloc/task_list_bloc.dart' as _i20;
import 'presentation/blocs/visibilitypassword/visibility_password_bloc.dart'
    as _i25; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final sharedPreferenceModule = _$SharedPreferenceModule();
  gh.lazySingleton<_i3.AddEditTaskBloc>(() => _i3.AddEditTaskBloc(
      tasksBloc: get<_i4.TaskListBloc>(),
      createTaskUseCase: get<_i5.CreateTaskUseCase>(),
      updateTaskUseCase: get<_i5.UpdateTaskUseCase>()));
  gh.lazySingleton<_i6.AppRouter>(() => _i6.AppRouter());
  gh.factory<_i7.AuthBloc>(() => _i7.AuthBloc(
      createUserUseCase: get<_i5.CreateUserUseCase>(),
      authUserUseCase: get<_i5.AuthUserUseCase>()));
  gh.singleton<_i8.AuthNotifier>(_i8.AuthNotifier());
  gh.factory<_i9.AuthStateCubit>(
      () => _i9.AuthStateCubit(authNotifier: get<_i10.AuthNotifier>()));
  gh.factory<_i11.CredentialTypeCubit>(() => _i11.CredentialTypeCubit());
  gh.factory<_i12.FilterCubit>(
      () => _i12.FilterCubit(get<_i13.FiltersPreferences>()));
  gh.lazySingleton<_i14.NavigationService>(() => _i14.NavigationService());
  gh.lazySingleton<_i15.RemoteDataSource>(
      () => _i16.RemoteDataSourceImpl(get<_i10.AuthNotifier>()));
  gh.factory<_i17.SelectDateCubit>(() => _i17.SelectDateCubit());
  await gh.factoryAsync<_i18.SharedPreferences>(
      () => sharedPreferenceModule.prefs,
      preResolve: true);
  gh.factory<_i19.ShowTaskCubit>(() => _i19.ShowTaskCubit());
  gh.lazySingleton<_i20.TaskListBloc>(() => _i20.TaskListBloc(
      getTaskListUseCase: get<_i5.GetTaskListUseCase>(),
      deleteTaskUseCase: get<_i5.DeleteTaskUseCase>()));
  gh.lazySingleton<_i21.TaskRepository>(() => _i22.TaskRepositoryImpl(
      get<_i15.RemoteDataSource>(),
      get<_i13.AuthPreferences>(),
      get<_i13.FiltersPreferences>()));
  gh.singleton<_i23.UpdateTaskUseCase>(
      _i23.UpdateTaskUseCase(get<_i21.TaskRepository>()));
  gh.lazySingleton<_i21.UserRepository>(() => _i24.UserRepositoryImpl(
      get<_i15.RemoteDataSource>(), get<_i13.AuthPreferences>()));
  gh.factory<_i25.VisibilityPasswordBloc>(() => _i25.VisibilityPasswordBloc());
  gh.singleton<_i26.AuthUserUseCase>(
      _i26.AuthUserUseCase(get<_i21.UserRepository>()));
  gh.singleton<_i27.CreateTaskUseCase>(
      _i27.CreateTaskUseCase(get<_i21.TaskRepository>()));
  gh.singleton<_i28.CreateUserUseCase>(
      _i28.CreateUserUseCase(get<_i21.UserRepository>()));
  gh.singleton<_i29.DeleteTaskUseCase>(
      _i29.DeleteTaskUseCase(get<_i21.TaskRepository>()));
  gh.singleton<_i30.GetTaskByIdUseCase>(
      _i30.GetTaskByIdUseCase(get<_i21.TaskRepository>()));
  gh.singleton<_i31.GetTaskListUseCase>(
      _i31.GetTaskListUseCase(get<_i21.TaskRepository>()));
  return get;
}

class _$SharedPreferenceModule extends _i32.SharedPreferenceModule {}
