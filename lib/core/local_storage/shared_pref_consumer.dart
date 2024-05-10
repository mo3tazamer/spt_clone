import 'package:shared_preferences/shared_preferences.dart';

import '../error/exceptions.dart';
import 'local_storage_consumer.dart';

class SharedPrefConsumer implements LocalStorageConsumer {
  final SharedPreferences sharedPreferences;

  SharedPrefConsumer({required this.sharedPreferences});

  @override
  Object? getData({required String key}) {
    return sharedPreferences.get(key);
  }

  @override
  Future<bool> removeDataByKey({required String key}) async {
    try {
      return await sharedPreferences.remove(key);
    } catch (error) {
      throw CacheException(message: '$error');
    }
  }

  @override
  Future<bool> saveData({required String key, required dynamic value}) async {
    try {
      if (value is int) {
        return await sharedPreferences.setInt(key, value);
      } else if (value is double) {
        return await sharedPreferences.setDouble(key, value);
      } else if (value is bool) {
        return await sharedPreferences.setBool(key, value);
      } else {
        // if value is String
        return await sharedPreferences.setString(key, value);
      }
    } catch (error) {
      throw CacheException(message: '$error');
    }
  }

  @override
  Future<bool> clearAllCachedData() async {
    try {
      return await sharedPreferences.clear();
    } catch (error) {
      throw CacheException(message: '$error');
    }
  }
}
