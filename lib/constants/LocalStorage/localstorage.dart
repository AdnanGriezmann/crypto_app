import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<bool> saveTheme(String theme) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool result = await sharedPreferences.setString('theme', theme);
    return result;
  }

  static Future<String?> getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? currenttheme = sharedPreferences.getString('theme');
    return currenttheme;
  }

  static Future<bool> addFav(String id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    List<String> favorites = sharedPreferences.getStringList('favorites') ?? [];
    favorites.add(id);

    return await sharedPreferences.setStringList('favorites', favorites);
  }

  static Future<bool> removeFav(String id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    List<String> favorites = sharedPreferences.getStringList('favorites') ?? [];
    favorites.remove(id);

    return await sharedPreferences.setStringList('favorites', favorites);
  }

  static Future<List<String>> fetchFav() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   return sharedPreferences.getStringList('favorites') ?? [];
  }
}
