import 'package:flutter/material.dart';
import 'package:flutter_task_manager/core/routes/navigation.dart';
import 'package:flutter_task_manager/core/utils/utils.dart';
import 'package:flutter_task_manager/features/domain/task/model/task.dart';
import 'package:flutter_task_manager/features/presentation/screens/taskdetails/task_details_page.dart';
import 'package:get_it/get_it.dart';

class TaskWidget extends StatelessWidget {

  final Task taskModel;
  final double height;

  const TaskWidget({Key? key, required this.taskModel, this.height = 76}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var spaceRow = MediaQuery
        .of(context)
        .size
        .width / 7;

    var dueByString = DateTimeUtils.listItemTimeStampConvert(taskModel.dueBy);

    return InkWell(
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
    GetIt.instance.get<NavigationService>()
        .navigateTo(TaskDetailsPage.id, taskModel);
  }
}
