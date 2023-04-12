import 'package:taskpromina/Auth/domain/entities/user_entities.dart';

class UserModel extends User
{
  UserModel(super.id, super.name, super.token);

  factory UserModel.fromJson(Map<String,dynamic> json)=>UserModel(
      json["user"]["id"],
      json["user"]["name"],
      json["token"]
  );
}