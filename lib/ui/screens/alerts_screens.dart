import 'package:flutter/material.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  void _mostrarAlerts(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: false,//esto hace que se pueda cerrar ventanas tocando cualquier parte de la pantalla
      barrierColor: Colors.black26,
      builder:(context){
        return  AlertDialog(
          backgroundColor: Colors.amberAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0) ),
          title: const Text('Titulo de Alerta'),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Contenido de la alerta'),
              FlutterLogo(
                size: 50.0,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
            child: const Text('aceptar')),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('cancelar')),
          ],
        );
      });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Alerts screen'),
      ),
    body:  Center(
      child: ElevatedButton(
      onPressed: () => _mostrarAlerts(context),
      child:const Text('Mostrar alertas')
      ),
    ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pop(context);
        },
        child: const Icon(Icons.keyboard_return_outlined),
      ),
    );
  }
}