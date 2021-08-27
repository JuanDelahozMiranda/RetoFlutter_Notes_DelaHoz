import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ViewRemind extends StatefulWidget {
  @override
  _ViewRemind createState() => _ViewRemind();
}

class _ViewRemind extends State<ViewRemind>{
  var txtIdRemind = TextEditingController();
  var txtDescripRedmi= TextEditingController();
  final _scaffkey = GlobalKey<ScaffoldState>();

  var remindi;
  _ViewRemind({this.remindi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffkey,
        appBar: AppBar(
            title: Text("Agregar recordatorio"),
            actions: <Widget>[
              IconButton(onPressed: _showInfoSnackBar, icon: Icon(Icons.home)),
            ]),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextField(
                    decoration: InputDecoration(labelText: "Nombre del recordatorio"),
                    controller: txtIdRemind,
                    keyboardType: TextInputType.name
                ),
                Divider(color: Colors.white, height: 60),
                TextField(
                    decoration: InputDecoration(labelText: "Descripcion"),
                    controller: txtDescripRedmi,
                    keyboardType: TextInputType.text
                ),
                Divider(color: Colors.white, height: 60),
                OutlinedButton(onPressed:() =>  onPressed(context), child: Text("Guardar"))
              ]),
        )
    );
  }

  void onPressed(BuildContext context){
    if(txtIdRemind.text.isNotEmpty && txtDescripRedmi.text.isNotEmpty){
      String valor1=txtIdRemind.text;
      String valor2=txtDescripRedmi.text;
      txtIdRemind.text="";
      txtDescripRedmi.text="";
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