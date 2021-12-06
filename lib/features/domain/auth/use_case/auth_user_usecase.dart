import 'package:flutter_task_manager/core/params/request.dart';
import 'package:flutter_task_manager/core/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

import '../auth_repository.dart';

@singleton
class AuthUserUseCase implements UseCase<void, UserRequest> {
  final AuthRepository _userRepository;
  const AuthUserUseCase(this._userRepository);
  @override
  Future<void> call({required UserRequest params}) =>
      _userRepository.auth(params);

}