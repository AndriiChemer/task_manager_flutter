import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_task_manager/core/utils/extension.dart';
import 'package:flutter_task_manager/features/presentation/blocs/blocs.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';

class SelectDateTimeWidget extends HookWidget {
  final int? initialTimeStamp;
  final BehaviorSubject<DateTime?>? controller;

  const SelectDateTimeWidget({
    Key? key,
    this.controller,
    this.initialTimeStamp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final initialDateTime = useMemoized(() => initialTimeStamp != null
        ? DateTime.fromMillisecondsSinceEpoch(initialTimeStamp! * 1000)
        : null);

    final selectDateCubit = useMemoized(() => SelectDateCubit(initialDateTile: initialDateTime));
    final formattedDate = useMemoized(() => DateFormat('dd/MM/yyyy kk:mm'));

    useEffect(() {
      if(initialDateTime != null) {
        controller?.add(initialDateTime);
      }
    });


    return BlocProvider(
      create: (context) => selectDateCubit,

      child: GestureDetector(
        onTap: () async {
          final newDateTime = await _selectNewDateTime(context);
          if(newDateTime != null) {
            selectDateCubit.onNewDateSelected(newDateTime);
            controller?.add(newDateTime);
          }
        },
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: BlocBuilder<SelectDateCubit, DateTime?>(
            builder: (context, state) {

              return RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      style: TextStyle(
                        color: Theme.of(context).iconTheme.color,
                        fontWeight: FontWeight.w600,
                        fontSize: 16
                      ),
                      text: state != null
                        ? formattedDate.format(state)
                        : context.getString("select"),
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

  Future<DateTime?> _selectNewDateTime(BuildContext context) async {
    DateTime? selectedDate = await _getDate(context);
    if(selectedDate == null) return null;

    TimeOfDay? selectedTime = await _getTime(context);
    if(selectedTime == null) return null;

    return DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedTime.hour,
      selectedTime.minute,
    );
  }

  Future<DateTime?> _getDate(BuildContext context) async {
    var nowDateTime = DateTime.now();

    final DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: nowDateTime,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: nowDateTime,
        lastDate: DateTime(nowDateTime.year + 1, nowDateTime.month));

    return selectedDate;
  }

  Future<TimeOfDay?> _getTime(BuildContext context) async {

    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    return selectedTime;
  }
}