import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {

  static const name = 'theme_changer_screen';

  const ThemeChangerScreen({super.key});


  @override
  Widget build(BuildContext context, ref) {
    
    //final darkMode = ref.watch( themeProvider );
    final darkMode = ref.watch( themeNotifierProvider ).darkMode;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme changer'),
        actions: [
          IconButton(
            icon: Icon( darkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined ),
            onPressed: () {
              //ref.read(themeProvider.notifier)
              //  .update((state) => !state);
              ref.read(themeNotifierProvider.notifier)
                .tootleDarkMode();
            }
          )
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {

    final List<Color> colors = ref.watch(colorListProvider);
    
    //final int colorSelected = ref.watch(selectedColorProvider);
    final int colorSelected = ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index){
        final color = colors[index];
        return RadioListTile(
          title: Text('Este color', style: TextStyle(color: color)),
          subtitle: Text('${ color.value }'),
          activeColor: color,
          value: index, 
          groupValue: colorSelected, 
          onChanged: (value) {
            //ref.read(selectedColorProvider.notifier).state = index;
            ref.read(themeNotifierProvider.notifier).changeColorIndex(index);
          }
        );
      }
    );
  }
}