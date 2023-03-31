import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/app/modules/home/widgets/home_controller.dart';

import '../todo_list_module.dart';
import 'home_page.dart';

class HomeModule extends TodoListModule {
  HomeModule()
      : super(
          bindings: [
            ChangeNotifierProvider(
              create: (context) => HomeController(),
            )
          ],
          routers: {
            '/home': (context) => const HomePage(),
          },
        );
}
