import '../../domain/entities/login_result.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasource/login_remote_data_source.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;

  LoginRepositoryImpl(this.remoteDataSource);

  @override
  Future<LoginResult> login(String username, String password) async {
    final response = await remoteDataSource.login(username, password);
    return LoginResult(status: response.status, message: response.message);
  }
}
