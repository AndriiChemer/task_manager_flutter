import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'toggle_event.dart';
part 'toggle_state.dart';

class ToggleBloc extends Bloc<ToggleEvent, ToggleState> {
  ToggleBloc({required List<String> items, String? initialItem}) : super(ToggleInitial(items, initialItem));

  @override
  Stream<ToggleState> mapEventToState(
    ToggleEvent event,
  ) async* {
    if(event is ToggleButtonClick) {
      yield* _mapReloadedState(event);
    }
  }

  Stream<ToggleState> _mapReloadedState(ToggleButtonClick event) async* {
    var selectedIndex = event.selectedIndex;

    Map<int, bool> items = state.items;
    Map<int, bool> reloadedItems = {};

    items.entries.forEach((element) {
      reloadedItems[element.key] = element.key == selectedIndex;
    });

    yield ReloadedState(reloadedItems);
  }
}
