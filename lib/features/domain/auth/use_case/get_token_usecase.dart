import 'package:flutter_task_manager/core/usecase/usecase_without_param.dart';
import 'package:flutter_task_manager/features/domain/auth/auth_store.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetTokenUseCase implements EmptyUseCase<String> {
  final AuthStore _authStore;
  GetTokenUseCase(this._authStore);

  @override
  Future<String> call() => _authStore.getToken();

}