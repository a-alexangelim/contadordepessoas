import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Contados de Pessoas",
    home: Home()));
}

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  String _infoText = "Pode Entrar!";
  int _people = 0;

  void _changePeople(int delta){
    setState(() {
      _people += delta;

      if (_people < 0) {
        _infoText = "Mundo Invertido!?";
      } else if (_people <= 10) {
        _infoText = "Pode Entrar!";
      } else {
        _infoText = "Lotado!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset("images/restaurante.jpg", fit: BoxFit.cover, height: 1000.0,
        ),
        Column(mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[Text("Pessoas: $_people", 
                                       style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold)),
        Row(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Padding(padding: EdgeInsets.all(10.0),
              child: TextButton(style: TextButton.styleFrom(backgroundColor: Colors.blueGrey,
                                                            elevation: 5,
                                                            shadowColor: Colors.cyan),
                                                            child: Text("+1", style: TextStyle(color: Colors.white),),
                                onPressed: () {
                                  _changePeople(1);
                                  },),
            ),

            Padding(padding: EdgeInsets.all(10.0),
              child: TextButton(style: TextButton.styleFrom(backgroundColor: Colors.blueGrey,
                                                            elevation: 5,
                                                            shadowColor: Colors.cyan),
                                                            child: Text("-1", style: TextStyle(color: Colors.white),),
                                onPressed: () {
                                  _changePeople(-1);
                                  },),
            ),
          ],
        ),
        Text(_infoText, style: TextStyle(color: Colors.blueGrey, 
                                              fontStyle: FontStyle.italic,
                                              fontSize: 30.0))
      ],
    )
      ],
    );
  }
}