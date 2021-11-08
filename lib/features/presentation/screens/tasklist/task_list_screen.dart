import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_task_manager/core/routes/navigation.dart';
import 'package:flutter_task_manager/core/utils/extension.dart';
import 'package:flutter_task_manager/features/data/models/models.dart';
import 'package:flutter_task_manager/features/presentation/blocs/blocs.dart';
import 'package:flutter_task_manager/features/presentation/screens/screens.dart';
import 'package:flutter_task_manager/features/presentation/widgets/widgets.dart';
import 'package:get_it/get_it.dart';

class TaskListScreen extends HookWidget {
  static const String id = "/";

  @override
  Widget build(BuildContext context) {
    final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
    final scrollController = useScrollController();
    final taskListBloc = BlocProvider.of<TaskListBloc>(context);

    final onRefreshCallback = useCallback(() { taskListBloc.onRefresh(); }, []);
    final onLoadMoreCallback = useCallback(() { taskListBloc.loadMore(); }, []);

    scrollController.addListener(() {
      _scrollListener(scrollController, onLoadMoreCallback);
    });

    useMemoized(() {
      SchedulerBinding.instance!.addPostFrameCallback(
              (_){  _refreshIndicatorKey.currentState?.show(); } );
    });

    useMemoized(() {
      taskListBloc.add(GetTaskListEvent());
    });

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 57),
        child: AppBarTaskList(),
      ),
      floatingActionButton: AddTaskButton(),
      body: BlocListener<AuthStateCubit, bool>(
        listener: _listenAuthorizationState,
        child: BlocListener<TaskListBloc, TaskListState>(
          listener: (context, state) {
            if (state is TaskListLoadFailState) {
              context.showNegativeMessage(state.message);
            }
          },
          child: SafeArea(
            child: BlocBuilder<TaskListBloc, TaskListState>(
              builder: (context, state) {
                var task = state.taskList;

                if (state is TaskListLoadingState) {
                  return LoadingProgress();
                } else {
                  return _buildItems(
                      _refreshIndicatorKey,
                      scrollController,
                      task,
                      onRefreshCallback);
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItems(
      GlobalKey<RefreshIndicatorState> refreshIndicatorKey,
      ScrollController scrollController,
      List<TaskModel> tasks,
      Function() onRefresh) {
    return Column(
      children: [
        Expanded(
          child: RefreshIndicator(
            key: refreshIndicatorKey,
            onRefresh: () async { onRefresh(); },
            child: ListView.separated(
                controller: scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: tasks.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) => TaskWidget(taskModel: tasks[index],)
            ),
          ),
        ),
      ],
    );
  }

  void _scrollListener(ScrollController scrollController, Function() onLoadMore) {
    var pixels = scrollController.position.pixels;
    var maxScrollExtent = scrollController.position.maxScrollExtent;
    if (maxScrollExtent == pixels) {
      onLoadMore();
    }
  }

  void _listenAuthorizationState(BuildContext context, bool isUserAuthorized) {
    print("ANDRII isUserAuthorized: $isUserAuthorized");
    if(!isUserAuthorized) {
      GetIt.instance.get<NavigationService>()
          .pushReplacement(LoginRegistrationScreen.id);
    }
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
        .navigateTo(AddEditScreen.id);
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




