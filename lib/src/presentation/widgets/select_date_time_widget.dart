import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_manager/src/presentation/blocs/blocs.dart';
import 'package:intl/intl.dart';
import 'package:flutter_task_manager/utils/utils.dart';
import 'package:rxdart/rxdart.dart';

class SelectDateTimeWidget extends StatefulWidget {
  final int? initialTimeStamp;
  final BehaviorSubject<DateTime?>? controller;

  const SelectDateTimeWidget({Key? key, this.controller, this.initialTimeStamp}) : super(key: key);

  @override
  _SelectDateTimeWidgetState createState() => _SelectDateTimeWidgetState();
}

class _SelectDateTimeWidgetState extends State<SelectDateTimeWidget> {
  SelectDateCubit selectDateCubit = SelectDateCubit();
  DateFormat formattedDate = DateFormat('dd/MM/yyyy kk:mm');

  @override
  void initState() {
    initInitialTimestamp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var textColor = Theme
        .of(context)
        .iconTheme
        .color;

    var textStyle = TextStyle(
        color: textColor, fontWeight: FontWeight.w600, fontSize: 16);

    return BlocProvider(
      create: (context) => selectDateCubit,

      child: GestureDetector(
        onTap: _selectDateNotification,
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: BlocBuilder<SelectDateCubit, DateTime?>(
            builder: (context, state) {

              var notificationDate = context.getString("select");

              if(state != null) {
                notificationDate = formattedDate.format(state);
              }

              return RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      style: textStyle,
                      text: notificationDate,
                    ),
                    WidgetSpan(
                      child: SizedBox(width: 5,),
                    ),
                    WidgetSpan(
                      child: Icon(Icons.arrow_forward_ios_rounded, size: 20,),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _selectDateNotification() async {
    DateTime? selectedDate = await _getDate();
    if(selectedDate == null) return;

    TimeOfDay? selectedTime = await _getTime();
    if(selectedTime == null) return;

    var newDate = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedTime.hour,
      selectedTime.minute,
    );

    selectDateCubit.onNewDateSelected(newDate);
    widget.controller?.add(newDate);
  }

  Future<DateTime?> _getDate() async {
    var nowDateTime = DateTime.now();

    final DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: nowDateTime,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: nowDateTime,
        lastDate: DateTime(nowDateTime.year + 1, nowDateTime.month));

    return selectedDate;
  }

  Future<TimeOfDay?> _getTime() async {

    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    return selectedTime;
  }

  void initInitialTimestamp() {
    if(widget.initialTimeStamp != null) {
      var date = new DateTime.fromMillisecondsSinceEpoch(widget.initialTimeStamp! * 1000);
      selectDateCubit.onNewDateSelected(date);
      widget.controller?.add(date);
    }
  }
}
