// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i24;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

import '../core/di/network_module.dart' as _i46;
import '../core/di/storage_module.dart' as _i45;
import '../core/notifiers/auth_notifier.dart' as _i4;
import '../core/preferences/preferences.dart' as _i29;
import '../core/routes/navigation.dart' as _i8;
import '../core/routes/router.dart' as _i3;
import 'data/auth/api/auth_api_data_source.dart' as _i26;
import 'data/auth/auth_repository_impl.dart' as _i28;
import 'data/auth/auth_storage_impl.dart' as _i13;
import 'data/filter/filter_database.dart' as _i14;
import 'data/filter/filter_store_impl.dart' as _i16;
import 'data/network/interceptors/auth_token_interceptor.dart' as _i22;
import 'data/network/interceptors/content_type_interceptor.dart' as _i5;
import 'data/network/interceptors/error_interceptor.dart' as _i7;
import 'data/network/task_manager_dio.dart' as _i25;
import 'data/task/api/models/pagination/pagination_response.dart' as _i9;
import 'data/task/api/models/task/task_response.dart' as _i11;
import 'data/task/api/task_api_data_source.dart' as _i34;
import 'data/task/task_repository_impl.dart' as _i36;
import 'domain/auth/auth_repository.dart' as _i27;
import 'domain/auth/auth_store.dart' as _i12;
import 'domain/auth/use_case/auth_user_usecase.dart' as _i30;
import 'domain/auth/use_case/create_user_usecase.dart' as _i31;
import 'domain/auth/use_case/get_token_usecase.dart' as _i17;
import 'domain/auth/use_case/logout_use_case.dart' as _i19;
import 'domain/filter/filter_store.dart' as _i15;
import 'domain/filter/use_case/load_filter_data_use_case.dart' as _i18;
import 'domain/filter/use_case/set_order_by_use_case.dart' as _i20;
import 'domain/filter/use_case/set_sort_by_use_case.dart' as _i21;
import 'domain/task/notifiers/delete_task_notifier.dart' as _i6;
import 'domain/task/task_repository.dart' as _i35;
import 'domain/task/use_case/create_task_usecase.dart' as _i38;
import 'domain/task/use_case/delete_task_usecase.dart' as _i39;
import 'domain/task/use_case/get_task_by_id_usecase.dart' as _i40;
import 'domain/task/use_case/get_task_list_use_case.dart' as _i41;
import 'domain/task/use_case/update_task_usecase.dart' as _i37;
import 'presentation/screens/addedittask/add_edit_task_page_cubit.dart' as _i43;
import 'presentation/screens/auth/login/login_form_page_cubit.dart' as _i32;
import 'presentation/screens/auth/registration/registration_form_page_cubit.dart'
    as _i33;
import 'presentation/screens/filters/filter_page_cubit.dart' as _i23;
import 'presentation/screens/taskdetails/task_details_page_cubit.dart' as _i44;
import 'presentation/screens/tasklist/task_list_page_cubit.dart'
    as _i42; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i14.FilterDatabase>(
      () => _i14.FilterDatabase(get<_i10.SharedPreferences>()));
  gh.lazySingleton<_i15.FilterStore>(
      () => _i16.FilterStoreImpl(get<_i14.FilterDatabase>()));
  gh.factory<_i17.GetTokenUseCase>(
      () => _i17.GetTokenUseCase(get<_i12.AuthStore>()));
  gh.factory<_i18.LoadFilterDataUseCase>(
      () => _i18.LoadFilterDataUseCase(get<_i15.FilterStore>()));
  gh.factory<_i19.LogoutUseCase>(
      () => _i19.LogoutUseCase(get<_i12.AuthStore>()));
  gh.factory<_i20.SetOrderByUseCase>(
      () => _i20.SetOrderByUseCase(get<_i15.FilterStore>()));
  gh.factory<_i21.SetSortByUseCase>(
      () => _i21.SetSortByUseCase(get<_i15.FilterStore>()));
  gh.factory<_i22.AuthTokenInterceptor>(
      () => _i22.AuthTokenInterceptor(get<_i17.GetTokenUseCase>()));
  gh.factory<_i23.FilterPageCubit>(() => _i23.FilterPageCubit(
      get<_i18.LoadFilterDataUseCase>(),
      get<_i20.SetOrderByUseCase>(),
      get<_i21.SetSortByUseCase>()));
  gh.factory<List<_i24.Interceptor>>(() => networkModule.mainInterceptors(
      get<_i22.AuthTokenInterceptor>(),
      get<_i5.ContentTypeInterceptor>(),
      get<_i7.ErrorInterceptor>()));
  gh.singleton<_i25.TaskManagerDio>(
      _i25.TaskManagerDio.create(get<List<_i24.Interceptor>>()));
  gh.singleton<_i26.AuthApiDataSource>(
      _i26.AuthApiDataSource(get<_i25.TaskManagerDio>()));
  gh.lazySingleton<_i27.AuthRepository>(() => _i28.UserRepositoryImpl(
      get<_i26.AuthApiDataSource>(), get<_i29.AuthStorageImpl>()));
  gh.singleton<_i30.AuthUserUseCase>(
      _i30.AuthUserUseCase(get<_i27.AuthRepository>()));
  gh.factory<_i31.CreateUserUseCase>(
      () => _i31.CreateUserUseCase(get<_i27.AuthRepository>()));
  gh.factory<_i32.LoginFormPageCubit>(
      () => _i32.LoginFormPageCubit(get<_i30.AuthUserUseCase>()));
  gh.factory<_i33.RegistrationFormPageCubit>(
      () => _i33.RegistrationFormPageCubit(get<_i31.CreateUserUseCase>()));
  gh.singleton<_i34.TaskApiDataSource>(
      _i34.TaskApiDataSource(get<_i25.TaskManagerDio>()));
  gh.lazySingleton<_i35.TaskRepository>(() => _i36.TaskRepositoryImpl(
      get<_i34.TaskApiDataSource>(),
      get<_i29.FiltersPreferences>(),
      get<_i11.TaskMapper>(),
      get<_i9.PaginationMapper>()));
  gh.singleton<_i37.UpdateTaskUseCase>(
      _i37.UpdateTaskUseCase(get<_i35.TaskRepository>()));
  gh.singleton<_i38.CreateTaskUseCase>(
      _i38.CreateTaskUseCase(get<_i35.TaskRepository>()));
  gh.singleton<_i39.DeleteTaskUseCase>(
      _i39.DeleteTaskUseCase(get<_i35.TaskRepository>()));
  gh.singleton<_i40.GetTaskByIdUseCase>(
      _i40.GetTaskByIdUseCase(get<_i35.TaskRepository>()));
  gh.singleton<_i41.GetTaskListUseCase>(
      _i41.GetTaskListUseCase(get<_i35.TaskRepository>()));
  gh.singleton<_i42.TaskListPageCubit>(_i42.TaskListPageCubit(
      get<_i41.GetTaskListUseCase>(), get<_i19.LogoutUseCase>()));
  gh.factory<_i43.AddEditTaskPageCubit>(() => _i43.AddEditTaskPageCubit(
      get<_i38.CreateTaskUseCase>(),
      get<_i37.UpdateTaskUseCase>(),
      get<_i42.TaskListPageCubit>()));
  gh.factory<_i44.TaskDetailsPageCubit>(() => _i44.TaskDetailsPageCubit(
      get<_i39.DeleteTaskUseCase>(), get<_i42.TaskListPageCubit>()));
  return get;
}

class _$StorageModule extends _i45.StorageModule {}

class _$NetworkModule extends _i46.NetworkModule {}
