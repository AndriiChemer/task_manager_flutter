// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i17;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

import '../core/di/network_module.dart' as _i39;
import '../core/di/storage_module.dart' as _i38;
import '../core/notifiers/auth_notifier.dart' as _i4;
import '../core/preferences/preferences.dart' as _i22;
import '../core/routes/navigation.dart' as _i8;
import '../core/routes/router.dart' as _i3;
import 'data/auth/api/auth_api_data_source.dart' as _i19;
import 'data/auth/auth_repository_impl.dart' as _i21;
import 'data/auth/auth_storage_impl.dart' as _i13;
import 'data/network/interceptors/auth_token_interceptor.dart' as _i16;
import 'data/network/interceptors/content_type_interceptor.dart' as _i5;
import 'data/network/interceptors/error_interceptor.dart' as _i7;
import 'data/network/task_manager_dio.dart' as _i18;
import 'data/task/api/models/pagination/pagination_response.dart' as _i9;
import 'data/task/api/models/task/task_response.dart' as _i11;
import 'data/task/api/task_api_data_source.dart' as _i27;
import 'data/task/task_repository_impl.dart' as _i29;
import 'domain/auth/auth_repository.dart' as _i20;
import 'domain/auth/auth_store.dart' as _i12;
import 'domain/auth/use_case/auth_user_usecase.dart' as _i23;
import 'domain/auth/use_case/create_user_usecase.dart' as _i24;
import 'domain/auth/use_case/get_token_usecase.dart' as _i14;
import 'domain/auth/use_case/logout_use_case.dart' as _i15;
import 'domain/task/notifiers/delete_task_notifier.dart' as _i6;
import 'domain/task/task_repository.dart' as _i28;
import 'domain/task/use_case/create_task_usecase.dart' as _i31;
import 'domain/task/use_case/delete_task_usecase.dart' as _i32;
import 'domain/task/use_case/get_task_by_id_usecase.dart' as _i33;
import 'domain/task/use_case/get_task_list_use_case.dart' as _i34;
import 'domain/task/use_case/update_task_usecase.dart' as _i30;
import 'presentation/screens/addedittask/add_edit_task_page_cubit.dart' as _i36;
import 'presentation/screens/auth/login/login_form_page_cubit.dart' as _i25;
import 'presentation/screens/auth/registration/registration_form_page_cubit.dart'
    as _i26;
import 'presentation/screens/taskdetails/task_details_page_cubit.dart' as _i37;
import 'presentation/screens/tasklist/task_list_page_cubit.dart'
    as _i35; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final storageModule = _$StorageModule();
  final networkModule = _$NetworkModule();
  gh.lazySingleton<_i3.AppRouter>(() => _i3.AppRouter());
  gh.singleton<_i4.AuthNotifier>(_i4.AuthNotifier());
  gh.factory<_i5.ContentTypeInterceptor>(() => _i5.ContentTypeInterceptor());
  gh.lazySingleton<_i6.DeleteTaskNotifier>(() => _i6.DeleteTaskNotifier());
  gh.factory<_i7.ErrorInterceptor>(
      () => _i7.ErrorInterceptor(get<_i4.AuthNotifier>()));
  gh.lazySingleton<_i8.NavigationService>(() => _i8.NavigationService());
  gh.factory<_i9.PaginationMapper>(() => _i9.PaginationMapper());
  await gh.factoryAsync<_i10.SharedPreferences>(() => storageModule.prefs,
      preResolve: true);
  gh.factory<_i11.TaskMapper>(() => _i11.TaskMapper());
  gh.singleton<_i12.AuthStore>(
      _i13.AuthStorageImpl(get<_i10.SharedPreferences>()));
  gh.factory<_i14.GetTokenUseCase>(
      () => _i14.GetTokenUseCase(get<_i12.AuthStore>()));
  gh.factory<_i15.LogoutUseCase>(
      () => _i15.LogoutUseCase(get<_i12.AuthStore>()));
  gh.factory<_i16.AuthTokenInterceptor>(
      () => _i16.AuthTokenInterceptor(get<_i14.GetTokenUseCase>()));
  gh.factory<List<_i17.Interceptor>>(() => networkModule.mainInterceptors(
      get<_i16.AuthTokenInterceptor>(),
      get<_i5.ContentTypeInterceptor>(),
      get<_i7.ErrorInterceptor>()));
  gh.singleton<_i18.TaskManagerDio>(
      _i18.TaskManagerDio.create(get<List<_i17.Interceptor>>()));
  gh.singleton<_i19.AuthApiDataSource>(
      _i19.AuthApiDataSource(get<_i18.TaskManagerDio>()));
  gh.lazySingleton<_i20.AuthRepository>(() => _i21.UserRepositoryImpl(
      get<_i19.AuthApiDataSource>(), get<_i22.AuthStorageImpl>()));
  gh.singleton<_i23.AuthUserUseCase>(
      _i23.AuthUserUseCase(get<_i20.AuthRepository>()));
  gh.factory<_i24.CreateUserUseCase>(
      () => _i24.CreateUserUseCase(get<_i20.AuthRepository>()));
  gh.factory<_i25.LoginFormPageCubit>(
      () => _i25.LoginFormPageCubit(get<_i23.AuthUserUseCase>()));
  gh.factory<_i26.RegistrationFormPageCubit>(
      () => _i26.RegistrationFormPageCubit(get<_i24.CreateUserUseCase>()));
  gh.singleton<_i27.TaskApiDataSource>(
      _i27.TaskApiDataSource(get<_i18.TaskManagerDio>()));
  gh.lazySingleton<_i28.TaskRepository>(() => _i29.TaskRepositoryImpl(
      get<_i27.TaskApiDataSource>(),
      get<_i22.FiltersPreferences>(),
      get<_i11.TaskMapper>(),
      get<_i9.PaginationMapper>()));
  gh.singleton<_i30.UpdateTaskUseCase>(
      _i30.UpdateTaskUseCase(get<_i28.TaskRepository>()));
  gh.singleton<_i31.CreateTaskUseCase>(
      _i31.CreateTaskUseCase(get<_i28.TaskRepository>()));
  gh.singleton<_i32.DeleteTaskUseCase>(
      _i32.DeleteTaskUseCase(get<_i28.TaskRepository>()));
  gh.singleton<_i33.GetTaskByIdUseCase>(
      _i33.GetTaskByIdUseCase(get<_i28.TaskRepository>()));
  gh.singleton<_i34.GetTaskListUseCase>(
      _i34.GetTaskListUseCase(get<_i28.TaskRepository>()));
  gh.singleton<_i35.TaskListPageCubit>(_i35.TaskListPageCubit(
      get<_i34.GetTaskListUseCase>(), get<_i15.LogoutUseCase>()));
  gh.factory<_i36.AddEditTaskPageCubit>(() => _i36.AddEditTaskPageCubit(
      get<_i31.CreateTaskUseCase>(),
      get<_i30.UpdateTaskUseCase>(),
      get<_i35.TaskListPageCubit>()));
  gh.factory<_i37.TaskDetailsPageCubit>(() => _i37.TaskDetailsPageCubit(
      get<_i32.DeleteTaskUseCase>(), get<_i35.TaskListPageCubit>()));
  return get;
}

class _$StorageModule extends _i38.StorageModule {}

class _$NetworkModule extends _i39.NetworkModule {}
