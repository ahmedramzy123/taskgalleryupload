import 'package:dio/dio.dart';
import 'package:taskpromina/core/utiles/constant.dart';

class DioHelper
{
 static Dio? dio;
 static init()
 {
   dio = Dio(
     BaseOptions(
       baseUrl: AppConstant.baseUrl,
       headers: {
         "Authorization":AppConstant.token,
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
  return await dio!.post(endPoint,data:data );
  }

 static Future<Response> getData({
   required String endPoint,
 })async
 {
   return await dio!.get(endPoint );
 }
}