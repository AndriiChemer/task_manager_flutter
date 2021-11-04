import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_manager/data/models/models.dart';
import 'package:flutter_task_manager/src/presentation/screens/screens.dart';
import 'package:flutter_task_manager/utils/utils.dart';
import 'package:flutter_task_manager/src/presentation/blocs/blocs.dart';
import 'package:flutter_task_manager/src/presentation/widgets/widgets.dart';

class TaskDetailsScreen extends StatefulWidget {
  static const String id = "/task_details";
  final TaskModel taskModel;

  const TaskDetailsScreen({Key? key, required this.taskModel}): super(key: key);

  @override
  _TaskDetailsScreenState createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {

  @override
  void initState() {
    BlocProvider.of<ShowTaskBloc>(context).showTaskDetails(widget.taskModel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowTaskBloc, TaskState>(
      builder: (context, state) {
        if(state is ShowTaskState) {
          return _buildMainContent(state.taskModel);
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildMainContent(TaskModel taskModel) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 57),
          child: AppBarDetails(taskModel: taskModel,),
        ),
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Expanded(
                    child: ListView(
                      children: [

                        Title(
                          title: taskModel.title,
                          dueBy: taskModel.dueBy,
                        ),
                        Priority(
                          priority: taskModel.priority,
                        ),
                        Divider(),
                        Description(
                          description: '-',
                        ),
                        Divider(),
                        NotificationTime(
                          dueBy: taskModel.dueBy,
                        ),
                        Divider(),
                      ],
                    )
                ),

                DeleteButton(taskModel: taskModel),
              ],
            ),
          ),
        )
    );
  }

}

/// ================ ELEMENTS ===================

class AppBarDetails extends StatelessWidget {
  final TaskModel taskModel;

  const AppBarDetails({Key? key, required this.taskModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: context.getString("task_details",),
      action: IconButton(
        icon: Icon(Icons.edit, size: 26,),
        onPressed: () {
          _openEditTaskScreen(context);
        },
      ),
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          margin: EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Icon(Icons.arrow_back_ios_rounded, size: 26,),
              Text(
                context.getString("back"),
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Theme.of(context).iconTheme.color),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openEditTaskScreen(BuildContext context) async {
    var taskBloc = BlocProvider.of<ShowTaskBloc>(context);
    var taskListBloc = BlocProvider.of<TaskListBloc>(context);
    var addEditTaskBloc = BlocProvider.of<AddEditTaskBloc>(context);
    var editTaskScreen = AddEditScreen(taskModer: taskModel);

    var provides = MultiBlocProvider(
      providers: [
        BlocProvider.value(value: taskListBloc),
        BlocProvider.value(value: addEditTaskBloc),
      ],
      child: editTaskScreen,
    );

    var updatedTaskModel = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => provides),
    );

    taskBloc.showTaskDetails(updatedTaskModel);
  }
}

class Title extends StatelessWidget {

  final String title;
  final int dueBy;

  const Title({Key? key, required this.title, required this.dueBy}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dueByString = DateTimeUtils.detailScreenTimeStampConvert(dueBy);
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(10),
      color: Theme.of(context).appBarTheme.color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),),
          Container(
              margin: EdgeInsets.only(top: 15),
              child: Text(dueByString, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),)),

        ],
      ),
    );
  }
}

class Priority extends StatelessWidget {

  final String priority;

  const Priority({Key? key, required this.priority}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TitleWidget(title: context.getString("priority"),),


          Container(
            padding: EdgeInsets.only(right: 15),
            child: RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: _getPriorityIcon(priority),
                  ),
                  TextSpan(
                    style: TextStyle(color: Colors.black),
                    text: priority,
                  ),
                ],
              ),
            ),
          )
        ],
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
}

class Description extends StatelessWidget {
  final String description;

  const Description({Key? key, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleWidget(title: context.getString("description"),),
          Container(
            padding: EdgeInsets.all(15),
            child: Text(description, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
          ),
        ],
      ),
    );
  }
}

class NotificationTime extends StatelessWidget {
  final int dueBy;

  const NotificationTime({Key? key, required this.dueBy}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var notificationDate = DateTimeUtils.listItemTimeStampConvert(dueBy);
    return Container(
      margin: EdgeInsets.only(right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TitleWidget(title: context.getString("notification"),),
          Text(notificationDate, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),)
        ],
      ),
    );
  }
}

class DeleteButton extends StatelessWidget {
  final TaskModel? taskModel;

  const DeleteButton({Key? key, this.taskModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskListBloc, TaskListState>(
      builder: (context, state) {
        var isLoading = state is TaskListLoadingState;

        return Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: ButtonWidget(
            title: context.getString("delete_event"),
            isLoading: isLoading,
            onPressed: () {
              _onDeleteButtonClick(context);
            },
          ),
        );
      },
    );
  }

  void _onDeleteButtonClick(BuildContext context) {
    BlocProvider.of<TaskListBloc>(context).onDeleteTask(taskModel);
  }
}




