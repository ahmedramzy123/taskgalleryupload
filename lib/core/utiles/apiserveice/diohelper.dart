import 'package:dio/dio.dart';
import 'package:taskpromina/Auth/presentation/controller/cubit/auth_cubit/auth_cubit.dart';
import 'package:taskpromina/core/utiles/constant.dart';
import 'package:taskpromina/core/utiles/sharedprefrences.dart';

class DioHelper
{
 static Dio? dio;
 static init()
 {
   dio = Dio(
     BaseOptions(
       baseUrl: AppConstant.baseUrl,
       headers: {
         'Content-Type': 'application/json',

       },
       receiveDataWhenStatusError: true
     )
   );
 }
 static Future<Response> postData({
    required String endPoint,
    required Map<String,dynamic> data,
})async
  {
    dio!.options.headers={
    'Content-Type': 'application/json',

  };
  return await dio!.post(endPoint,data:data );
  }

 static Future<Response> uploadFile({
   required String endPoint,
   required FormData data,
 })async
 {
   dio!.options.headers={
     "Authorization":"Bearer ${AppPreferences.getString(AppPreferences.TOKEN)}",
     'Content-Type': 'application/json',

   };
   return await dio!.post(endPoint,data:data );
 }
 static Future<Response> getData({
   required String endPoint,
 })async
 {
   dio!.options.headers={
     "Authorization":"Bearer ${AppPreferences.getString(AppPreferences.TOKEN)}",
     'Content-Type': 'application/json',

   };
   return await dio!.get(endPoint );
 }
}