import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_list/app/services/user/user_service.dart';

import '../../core/database/sqlite_connection_factory.dart';
import '../../repositories/user/user_repository.dart';

class UserServiceImpl implements UserService {
  final UserRepository _userRepository;
  final SqliteConnectionFactory _sqliteConnectionFactory;

  UserServiceImpl(
      {required UserRepository userRepository,
      required SqliteConnectionFactory sqliteConnectionFactory})
      : _sqliteConnectionFactory = sqliteConnectionFactory,
        _userRepository = userRepository;

  @override
  Future<User?> register(String email, String password) {
    return _userRepository.register(email, password);
  }

  @override
  Future<User?> login(String email, String password) =>
      _userRepository.login(email, password);

  @override
  Future<void> forgotPassword(String email) =>
      _userRepository.forgotPassword(email);

  @override
  Future<User?> googleLogin() => _userRepository.googleLogin();

  @override
  Future<void> logout() async {
    final conn = await _sqliteConnectionFactory.openConnection();
    await conn.delete('todo');
    return _userRepository.logout();
  }

  @override
  Future<void> updateDisplayName(String name) =>
      _userRepository.updateDisplayName(name);
}
