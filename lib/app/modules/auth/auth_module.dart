import 'package:provider/provider.dart';
import 'package:todo_list/app/modules/auth/login/login_page.dart';
import 'package:todo_list/app/modules/todo_list_module.dart';

import 'login/login_controller.dart';

class AuthModule extends TodoListModule {
  AuthModule()
      : super(
          bindings: [
            ChangeNotifierProvider(
              create: (_) => LoginController(),
            )
          ],
          routers: {
            '/login': (context) => const LoginPage(),
          },
        );
}
