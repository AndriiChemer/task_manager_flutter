import 'package:flutter_task_manager/core/usecase/usecase_without_param.dart';
import 'package:flutter_task_manager/features/domain/auth/auth_store.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class LogoutUseCase implements EmptyUseCase<void> {
  final AuthStore _authStore;
  LogoutUseCase(this._authStore);

  @override
  Future<void> call() => _authStore.clear();
}