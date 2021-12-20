import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_task_manager/core/utils/extension.dart';
import 'package:flutter_task_manager/features/domain/task/model/task.dart';
import 'package:flutter_task_manager/features/presentation/widgets/app_bar/navigation_button.dart';
import 'package:flutter_task_manager/features/presentation/widgets/hooks/hooks.dart';
import 'package:flutter_task_manager/features/presentation/widgets/widgets.dart';
import 'package:flutter_task_manager/features/presentation/screens/addedittask/add_edit_task_page_cubit.dart';

class AddEditTaskPage extends HookWidget {
  static const String id = "/add_edit_screen";

  final Task? taskModel;
  const AddEditTaskPage({Key? key, this.taskModel}) : super(key: key);

  bool get isAddTaskScreen => taskModel == null;

  @override
  Widget build(BuildContext context) {
    final cubit = useCubit<AddEditTaskPageCubit>();
    final state = useCubitBuilder(cubit);
    useCubitListener<AddEditTaskPageCubit, AddEditTaskPageState>(
        cubit,
        (cubit, state, context) => _listener(cubit, state, context));

    final dateTimeController = useState(taskModel != null ? taskModel!.dueBy : null);
    final priorityController = useState(taskModel != null ? taskModel!.priority : null);
    final titleController = useTextEditingController(text: taskModel != null ? taskModel!.title : "");
    final descriptionController = useTextEditingController(text: '');

    useEffect(() {
      cubit.initial(taskModel);
    });

    useEffect(() {
      titleController.addListener(() {
        cubit.updateTitle(titleController.text);
      });
    });

    useEffect(() {
      dateTimeController.addListener(() {
        cubit.updateDateTime(dateTimeController.value!);
      });
    });

    useEffect(() {
      priorityController.addListener(() {
        cubit.updatePriority(priorityController.value!);
      });
    });

    final titleError = _getFormMessage(state, TaskValid.titleValidation,
            () => context.getString('invalid_field'));

    final descriptionError = _getFormMessage(state, TaskValid.descriptionValidation,
            () => context.getString('invalid_field'));

    final priorityError = _getFormMessage(state, TaskValid.priorityValidation,
            () => context.getString('invalid_field'));

    final dueByError = _getFormMessage(state, TaskValid.dueByValidation,
            () => context.getString('invalid_field'));

    return Scaffold(
      appBar: CustomAppBar.create(
        title: isAddTaskScreen ? context.getString("add_task") : context.getString("edit_task"),
        leading: NavigationButton.backWithTitle(title: context.getString("back"),),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: ListView(
                  children: [

                    TitleWidget(title: context.getString("title"),),
                    TitleInputText(error: titleError, titleController: titleController,),
                    Divider(),

                    TitleWidget(title: context.getString("priority"),),
                    PriorityContainer(error: priorityError, priorityController: priorityController),
                    Divider(),

                    TitleWidget(title: context.getString("description"),),
                    DescriptionInputText(error: descriptionError, descriptionController: descriptionController,),
                    Divider(),

                    NotificationTimeContainer(error: dueByError, controller: dateTimeController),
                    Divider(),
                  ],
                )
            ),

            ButtonWidget(
              margin: EdgeInsets.symmetric(horizontal: 20),
              title: context.getString("save_event"),
              isLoading: state.maybeWhen(
                idle: (taskErrors) => false,
                initial: () => false,
                loading: () => true,
                orElse: () => false
              ),
              onPressed: () {
                taskModel == null ? cubit.addTask() : cubit.editTask(taskModel!);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _listener(
      AddEditTaskPageCubit cubit,
      AddEditTaskPageState state,
      BuildContext context) {
    state.maybeMap(
      editingSuccess: (state) {
        Navigator.pop(context, state.task);
      },
      addingSuccess: (state) {
        Navigator.pop(context, true);
      },
      connectionError: (state) {
        context.showNegativeMessage(state.toString());
      },
      error: (state) {
        context.showNegativeMessage(context.getString('something_went_wrong'));
      },
      orElse: () {}
    );
  }

  String? _getFormMessage(AddEditTaskPageState state, TaskValid errorType, String Function() getMessage) {
    return state.maybeMap(
        idle: (state) {
          if(state.errors.contains(errorType)) {
            return getMessage();
          }
          return null;
        },
        orElse: () => null
    );
  }
}

///=================== ELEMENTS ===================
class PriorityContainer extends StatelessWidget {
  final ValueNotifier<String?> priorityController;
  final String? error;

  const PriorityContainer({Key? key, required this.priorityController, this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ToggleWidget(
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
      initialItem: priorityController.value,
      items: ['High', 'Normal', 'Low'],
      controller: priorityController,
      error: error,
    );
  }
}

class TitleInputText extends StatelessWidget {

  final TextEditingController titleController;
  final String? error;

  const TitleInputText({Key? key, this.error, required this.titleController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
        child: CustomTextFormWidget(
          controller: titleController,
          maxLines: 2,
          error: error,
          borderColor: Theme.of(context).appBarTheme.backgroundColor, onTextChanged: (String value) {  },
        )
    );
  }
}

class DescriptionInputText extends StatelessWidget {

  final String? error;
  final TextEditingController descriptionController;

  const DescriptionInputText({Key? key, required this.descriptionController, this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextFormWidget(
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      controller: descriptionController,
      maxLines: 2,
      error: error,
      borderColor: Theme.of(context).appBarTheme.backgroundColor, onTextChanged: (String value) {  },
    );
  }
}

class NotificationTimeContainer extends StatelessWidget {

  final String? error;
  final ValueNotifier<int?> controller;

  const NotificationTimeContainer({Key? key, required this.controller, this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              decoration: error != null ? BoxDecoration(
                  border: Border.all(
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5))
              ) : null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleWidget(title: context.getString("notification"), ),
                  SelectDateTimeWidget(controller: controller)
                ],
              ),
            ),

            if(error != null) ...[
              Container(
                  padding: EdgeInsets.only(left: 30),
                  child: Text(error!, style: TextStyle(color: Colors.red, fontSize: 11),)
              )
            ]
          ],

        ),
      ],
    );
  }
}




