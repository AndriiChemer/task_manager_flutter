part of 'toggle_bloc.dart';

@immutable
abstract class ToggleState {
  final Map<int, bool> indexItems = {};
}

class ToggleInitial extends ToggleState {

  ToggleInitial(List<String> itemsList, String? selectedItem) {
    indexItems.clear();

    for(var i = 0; i < itemsList.length; i++) {
      indexItems[i] = itemsList[i] == selectedItem;
    }
  }

}
class ReloadedState extends ToggleState {
  ReloadedState(Map<int, bool> reloadedItems) {
    indexItems.clear();
    indexItems.addAll(reloadedItems);
  }
}