import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_manager/bloc/blocs.dart';
import 'package:flutter_task_manager/core/converters/converters.dart';
import 'package:flutter_task_manager/data/models/models.dart';
import 'package:flutter_task_manager/ui/screens/screens.dart';
import 'package:flutter_task_manager/utils/utils.dart';

class TaskWidget extends StatelessWidget {

  final TaskModel taskModel;
  final double height;

  const TaskWidget({Key? key, required this.taskModel, this.height = 76}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var spaceRow = MediaQuery
        .of(context)
        .size
        .width / 7;

    var dueByString = DateTimeUtils.listItemTimeStampConvert(taskModel.dueBy);

    return GestureDetector(
      onTap: () {
        _openDetailScreen(context);
      },
      child: Container(
        height: height,
        padding: EdgeInsets.all(15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskModel.title,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),

                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          style: TextStyle(color: Colors.black),
                          text: "Due to ",
                        ),
                        TextSpan(
                          style: TextStyle(color: Colors.black),
                          text: dueByString,
                        ),
                        WidgetSpan(
                          child: SizedBox(width: 10,),
                        ),
                        WidgetSpan(
                          child: _getPriorityIcon(taskModel.priority),
                        ),
                        TextSpan(
                          style: TextStyle(color: Colors.black),
                          text: taskModel.priority,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(width: spaceRow,),

            Center(
              child: Icon(Icons.arrow_forward_ios, size: height / 3,),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getPriorityIcon(String priority) {
    switch(priority) {
      case "High": return Icon(Icons.arrow_upward);
      case "Low": return Icon(Icons.arrow_downward);
      default: return Text("= ");
    }
  }

  void _openDetailScreen(BuildContext context) {
    var taskListBloc = BlocProvider.of<TaskListBloc>(context);
    var addEditTaskBloc = BlocProvider.of<AddEditTaskBloc>(context);
    var detailsScreen = TaskDetailsScreen(taskModel: taskModel);
    var taskBloc = ShowTaskBloc();

    var provides = MultiBlocProvider(
      providers: [
        BlocProvider.value(value: taskBloc),
        BlocProvider.value(value: taskListBloc),
        BlocProvider.value(value: addEditTaskBloc),
      ],
      child: detailsScreen,
    );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => provides),
    );
  }
}
