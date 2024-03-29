import 'package:provider/provider.dart';
import 'package:todo_list/app/modules/tasks/tasks_create_controller.dart';
import 'package:todo_list/app/modules/tasks/tasks_create_page.dart';
import 'package:todo_list/app/modules/todo_list_module.dart';

import '../../repositories/tasks/tasks_repository.dart';
import '../../repositories/tasks/tasks_repository_impl.dart';
import '../../services/tasks/tasks_service.dart';
import '../../services/tasks/tasks_service_impl.dart';

class TasksModule extends TodoListModule {
  TasksModule()
      : super(
          bindings: [
            Provider<TasksRepository>(
              create: (context) => TasksRepositoryImpl(
                sqliteConnectionFactory: context.read(),
              ),
            ),
            Provider<TasksService>(
              create: (context) => TasksServiceImpl(
                tasksRepository: context.read(),
              ),
            ),
            ChangeNotifierProvider(
              create: (context) => TasksCreateController(
                tasksService: context.read(),
              ),
            )
          ],
          routers: {
            '/task/create': (context) => TasksCreatePage(
                  controller: context.read(),
                ),
          },
        );
}
