import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//Estado => isDarkModeProvider = boolean
final themeProvider = StateProvider((ref) => false);

//Lisado de colores inmutable
final colorListProvider = Provider((ref) => colorList);

//Index Color theme
final selectedColorProvider = StateProvider((ref) => 0);

//Provider a nivel de Objetos
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

//Controller o Notifier
class ThemeNotifier extends StateNotifier<AppTheme>{
  //STATE = Estado = new AppTheme();
  ThemeNotifier(): super ( AppTheme() );

  void tootleDarkMode() {
    state = state.copyWith( darkMode: !state.darkMode);
  }

  void changeColorIndex(int colorIndex){
    state = state.copyWith( selectedColor: colorIndex );
  }

}