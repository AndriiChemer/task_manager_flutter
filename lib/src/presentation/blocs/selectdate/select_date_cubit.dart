import 'package:bloc/bloc.dart';

class SelectDateCubit extends Cubit<DateTime?> {
  SelectDateCubit([DateTime? dateTime]) : super(dateTime);

  void setTimeStamp(int dateTime) {
    var date = new DateTime.fromMillisecondsSinceEpoch(dateTime * 1000);
    emit(date);
  }

  void onNewDateSelected(DateTime? dateTime) {
    if(dateTime != null) {
      emit(dateTime);
    }
  }
}
