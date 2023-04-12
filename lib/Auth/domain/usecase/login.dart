import 'package:taskpromina/Auth/domain/entities/user_entities.dart';
import 'package:taskpromina/Auth/domain/repo/login_user.dart';

class Login
{
  final BaseLoginRepo repo;

  Login(this.repo);
 Future<User> execute(String email,String password)async
  {
   return await repo.login(email, password);
  }
}