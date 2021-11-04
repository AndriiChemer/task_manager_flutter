part of 'toggle_bloc.dart';

@immutable
abstract class ToggleEvent {}

class ToggleButtonClick extends ToggleEvent {
  final int selectedIndex;

  ToggleButtonClick(this.selectedIndex);
}
