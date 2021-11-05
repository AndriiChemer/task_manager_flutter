part of 'toggle_bloc.dart';

@immutable
abstract class ToggleState {
  final Map<int, bool> items = {};
}

class ToggleInitial extends ToggleState {

  ToggleInitial(List<String> itemsList, String? selectedItem) {
    items.clear();

    for(var i = 0; i < itemsList.length; i++) {
      items[i] = itemsList[i] == selectedItem;
    }
  }

}
class ReloadedState extends ToggleState {
  ReloadedState(Map<int, bool> reloadedItems) {
    items.clear();
    items.addAll(reloadedItems);
  }
}