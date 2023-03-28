import '../todo_list_module.dart';
import 'home_page.dart';

class HomeModule extends TodoListModule {
  HomeModule()
      : super(
          // bindings: null,
          routers: {
            '/home': (context) => const HomePage(),
          },
        );
}
