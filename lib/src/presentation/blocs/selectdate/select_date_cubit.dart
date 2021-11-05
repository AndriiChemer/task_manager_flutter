import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SelectDateCubit extends Cubit<DateTime?> {
  SelectDateCubit() : super(null);

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
