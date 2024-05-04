// import 'package:flattrade/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  static const String _themeModeKey = 'themeMode';

  ThemeMode themeModeValue = ThemeMode.system;

  ThemeProvider() {
    _loadThemeMode();
  }

  bool get isDarkMode => themeModeValue == ThemeMode.dark;

  bool get isLightMode => themeModeValue == ThemeMode.light;

  void switchThemeData(bool isOn) {
    themeModeValue = isOn ? ThemeMode.light : ThemeMode.dark;
    _saveThemeMode(themeModeValue);
    notifyListeners();
  }

  void switchToSystemTheme() {
    themeModeValue = ThemeMode.system;
    _saveThemeMode(themeModeValue);
    notifyListeners();
  }

  Future<void> _saveThemeMode(ThemeMode themeMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_themeModeKey, themeMode.index);
    notifyListeners();
  }

  Future<void> _loadThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? themeModeIndex = prefs.getInt(_themeModeKey);
    if (themeModeIndex != null) {
      themeModeValue = ThemeMode.values[themeModeIndex];
      notifyListeners();
    } else {
      Brightness platformBrightness =
          SchedulerBinding.instance.platformDispatcher.platformBrightness;
      themeModeValue = platformBrightness == Brightness.dark
          ? ThemeMode.dark
          : ThemeMode.light;
      notifyListeners();
    }
  }
}

class ThemeDataClass {
  static final darkTheme = ThemeData(
    bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: const Color.fromARGB(255, 37, 37, 37)),
    splashColor: Color.fromARGB(103, 4, 85, 190),
    useMaterial3: true,
    scaffoldBackgroundColor: Color.fromARGB(255, 40, 40, 40),
    colorScheme: ColorScheme.dark(
        inverseSurface: Colors.white,
        primary:  Color.fromRGBO(9, 101, 218, 1),
        secondary: const Color.fromARGB(255, 185, 184, 184).withOpacity(0.2)),
  );

  static final lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor:  Colors.white,
    colorScheme: ColorScheme.light(
        inverseSurface: Colors.black,
        primary: Color.fromRGBO(9, 101, 218, 1),
        secondary:  const Color(0xFF8198A6).withOpacity(0.3)),
  );
}
