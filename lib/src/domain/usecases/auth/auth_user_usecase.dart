import 'package:flutter_task_manager/src/core/params/request.dart';
import 'package:flutter_task_manager/src/core/resources/data_state.dart';
import 'package:flutter_task_manager/src/core/usecase/usecase.dart';
import 'package:flutter_task_manager/src/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthUserUseCase implements UseCase<DataState<String>, UserRequest> {
  final UserRepository _userRepository;
  const AuthUserUseCase(this._userRepository);
  @override
  Future<DataState<String>> call({required UserRequest params}) =>
      _userRepository.auth(params);

}