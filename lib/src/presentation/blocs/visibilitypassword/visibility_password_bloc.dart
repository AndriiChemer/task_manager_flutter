import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'visibility_password_event.dart';
part 'visibility_password_state.dart';

@injectable
class VisibilityPasswordBloc extends Bloc<VisibilityPasswordEvent, VisibilityPasswordState> {
  VisibilityPasswordBloc() : super(VisibilityPasswordInvisible());

  @override
  Stream<VisibilityPasswordState> mapEventToState(
      VisibilityPasswordEvent event,
  ) async* {
    if(state is VisibilityPasswordInvisible) {
      yield VisibilityPasswordVisible();
    } else {
      yield VisibilityPasswordInvisible();
    }
  }

  onVisibilityButtonClick() {
    add(VisibilityPasswordClickEvent());
  }
}
