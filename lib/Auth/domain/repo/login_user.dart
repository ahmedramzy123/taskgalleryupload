import 'package:taskpromina/Auth/domain/entities/user_entities.dart';

abstract class BaseLoginRepo
{
  Future<User> login(String email , String password);
}