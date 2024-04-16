import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  
  const SnackbarScreen({super.key});

  void showCustomSnackBar ( BuildContext context ){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Hola Mundo'),
        action: SnackBarAction(
          label: "OK",
          onPressed: () {},
        ),
        duration: Duration(seconds: 2),
      )
    );
  }

  void openDialog(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: false, 
      builder: (context) => AlertDialog(
        title: const Text('¿Estas Seguro?'),
        content: const Text('Laboris sunt cupidatat velit do reprehenderit est deserunt laboris irure. Excepteur consectetur non deserunt fugiat eiusmod aliquip dolore nulla aliquip fugiat culpa. Nostrud aute laborum consequat labore minim duis eiusmod proident elit nisi sunt laborum. Deserunt excepteur consequat incididunt nostrud amet est veniam excepteur do id mollit. Eiusmod commodo esse officia id nulla ullamco. Incididunt est ex aliquip non. Adipisicing ea aute eiusmod ipsum deserunt aliqua in nostrud enim proident esse est.'),
        actions: [
          TextButton(
            onPressed: () => context.pop(), 
            child: Text('Cancelar')
          ),
          TextButton(
            onPressed: () => context.pop(), 
            child: Text('Aceptar')
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SnackBars y Dialogs'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Qui minim incididunt velit consectetur quis id in reprehenderit nostrud ex magna. Et nulla ut tempor nostrud id minim. In minim nulla Lorem dolore nostrud. Commodo laborum dolore nisi aliquip nulla ullamco incididunt nostrud duis. Enim officia ex labore cillum et minim excepteur.')
                  ]
                );
              }, 
              child: const Text('Licencias usadas')
            ),
            FilledButton(
              onPressed: () => openDialog(context), 
              child: const Text('Mostrar Dialogo')
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showCustomSnackBar(context);
        }, 
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}