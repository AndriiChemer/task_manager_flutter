import 'package:flutter_task_manager/core/params/request.dart';
import 'package:flutter_task_manager/core/resources/data_state.dart';
import 'package:flutter_task_manager/core/usecase/usecase.dart';
import 'package:flutter_task_manager/features/domain/repositories/repositories.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthUserUseCase implements UseCase<DataState<String>, UserRequest> {
  final UserRepository _userRepository;
  const AuthUserUseCase(this._userRepository);
  @override
  Future<DataState<String>> call({required UserRequest params}) =>
      _userRepository.auth(params);

}