import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_item.dart';

class HomeScreen extends StatelessWidget {

  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: MenuItem.appMenuItems.length,
      itemBuilder: (context, index){
        final menuItem = MenuItem.appMenuItems[index];
        return _CustomListTile(menuItem: menuItem, routeName: HomeScreen.name);
      }
    );
  }
}

class _CustomListTile extends StatelessWidget {

  final MenuItem menuItem;
  final String routeName;

  const _CustomListTile({
    super.key,
    required this.menuItem, 
    required this.routeName,
  });


  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ListTile(
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      onTap: () => context.push(menuItem.link),
      
      /*onTap: () {
        /*Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ButtonsScreen()
          )
        );*/
        //Navigator.pushNamed(context, menuItem.link);

      },*/
    );
  }
}