import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_task_manager/core/routes/navigation.dart';
import 'package:flutter_task_manager/core/utils/extension.dart';
import 'package:flutter_task_manager/features/domain/task/model/task.dart';
import 'package:flutter_task_manager/features/presentation/screens/addedittask/add_edit_task_page.dart';
import 'package:flutter_task_manager/features/presentation/screens/filters/filters_screen.dart';
import 'package:flutter_task_manager/features/presentation/screens/tasklist/task_list_page_cubit.dart';
import 'package:flutter_task_manager/features/presentation/widgets/hooks/cubit_hooks.dart';
import 'package:flutter_task_manager/features/presentation/widgets/widgets.dart';
import 'package:get_it/get_it.dart';

class TaskListScreen extends HookWidget {
  static const String id = "/";

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final cubit = useCubit<TaskListPageCubit>();
    final state = useCubitBuilder(cubit);
    final scrollController = useScrollController();

    useCubitListener<TaskListPageCubit, TaskListPageState>(
      cubit,
      (cubit, state, context) => _listener(cubit, state, context),
    );

    useEffect(() {
      _scrollPaginationListener(scrollController, screenHeight, () => cubit.loadMode);
    }, [scrollController]);

    useEffect(() {
      cubit.initial();
    }, [cubit]);


    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 57),
        child: AppBarTaskList(),
      ),
      floatingActionButton: AddTaskButton(),
      body: SafeArea(
        child: state.maybeMap(
          idle: (state) {
            print("ANDRII size: ${state.taskList.length}");
            return Content(state.taskList, cubit, scrollController);
          },
          empty: (state) => Content([], cubit, scrollController),
          loading: (state) => LoadingProgress(),
          orElse: () => LoadingProgress(),
        ),
      ),
    );
  }

  void _scrollPaginationListener(ScrollController scrollController, double screenHeight, Function() onLoadMore) {
    scrollController.addListener(() {
      final position = scrollController.position;

      if (position.maxScrollExtent - position.pixels < screenHeight) {
        onLoadMore();
      }
    });
  }

  void _listener(
    TaskListPageCubit cubit, 
    TaskListPageState state, 
    BuildContext context
  ) {
    state.maybeMap(
      connectionError: (state) {
        context.showNegativeMessage(state.toString());
      },
      orElse: () {}
    );
  }
}

///=================== ELEMENTS =====================
class AppBarTaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: context.getString("my_tasks"),
      action: IconButton(
        icon: Icon(Icons.sort, size: 26,),
        onPressed: () {
          _onOpenFilterScreenClick(context);
        },
      ),
      leading: IconButton(
        icon: Icon(Icons.add_alert, size: 26,),
        onPressed: () {
          context.showFeatureNotImplemented();
        },
      ),
    );
  }
  
  _onOpenFilterScreenClick(BuildContext context) {
    Navigator.pushNamed(context, FilterScreen.id);
  }
}

class AddTaskButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add, size: 42,),
      onPressed: () {
        _openAddTaskScreen(context);
      },
    );
  }

  _openAddTaskScreen(BuildContext context) {
    GetIt.instance.get<NavigationService>()
        .navigateTo(AddEditTaskPage.id);
  }
}

class LoadingProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(color: Colors.blue,),
      ),
    );
  }
}

class Content extends HookWidget {
  final List<Task> taskList;
  final TaskListPageCubit cubit;
  final ScrollController scrollController;

  Content(this.taskList, this.cubit, this.scrollController);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: RefreshIndicator(
            onRefresh: () => cubit.loadFirstPage(),
            child: ListView.separated(
                controller: scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: taskList.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) => TaskWidget(taskModel: taskList[index],)
            ),
          ),
        ),
      ],
    );
  }
}




