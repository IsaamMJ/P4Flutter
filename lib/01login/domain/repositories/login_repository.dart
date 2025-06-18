import '../entities/login_result.dart';

abstract class LoginRepository {
  Future<LoginResult> login(String username, String password);
}
