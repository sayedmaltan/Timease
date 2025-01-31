import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {

  static late SharedPreferences sharedPreference;

  static  Future<SharedPreferences>  init() async
  {
    return sharedPreference= await SharedPreferences.getInstance() ;
  }

  static Future<bool> setData(String key, value) async {
    if(value is bool) {
      return await sharedPreference.setBool( key, value);
    }
    else if(value is String) {
      return await sharedPreference.setString( key, value);
    }
    else if(value is int) {
      return await sharedPreference.setInt( key, value);
    }
    return await sharedPreference.setDouble( key, value);
  }

  static getData( key) {
    return  sharedPreference.get(key);
  }

  static Future<bool> removeData (key)async{
    return await sharedPreference.remove(key);
  }
}