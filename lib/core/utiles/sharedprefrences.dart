
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences
{
  static const  TOKEN ="token";
 static const NAME ="name";
  static  SharedPreferences? _sharedPreferences;
 static init()async
  {
     _sharedPreferences = await SharedPreferences.getInstance();
  }
  static Future<bool> saveString(String value,String key)
  {
   return _sharedPreferences!.setString(key, value);

  }
  static String? getString(String key)
  {
    return _sharedPreferences?.getString(key);

  }

}