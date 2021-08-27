import 'package:app_demo/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ViewNote extends StatefulWidget {
  @override
  _ViewNote createState() => _ViewNote();
}

class _ViewNote extends State<ViewNote>{
  var txtIdNota= TextEditingController();
  var txtDescripcion= TextEditingController();
  final _scaffkey = GlobalKey<ScaffoldState>();

  var noti;
  _ViewNote({this.noti});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffkey,
      appBar: AppBar(
          title: Text("Agregar nota"),
          actions: <Widget>[
          IconButton(onPressed: _showInfoSnackBar, icon: Icon(Icons.home)),
      ]),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
          TextField(
              decoration: InputDecoration(labelText: "Nombre de la nota"),
              controller: txtIdNota,
              keyboardType: TextInputType.name
          ),
          Divider(color: Colors.white, height: 60),
          TextField(
              decoration: InputDecoration(labelText: "Descripcion"),
              controller: txtDescripcion,
              keyboardType: TextInputType.text
          ),
          Divider(color: Colors.white, height: 60),
          OutlinedButton(onPressed:() =>  onPressed(context), child: Text("Guardar"))
        ]),
      )
      );
  }

  void onPressed(BuildContext context){
    if(txtIdNota.text.isNotEmpty && txtDescripcion.text.isNotEmpty){
      String valor1=txtIdNota.text;
      String valor2=txtDescripcion.text;
      txtIdNota.text="";
      txtDescripcion.text="";
      Navigator.pop(context, valor1);
    }else{
      _showErrorSnackBar();
    }
  }

  void _showErrorSnackBar(){
    SnackBar snackbar = SnackBar(
      content: Text("** Ingresa ambos campos **"),
      action: SnackBarAction(label: "Aceptar", onPressed: (){},),
    );
    // ignore: deprecated_member_use
    _scaffkey.currentState!.showSnackBar(snackbar);
  }

  void _showInfoSnackBar(){
    SnackBar snackbar = SnackBar(
      content: Text("En construccion"),
      action: SnackBarAction(label: "Aceptar", onPressed: (){},),
    );
    // ignore: deprecated_member_use
    _scaffkey.currentState!.showSnackBar(snackbar);
  }
}