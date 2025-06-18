import '../entities/login_result.dart';
import '../repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository repository;

  LoginUseCase(this.repository);

  Future<LoginResult> call(String username, String password) {
    return repository.login(username, password);
  }
}
