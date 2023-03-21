import 'package:componentes/providers/menu_providers.dart';
import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  const HomePageTemp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('componentes de flutter'),
      ),
      body: _lista(),
    );
  }
}

Widget _lista() {
  //recuperacion de datos de un archivo .json
  // print(menuProvider.opciones);
  // menuProvider.loadData().then((opciones) {
  //   print('_lista: ');
  //   print(opciones);
  // });
  //return ListView(
  // children: _listaItems(),
  // );
  return FutureBuilder(
    future: menuProvider.loadData(),
    builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
      print('builder: ');
      print(snapshot.data);
      return ListView(
        children: _listaItems(snapshot.data as List<dynamic>),
      );
    },
  );
}

List<Widget> _listaItems(List<dynamic> data){
  final List<Widget> opciones =[];

  data.forEach((opt){
    final tile = ListTile(
      title: Text(opt['texto']),
      leading: const Icon(Icons.account_box, 
      color: Color.fromARGB(255, 187, 8, 5),),
      trailing: const Icon(Icons.keyboard_arrow_right,
      color: Color.fromARGB(255, 255, 0, 0),
      ),
      subtitle: Text(opt['texto2']),
      onTap: () {
        
      },
      );
    opciones
      ..add(tile)
      ..add(const Divider());
  });
  return opciones;
  // return const [
  //   ListTile(
  //     title: Text('Pittsburgh Steelers'),
  //     subtitle: Text('El mejor equipo de la NFL y el maximo campeon'),
  //   ),
  //   Divider(
  //     thickness: 5.0,
  //     color: Colors.red,
  //   ),
  //   ListTile(
  //     title: Text('Marco'),
  //     subtitle: Text('es un comandante'),
  //   ),
  //   Divider(
  //     thickness: 5.0,
  //     color: Colors.blue,
  //   ),
  //   ListTile(
  //     title: Text('SV-001'),
  //     subtitle: Text('es un Tanque'),
  //   ),
  //   Divider(
  //     thickness: 5.0,
  //     color: Colors.green,
  //   ),
  // ];
}
