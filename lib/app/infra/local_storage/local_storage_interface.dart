abstract class ILocalStorage {

  Future<bool> saveString(String key, String value);

  Future<bool> saveMap(String key, Map<String, dynamic> value);

  String getString(String key, [String defaultValue = '']);

  Map<String, dynamic> getMap(String key);

  Future<bool> remove(String key);
}
