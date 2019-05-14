import 'package:flutter/material.dart';

/*void main(){
  runApp(MaterialApp(
    title: "Teste",
    home: Container(color: Colors.blue,)
  ));
}*/

void main() {
  runApp(MaterialApp(
      title: "Teste",
      home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //global
  int _people = 0;
  String _infoText = "Pode entrar";

  void _changePeople(){
    if(_people < 0){
      _infoText = "Mundo invertido!";
    }else if(_people <= 10){
      _infoText = "Pode entrar!";
    }else{
      _infoText = "Capacidade máxima permitida!";
    }

     setState(() {
     });
  }

//  void _changePeople(int delta){
//     setState(() {
//       _people += delta;
//     });
//  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/back.jpg",
          fit: BoxFit.cover,
          height: 1000,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Pessoas: ${_people}",
                style:
                TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text("Add",
                        style:
                        TextStyle(color: Colors.red,)
                    ),
                    onPressed: (){
                      _people++;
                      //_changePeople(1);
                      _changePeople();
                      debugPrint("clicou");},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text("Sub",
                        style:
                        TextStyle(color: Colors.red,)
                    ),
                    onPressed: (){
                      _people--;
                      //_changePeople(-1);
                      _changePeople();
                      debugPrint("clicou");
                    },
                  ),
                ),
              ],
            ),
            Text(_infoText,
                style: TextStyle(
                    color: Colors.red,
                    fontStyle: FontStyle.italic,
                    fontSize: 30.0))
          ],
        )
      ],
    );
  }
}
