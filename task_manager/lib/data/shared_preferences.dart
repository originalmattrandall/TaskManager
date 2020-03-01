import 'package:shared_preferences/shared_preferences.dart';

class UserSettingsPreferences{

  final String _defaultFilter = "defaultFilter";
  final String _archiveBeforeDelete = "archiveBeforeDelete";
  final String _turnOffNotifications = "turnOffNotifications";
  final String _currentFilter = "currentFilter";

  Future<bool> getArchiveBeforeDelete() async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getBool(_archiveBeforeDelete) ?? false;
  }

  Future<bool> setArchiveBeforeDelete(bool value) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.setBool(_archiveBeforeDelete, value);
  }

  Future<bool> getTurnOffNotifications() async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getBool(_turnOffNotifications) ?? false;
  }

  Future<bool> setTurnOffNotifications(bool value) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.setBool(_turnOffNotifications, value);
  }

  Future<int> getDefaultFilter() async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getInt(_defaultFilter) ?? 0;
  }

  Future<bool> setDefaultFilter(int value) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.setInt(_defaultFilter, value);
  }

    Future<String> getCurrentFilter() async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getString(_currentFilter) ?? "No Filter Found";
  }

  Future<bool> setCurrentFilter(String value) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.setString(_currentFilter, value);
  }
}