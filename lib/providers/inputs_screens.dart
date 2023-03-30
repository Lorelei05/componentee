import 'package:flutter/material.dart';

class InputsScreens extends StatefulWidget {
  const InputsScreens({super.key});

  @override
  State<InputsScreens> createState() => _InputsScreensState();
}

class _InputsScreensState extends State<InputsScreens> {
  String _userName = '';
  String _password = '';
  String _email = '';
  String _fecha = '';
  final TextEditingController _inputFieldDateController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entradas de datos por el usuario'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _crearEntradaNombre(),
          const Divider(),
          _crearEntradaPassword(),
          const Divider(),
          _crearEntradaEmail(),
          const Divider(),
          _crearEntradaFecha(),
          const Divider(),
        ],
      ),
    );
  }

  Widget _crearEntradaNombre() {
    return TextField(
        autofocus: true,
        textAlign: TextAlign.center,
        textCapitalization: TextCapitalization.sentences,
        style:const TextStyle(
          color: Colors.amberAccent,
          fontWeight: FontWeight.bold
        ),
        cursorColor: Colors.red,
        cursorRadius: const Radius.circular(10.0),
        cursorWidth: 5.0,
        maxLines: null,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
          hintText: "Escriba su nombre de usuario",
          labelText: ('User'),
          icon :const Icon(Icons.person),
          iconColor: Colors.blueGrey,
          //prefix: const CircularProgressIndicator(),
        ),
        onChanged: (valor) {
          _userName = valor;
          print(_userName);
        }
        );
  }

  Widget _crearEntradaPassword() {
    return TextField(
        autofocus: true,
        textAlign: TextAlign.center,
        textCapitalization: TextCapitalization.sentences,
        style:const TextStyle(
          color: Colors.amberAccent,
          fontWeight: FontWeight.bold
        ),
        cursorColor: Colors.red,
        cursorRadius: const Radius.circular(10.0),
        keyboardType: TextInputType.number,
        cursorWidth: 5.0,
        obscureText: true,
        maxLength: 8,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
          hintText: "Escriba su password",
          labelText: ('Password'),
          icon :const Icon(Icons.password),
          iconColor: Colors.blueGrey,
          //prefix: const CircularProgressIndicator(),
        ),
        onChanged: (valor) {
          _password= valor;
          print(_password);
        }
        );
  }

  Widget _crearEntradaEmail() {
    return TextField(
        autofocus: true,
        textAlign: TextAlign.center,
        textCapitalization: TextCapitalization.sentences,
        style:const TextStyle(
          color: Colors.amberAccent,
          fontWeight: FontWeight.bold
        ),
        cursorColor: Colors.red,
        cursorRadius: const Radius.circular(10.0),
        cursorWidth: 5.0,
        maxLength: 25,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
          hintText: "Escriba su Email",
          labelText: ('Email'),
          icon :const Icon(Icons.email),
          iconColor: Colors.blueGrey,
          //prefix: const CircularProgressIndicator(),
        ),
        onChanged: (valor) {
          _email = valor;
          print(_email);
        }
        );
  }

   Widget _crearEntradaFecha() {
    return TextField(
        controller: _inputFieldDateController,
        enableInteractiveSelection: false,
        textAlign: TextAlign.center,
        textCapitalization: TextCapitalization.sentences,
        style:const TextStyle(
          color: Colors.amberAccent,
          fontWeight: FontWeight.bold
        ),
        cursorColor: Colors.red,
        cursorRadius: const Radius.circular(10.0),
        cursorWidth: 5.0,
        maxLength: 25,
        keyboardType: TextInputType.datetime,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
          hintText: "fecha de Nacimiento",
          labelText: ('fecha de Nacimiento'),
          icon :const Icon(Icons.calendar_month),
          iconColor: Colors.blueGrey,
          //prefix: const CircularProgressIndicator(),
        ),
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
          _selectDate(context);
        });
  }

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2025),
    );
    if (picked != null){
      setState(() {
        _fecha = picked.toString();
        print(_fecha);
        _inputFieldDateController.text = _fecha;
      });
    }
  }
}