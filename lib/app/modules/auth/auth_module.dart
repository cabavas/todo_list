import 'package:provider/provider.dart';
import 'package:todo_list/app/modules/auth/login/login_page.dart';
import 'package:todo_list/app/modules/auth/register/register_controller.dart';
import 'package:todo_list/app/modules/auth/register/register_page.dart';
import 'package:todo_list/app/modules/todo_list_module.dart';

import '../../services/user/user_service.dart';
import 'login/login_controller.dart';

class AuthModule extends TodoListModule {
  AuthModule()
      : super(
          bindings: [
            ChangeNotifierProvider(
              create: (context) =>
                  LoginController(userService: context.read<UserService>()),
            ),
            ChangeNotifierProvider(
              create: (context) =>
                  RegisterController(userService: context.read<UserService>()),
            )
          ],
          routers: {
            '/login': (context) => const LoginPage(),
            '/register': (context) => const RegisterPage(),
          },
        );
}
