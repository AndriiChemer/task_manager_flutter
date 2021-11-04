import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_manager/src/data/models/task/task_model.dart';
import 'package:flutter_task_manager/src/presentation/blocs/blocs.dart';
import 'package:flutter_task_manager/src/presentation/widgets/widgets.dart';
import 'package:flutter_task_manager/utils/utils.dart';
import 'package:rxdart/rxdart.dart';

class AddEditScreen extends StatefulWidget {
  static const String id = "/add_edit_screen";

  final TaskModel? taskModel;

  const AddEditScreen({Key? key, this.taskModel}) : super(key: key);

  bool get isAddTaskScreen => taskModel == null;

  @override
  _AddEditScreenState createState() => _AddEditScreenState();
}

class _AddEditScreenState extends State<AddEditScreen> {

  BehaviorSubject<String?> toggleButtonController = BehaviorSubject<String?>();
  BehaviorSubject<DateTime?> dateTimeController = BehaviorSubject<DateTime?>();
  TextEditingController titleController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();

  @override
  void initState() {
    titleController.text = widget.taskModel != null ? widget.taskModel!.title : "";
    descriptionController.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 57),
        child: AddEditAppBar(isAddTaskScreen: widget.isAddTaskScreen),
      ),
      body: SafeArea(
        child: BlocListener<AddEditTaskBloc, AddEditTaskState>(
          listener: _listenAddEditState,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  children: [

                    TitleWidget(title: context.getString("title"),),
                    TitleInputText(titleController: titleController,),
                    Divider(),

                    TitleWidget(title: context.getString("priority"),),
                    PriorityContainer(
                      toggleButtonController: toggleButtonController,
                      priority: widget.taskModel?.priority,),
                    Divider(),

                    TitleWidget(title: context.getString("description"),),
                    DescriptionInputText(descriptionController: descriptionController,),
                    Divider(),

                    NotificationTimeContainer(controller: dateTimeController, initialTimeStamp: widget.taskModel?.dueBy,),
                    Divider(),
                  ],
                )
              ),

              SaveButton(
                onPressed: () {
                  _onSaveButtonClick();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSaveButtonClick() async {
    var addEditTaskBloc = BlocProvider.of<AddEditTaskBloc>(context);
    var isAddNewTaskScreen = widget.taskModel == null;

    final title = titleController.text;
    final description = titleController.text;
    final priority = toggleButtonController.hasValue ? toggleButtonController.value : null;
    final dateTime = dateTimeController.hasValue ? dateTimeController.value : null;

    if(isAddNewTaskScreen) {
      addEditTaskBloc.add(AddTaskEvent(
          title: title,
          description: description,
          priority: priority,
          dateTime: dateTime));
    } else {
      addEditTaskBloc.add(EditTaskEvent(
          taskModel: widget.taskModel!,
          title: title,
          description: description,
          priority: priority,
          dateTime: dateTime));
    }
  }

  void _listenAddEditState(BuildContext context, AddEditTaskState state) {
    if(state is ValidationTaskFail) {
      var messageFromString = context.getString(state.message);
      context.showNegativeMessage(messageFromString);
    } else if(state is AddEditTaskFail) {
      context.showNegativeMessage(state.message);
    } else if(state is AddedTaskSuccess) {
      Navigator.pop(context);
    } else if(state is EditTaskSuccess) {
      Navigator.pop(context, state.taskModel);
    }
  }

  @override
  void dispose() {
    dateTimeController.close();
    toggleButtonController.close();
    super.dispose();
  }
}

///=================== ELEMENTS ===================
class AddEditAppBar extends StatelessWidget {
  final bool isAddTaskScreen;

  const AddEditAppBar({Key? key, required this.isAddTaskScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appBarTitle = isAddTaskScreen ? context.getString("add_task") : context.getString("edit_task");

    return CustomAppBar(
      title: appBarTitle,
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
}

class PriorityContainer extends StatelessWidget {
  final String? priority;
  final BehaviorSubject<String?>? toggleButtonController;

  const PriorityContainer({Key? key, this.priority, this.toggleButtonController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: ToggleWidget(
        initialItem: priority,
        items: ['High', 'Normal', 'Low'],
        controller: toggleButtonController,
      ),
    );
  }
}

class TitleInputText extends StatelessWidget {

  final TextEditingController titleController;

  const TitleInputText({Key? key, required this.titleController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
        child: CustomTextFormWidget(
          controller: titleController,
          maxLines: 2,
          borderColor: Theme.of(context).appBarTheme.color,
        )
    );
  }
}

class DescriptionInputText extends StatelessWidget {

  final TextEditingController descriptionController;

  const DescriptionInputText({Key? key, required this.descriptionController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
        child: CustomTextFormWidget(
          controller: descriptionController,
          maxLines: 2,
          borderColor: Theme.of(context).appBarTheme.color,
        )
    );
  }
}

class NotificationTimeContainer extends StatelessWidget {

  final int? initialTimeStamp;
  final BehaviorSubject<DateTime?> controller;

  const NotificationTimeContainer({Key? key, required this.controller, this.initialTimeStamp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TitleWidget(title: context.getString("notification"), ),
        SelectDateTimeWidget(controller: controller, initialTimeStamp: initialTimeStamp,)
      ],
    );
  }
}

class SaveButton extends StatelessWidget {

  final VoidCallback? onPressed;
  const SaveButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddEditTaskBloc, AddEditTaskState>(
      builder: (context, state) {
        var isLoading = state is AddEditTaskLoading;

        return Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: ButtonWidget(
            title: context.getString("save_event"),
            isLoading: isLoading,
            onPressed: onPressed,
          ),
        );
      },
    );
  }
}






