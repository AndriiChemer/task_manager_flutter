import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_task_manager/core/utils/extension.dart';
import 'package:flutter_task_manager/core/utils/utils.dart';
import 'package:flutter_task_manager/features/domain/task/model/task.dart';
import 'package:flutter_task_manager/features/presentation/screens/addedittask/add_edit_task_page.dart';
import 'package:flutter_task_manager/features/presentation/screens/taskdetails/task_details_page_cubit.dart';
import 'package:flutter_task_manager/features/presentation/widgets/app_bar/navigation_button.dart';
import 'package:flutter_task_manager/features/presentation/widgets/hooks/hooks.dart';
import 'package:flutter_task_manager/features/presentation/widgets/hooks/use_navigation_hook.dart';
import 'package:flutter_task_manager/features/presentation/widgets/widgets.dart';

class TaskDetailsPage extends HookWidget {
  static const String id = "/task_details";

  final Task _task;
  const TaskDetailsPage(this._task);

  @override
  Widget build(BuildContext context) {
    final cubit = useCubit<TaskDetailsPageCubit>();
    final state = useCubitBuilder(cubit);

    final task = useState(_task);
    final navigator = useNavigator();

    useCubitListener<TaskDetailsPageCubit, TaskDetailsPageState>(cubit,
            (cubit, state, context) => _listener(cubit, state, context));

    final openEditScreenCallback = useCallback(() async {
      final updatedTaskModel = await navigator.navigateTo(AddEditTaskPage.id, task.value);

      if(updatedTaskModel != null) {
        task.value = updatedTaskModel;
      }
    }, []);

    return Scaffold(
        appBar: CustomAppBar.create(
            title: context.getString("task_details",),
            rightElements: [
              IconButton(icon: Icon(Icons.edit, size: 26,), onPressed: openEditScreenCallback,)
            ],
            leading: NavigationButton.backWithTitle(title: context.getString("back"),)
        ),
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Expanded(
                    child: ListView(
                      children: [
                        Title(
                          title: task.value.title,
                          dueBy: task.value.dueBy,
                        ),
                        Priority(priority: task.value.priority,),
                        Divider(),
                        Description(description: '-',),
                        Divider(),
                        NotificationTime(dueBy: task.value.dueBy,),
                        Divider(),
                      ],
                    )
                ),
                DeleteButton(cubit, state, task.value),
              ],
            ),
          ),
        )
    );
  }

  void _listener(TaskDetailsPageCubit cubit, TaskDetailsPageState state, BuildContext context) {
    state.maybeMap(
      connectionError: (state) {
        context.showNegativeMessage(state.toString());
      },
      success: (state) {
        Navigator.pop(context);
      },
      error: (state) {
        context.showNegativeMessage(context.getString('something_went_wrong'));
      },
      orElse: () {}
    );
  }
}

/// ================ ELEMENTS ===================
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
      color: Theme.of(context).appBarTheme.backgroundColor,
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

class DeleteButton extends HookWidget {
  final Task taskModel;
  final TaskDetailsPageCubit cubit;
  final TaskDetailsPageState state;

  const DeleteButton(this.cubit, this.state, this.taskModel);

  @override
  Widget build(BuildContext context) {

    final isLoading = state.maybeMap(
      initial: (state) => false,
      loading: (state) => true,
      error: (state) => false,
      idle: (state) => false,
      orElse: () => false
    );


    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: ButtonWidget(
        title: context.getString("delete_event"),
        isLoading: isLoading,
        onPressed: () {
          cubit.delete(taskModel);
        },
      ),
    );
  }
}




