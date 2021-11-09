// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i16;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

import '../core/di/network_module.dart' as _i38;
import '../core/di/storage_module.dart' as _i37;
import '../core/notifiers/auth_notifier.dart' as _i4;
import '../core/preferences/preferences.dart' as _i21;
import '../core/routes/navigation.dart' as _i8;
import '../core/routes/router.dart' as _i3;
import 'data/auth/api/auth_api_data_source.dart' as _i18;
import 'data/auth/auth_repository_impl.dart' as _i20;
import 'data/auth/auth_storage_impl.dart' as _i13;
import 'data/network/interceptors/auth_token_interceptor.dart' as _i15;
import 'data/network/interceptors/content_type_interceptor.dart' as _i5;
import 'data/network/interceptors/error_interceptor.dart' as _i7;
import 'data/network/task_manager_dio.dart' as _i17;
import 'data/task/api/models/pagination/pagination_response.dart' as _i9;
import 'data/task/api/models/task/task_response.dart' as _i11;
import 'data/task/api/task_api_data_source.dart' as _i26;
import 'data/task/task_repository_impl.dart' as _i28;
import 'domain/auth/auth_repository.dart' as _i19;
import 'domain/auth/auth_store.dart' as _i12;
import 'domain/auth/use_case/auth_user_usecase.dart' as _i22;
import 'domain/auth/use_case/create_user_usecase.dart' as _i23;
import 'domain/auth/use_case/get_token_usecase.dart' as _i14;
import 'domain/task/notifiers/delete_task_notifier.dart' as _i6;
import 'domain/task/task_repository.dart' as _i27;
import 'domain/task/use_case/create_task_usecase.dart' as _i30;
import 'domain/task/use_case/delete_task_usecase.dart' as _i31;
import 'domain/task/use_case/get_task_by_id_usecase.dart' as _i32;
import 'domain/task/use_case/get_task_list_use_case.dart' as _i33;
import 'domain/task/use_case/update_task_usecase.dart' as _i29;
import 'presentation/screens/addedittask/add_edit_task_page_cubit.dart' as _i35;
import 'presentation/screens/auth/login/login_form_page_cubit.dart' as _i24;
import 'presentation/screens/auth/registration/registration_form_page_cubit.dart'
    as _i25;
import 'presentation/screens/taskdetails/task_details_page_cubit.dart' as _i36;
import 'presentation/screens/tasklist/task_list_page_cubit.dart'
    as _i34; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i15.AuthTokenInterceptor>(
      () => _i15.AuthTokenInterceptor(get<_i14.GetTokenUseCase>()));
  gh.factory<List<_i16.Interceptor>>(() => networkModule.mainInterceptors(
      get<_i15.AuthTokenInterceptor>(),
      get<_i5.ContentTypeInterceptor>(),
      get<_i7.ErrorInterceptor>()));
  gh.singleton<_i17.TaskManagerDio>(
      _i17.TaskManagerDio.create(get<List<_i16.Interceptor>>()));
  gh.singleton<_i18.AuthApiDataSource>(
      _i18.AuthApiDataSource(get<_i17.TaskManagerDio>()));
  gh.lazySingleton<_i19.AuthRepository>(() => _i20.UserRepositoryImpl(
      get<_i18.AuthApiDataSource>(), get<_i21.AuthStorageImpl>()));
  gh.singleton<_i22.AuthUserUseCase>(
      _i22.AuthUserUseCase(get<_i19.AuthRepository>()));
  gh.factory<_i23.CreateUserUseCase>(
      () => _i23.CreateUserUseCase(get<_i19.AuthRepository>()));
  gh.factory<_i24.LoginFormPageCubit>(
      () => _i24.LoginFormPageCubit(get<_i22.AuthUserUseCase>()));
  gh.factory<_i25.RegistrationFormPageCubit>(
      () => _i25.RegistrationFormPageCubit(get<_i23.CreateUserUseCase>()));
  gh.singleton<_i26.TaskApiDataSource>(
      _i26.TaskApiDataSource(get<_i17.TaskManagerDio>()));
  gh.lazySingleton<_i27.TaskRepository>(() => _i28.TaskRepositoryImpl(
      get<_i26.TaskApiDataSource>(),
      get<_i21.FiltersPreferences>(),
      get<_i11.TaskMapper>(),
      get<_i9.PaginationMapper>()));
  gh.singleton<_i29.UpdateTaskUseCase>(
      _i29.UpdateTaskUseCase(get<_i27.TaskRepository>()));
  gh.singleton<_i30.CreateTaskUseCase>(
      _i30.CreateTaskUseCase(get<_i27.TaskRepository>()));
  gh.singleton<_i31.DeleteTaskUseCase>(
      _i31.DeleteTaskUseCase(get<_i27.TaskRepository>()));
  gh.singleton<_i32.GetTaskByIdUseCase>(
      _i32.GetTaskByIdUseCase(get<_i27.TaskRepository>()));
  gh.singleton<_i33.GetTaskListUseCase>(
      _i33.GetTaskListUseCase(get<_i27.TaskRepository>()));
  gh.singleton<_i34.TaskListPageCubit>(
      _i34.TaskListPageCubit(get<_i33.GetTaskListUseCase>()));
  gh.factory<_i35.AddEditTaskPageCubit>(() => _i35.AddEditTaskPageCubit(
      get<_i30.CreateTaskUseCase>(),
      get<_i29.UpdateTaskUseCase>(),
      get<_i34.TaskListPageCubit>()));
  gh.factory<_i36.TaskDetailsPageCubit>(() => _i36.TaskDetailsPageCubit(
      get<_i31.DeleteTaskUseCase>(), get<_i34.TaskListPageCubit>()));
  return get;
}

class _$StorageModule extends _i37.StorageModule {}

class _$NetworkModule extends _i38.NetworkModule {}
