import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController weightController = new TextEditingController();
  TextEditingController heightController = new TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Informe seus dados";

  void _resetFields(){
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _infoText = "Informe seus dados";
    });
  }

  void _calculate(){
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text)/100;
      double imc = weight/(height*height);

      debugPrint("$imc");

      if(imc < 18.6){
        _infoText = "Abaixo do peso! ${imc.toStringAsPrecision(3)}";
      }else{
        _infoText = "isso ae! ${imc.toStringAsPrecision(3)}";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetFields,
          )
        ],
      ),
      backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
        child: Form(
          key: _formKey,
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(Icons.person, size: 120, color: Colors.amber),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Peso (kg)",
                      labelStyle: TextStyle(color: Colors.white)),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red, fontSize: 25.0),
                  controller: weightController,
                  validator: (value){
                    if(value.isEmpty){
                      return "Insira seu Peso!";
                    }
                  },
                ),
//                TextField(
//                  keyboardType: TextInputType.number,
//                  decoration: InputDecoration(
//                      labelText: "Peso (kg)",
//                      labelStyle: TextStyle(color: Colors.white)),
//                  textAlign: TextAlign.center,
//                  style: TextStyle(color: Colors.red, fontSize: 25.0),
//                  controller: weightController,
//                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Altura (cm)",
                      labelStyle: TextStyle(color: Colors.white)),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red, fontSize: 25.0),
                  controller: heightController,
                   validator: (value) {
                     if (value.isEmpty) {
                       return "Insira sua altura!";
                     }
                   },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Container(
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: (){
                        if(_formKey.currentState.validate()){
                          _calculate();
                        }
                      },
                      child: Text("Calcular", style: TextStyle(color: Colors.white, fontSize: 25.0),),
                      color: Colors.green,
                    ),
                  ),
                ),
                Text(_infoText,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green, fontSize: 25.0),
                )
              ],
            ),
        ),
      ),
    );
  }
}
