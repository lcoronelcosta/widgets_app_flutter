import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//Estado => isDarkModeProvider = boolean
final themeProvider = StateProvider((ref) => false);

//Lisado de colores inmutable
final colorListProvider = Provider((ref) => colorList);

//Index Color theme
final selectedColorProvider = StateProvider((ref) => 0);