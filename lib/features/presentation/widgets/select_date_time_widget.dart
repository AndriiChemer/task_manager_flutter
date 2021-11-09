import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_task_manager/core/utils/extension.dart';
import 'package:intl/intl.dart';

const dataFormat = 'dd/MM/yyyy kk:mm';

class SelectDateTimeWidget extends HookWidget {
  final ValueNotifier<int?> controller;

  const SelectDateTimeWidget({
    Key? key,
    required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formattedDate = useMemoized(() => DateFormat(dataFormat));

    return GestureDetector(
      onTap: () async {
        final newDateTime = await _selectNewDateTime(context);
        if(newDateTime != null) {
          controller.value = newDateTime.millisecondsSinceEpoch ~/ 1000;
        }
      },

      child: Container(
        margin: EdgeInsets.all(15.0),
        child: RichText(
          text: TextSpan(
            children: [

              TextSpan(
                style: TextStyle(
                    color: Theme.of(context).iconTheme.color,
                    fontWeight: FontWeight.w600,
                    fontSize: 16
                ),
                text: controller.value != null
                    ? formattedDate.format(DateTime.fromMillisecondsSinceEpoch(controller.value!))
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
    final nowDateTime = DateTime.now();

    final DateTime? selectedDate = await showModalBottomSheet<DateTime>(
      context: context,
      builder: (context) {
        DateTime _tempPickedDate = nowDateTime;
        return Container(
          height: 250,
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CupertinoButton(
                      child: Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    CupertinoButton(
                      child: Text('Done'),
                      onPressed: () {
                        Navigator.of(context).pop(_tempPickedDate);
                      },
                    ),
                  ],
                ),
              ),
              Divider(
                height: 0,
                thickness: 1,
              ),
              Expanded(
                child: Container(
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: nowDateTime,
                    minimumDate: nowDateTime,
                    maximumDate: DateTime(nowDateTime.year + 1, nowDateTime.month),
                    onDateTimeChanged: (DateTime dateTime) {
                      _tempPickedDate = dateTime;
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
    return selectedDate;
  }

  Future<TimeOfDay?> _getTime(BuildContext context) async {

    final currentTime = TimeOfDay.now();
    final currentDate = DateTime.now();
    final initialDateTime = DateTime(
        currentDate.year,
        currentDate.month,
        currentDate.day,
        currentTime.hour,
        currentTime.minute + 1);

    final maximumDateTime = DateTime(
        currentDate.year + 1,
        currentDate.month,
        currentDate.day,
        currentTime.hour,
        currentTime.minute);

    final DateTime? selectedDateTime = await showModalBottomSheet<DateTime>(
        context: context,
        builder: (context) {
          DateTime _tempPickedDate = initialDateTime;
          return Container(
            height: 250,
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CupertinoButton(
                        child: Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      CupertinoButton(
                        child: Text('Done'),
                        onPressed: () {
                          Navigator.of(context).pop(_tempPickedDate);
                        },
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 0,
                  thickness: 1,
                ),
                Expanded(
                  child: Container(
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.time,
                      use24hFormat: true,
                      minuteInterval: 1,
                      initialDateTime: initialDateTime,
                      minimumDate: initialDateTime,
                      maximumDate: maximumDateTime,
                      onDateTimeChanged: (DateTime dateTime) {
                        _tempPickedDate = dateTime;
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        }
    );

    final selectedTime = selectedDateTime != null
        ?  TimeOfDay.fromDateTime(selectedDateTime)
        : null;

    return selectedTime;
  }
}