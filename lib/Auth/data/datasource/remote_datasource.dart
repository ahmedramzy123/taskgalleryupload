import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:taskpromina/Auth/data/model/login_model.dart';
import 'package:taskpromina/core/utiles/apiserveice/diohelper.dart';

abstract class BaseRemoteDataSource
{
  Future<UserModel> loginDataSource(String email ,String password);
}

class RemoteDataSource implements BaseRemoteDataSource
{
  @override
  Future<UserModel> loginDataSource(String email, String password)async {
    var response = await DioHelper.postData(endPoint: "auth/login", data: {
      "email":email,
      "password":password
    });
    return  UserModel.fromJson(response.data);
  }
}