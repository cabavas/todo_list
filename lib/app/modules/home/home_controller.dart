import 'package:todo_list/app/models/task_filter_enum.dart';

import '../../core/notifier/default_change_notifier.dart';
import '../../models/task_model.dart';
import '../../models/total_tasks_model.dart';
import '../../models/week_task_model.dart';
import '../../services/tasks/tasks_service.dart';

class HomeController extends DefaultChangeNotifier {
  final TasksService _tasksService;
  var filterSelected = TaskFilterEnum.today;
  TotalTasksModel? todayTotalTasks;
  TotalTasksModel? tomorrowTotalTasks;
  TotalTasksModel? weekTotalTasks;

  HomeController({required TasksService tasksService})
      : _tasksService = tasksService;

  Future<void> loadTotalTasks() async {
    final allTasks = await Future.wait([
      _tasksService.getToday(),
      _tasksService.getTomorrow(),
      _tasksService.getWeek(),
    ]);

    final todayTasks = allTasks[0] as List<TaskModel>;
    final tomorrowTasks = allTasks[1] as List<TaskModel>;
    final weekTasks = allTasks[2] as WeekTaskModel;

    todayTotalTasks = TotalTasksModel(
      totalTasks: todayTasks.length,
      totalTasksFinished: todayTasks.where((task) => task.finished).length,
    );
    tomorrowTotalTasks = TotalTasksModel(
      totalTasks: tomorrowTasks.length,
      totalTasksFinished: tomorrowTasks.where((task) => task.finished).length,
    );
    weekTotalTasks = TotalTasksModel(
      totalTasks: weekTasks.tasks.length,
      totalTasksFinished: weekTasks.tasks.where((task) => task.finished).length,
    );
    notifyListeners();
  }
}
