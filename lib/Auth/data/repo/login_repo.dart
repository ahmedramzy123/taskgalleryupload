import 'package:taskpromina/Auth/data/datasource/remote_datasource.dart';
import 'package:taskpromina/Auth/domain/entities/user_entities.dart';
import 'package:taskpromina/Auth/domain/repo/login_user.dart';

class LoginRepo implements BaseLoginRepo
{
  final BaseRemoteDataSource baseRemoteDataSource ;

  LoginRepo(this.baseRemoteDataSource);

  @override
  Future<User> login(String email, String password)async {
    return await baseRemoteDataSource.loginDataSource(email, password);
  }


}