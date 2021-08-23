import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_manager/bloc/blocs.dart';
import 'package:flutter_task_manager/data/models/models.dart';
import 'package:flutter_task_manager/ui/screens/screens.dart';
import 'package:flutter_task_manager/ui/widgets/widgets.dart';
import 'package:flutter_task_manager/utils/utils.dart';

class TaskListScreen extends StatefulWidget {
  static const String id = "/";

  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {

  late TaskListBloc _tasksBloc;
  late ScrollController _scrollController;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    SchedulerBinding.instance!.addPostFrameCallback((_){  _refreshIndicatorKey.currentState?.show(); } );
    _tasksBloc = BlocProvider.of<TaskListBloc>(context);
    _scrollController = ScrollController()..addListener(_scrollListener);

    _tasksBloc.getTasks();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 57),
        child: AppBarTaskList(),
      ),
      floatingActionButton: AddTaskButton(),
      body: BlocListener<AuthStateCubit, bool>(
        listener: (context, isUserAuthorized) {
          if(!isUserAuthorized) {
            _openAuthorizationScreen();
          }
        },
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
                  return _buildItems(task);
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItems(List<TaskModel> tasks) {
    return Column(
      children: [
        Expanded(
          child: RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: _onRefresh,
            child: ListView.separated(
                controller: _scrollController,
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

  Future<void> _onRefresh() async {
    _tasksBloc.onRefresh();
  }

  void _openAuthorizationScreen() {
    Navigator.of(context).pushNamedAndRemoveUntil(LoginRegistrationScreen.id, (Route<dynamic> route) => false);
  }

  void _scrollListener() {
    var pixels = _scrollController.position.pixels; 
    var maxScrollExtent = _scrollController.position.maxScrollExtent;
    if (maxScrollExtent == pixels) {
      _tasksBloc.loadMore();
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
          context.showFeatureNotImplemented();
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
    Navigator.pushNamed(context, AddEditScreen.id);
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




