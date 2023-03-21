import 'package:flutter/material.dart';

//definir un mapa
final _icons = <String, IconData>{
    'add_alert' : Icons.add_alert,
    'input' : Icons.input,
    'folder_open' : Icons.folder_open,
    'data' : Icons.data_exploration,
    'list' : Icons.list,
    'camera' :Icons.camera_alt,

};

Icon getIcon(String iconName) {
  return Icon(
    _icons[iconName],
    color: Colors.indigoAccent,
  );
}