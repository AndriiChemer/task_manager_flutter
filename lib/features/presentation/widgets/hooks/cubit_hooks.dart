import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_task_manager/features/injector.dart';

abstract class BuildState {}

typedef CubitBuilderCondition<S> = bool Function(S current);
typedef CubitListener<CUBIT extends Cubit<S>, S> = void Function(CUBIT cubit, S current, BuildContext context);

class _CubitDefaults {
  static bool defaultBlocBuilderCondition<S>(S state) => state is BuildState;
  static bool defaultBlocListenerCondition<S>(S state) => true;
}

T useCubit<T extends Cubit>([List<dynamic> keys = const <dynamic>[]]) {
  final cubit = useMemoized(() => getIt<T>(), keys);
  useEffect(() => cubit.close, [cubit]);
  return cubit;
}

T useCubitWithParams<T extends Cubit>(param1, param2, [List<dynamic> keys = const <dynamic>[]]) {
  final cubit = useMemoized(() => getIt<T>(param1: param1, param2: param2), keys);
  useEffect(() => cubit.close, [cubit]);
  return cubit;
}

S useCubitBuilder<T extends Cubit, S>(
  Cubit<S> cubit, {
  CubitBuilderCondition<S>? buildWhen,
}) {
  final buildWhenConditioner = buildWhen;
  final state = useMemoized(
    () => cubit.stream
      .where(buildWhenConditioner ?? _CubitDefaults.defaultBlocBuilderCondition),
    [cubit.state]
  );

  return useStream(state, initialData: cubit.state).requireData!;
}

void useCubitListener<CUBIT extends Cubit<S>, S>(
  CUBIT cubit,
  CubitListener<CUBIT, S> listener, {
    CubitBuilderCondition<S>? listenWhen
  }
){
  final context = useContext();
  final listenWhenCondition = listenWhen;
  useMemoized(() {
    final stream = cubit.stream
        .where(listenWhenCondition ?? _CubitDefaults.defaultBlocListenerCondition)
        .listen((state) => listener(cubit, state, context));

    return stream.cancel;
  }, [cubit]);
}