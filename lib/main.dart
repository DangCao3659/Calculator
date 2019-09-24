import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'calculator',
      home: Scaffold(
        backgroundColor: Color.fromRGBO(8,8, 8, 1),
        body: Container(
          child: Mainbody(),
          //Keyboard(),
        ),
      ),
    );
  }
}

class Mainbody extends StatefulWidget {
  @override
  Mainbody_State createState() =>
      // TODO: implement createState
      Mainbody_State();
}

class Mainbody_State extends State<Mainbody> {
  String output = '0';
  String _output = "0";
  double number1 = 0.0;
  double number2 = 0.0;
  String operand = "";

  buttonPress(String namekey) {
    if (namekey == "CE") {
      _output = "0";
      number1 = 0.0;
      number2 = 0.0;
      operand = "";
    } else if (namekey == "+" ||
        namekey == "-" ||
        namekey == "/" ||
        namekey == "X") {
      number1 = double.parse(output);

      operand = namekey;

      _output = "0";
    } else if (namekey == ".") {
      if (_output.contains(".")) {
        print("oops already contain dot");
        return null;
      } else {
        _output = _output + namekey;
      }
    } else if (namekey == "=") {
      number2 = double.parse(output);
      switch (operand) {
        case "+":
          _output = (number1 + number2).toString();
          break;
        case "-":
          _output = (number1 + number2).toString();
          break;
        case "x":
          _output = (number1 * number2).toString();
          break;
        case "/":
          _output = (number1 / number2).toString();
          break;
      }
    } else {
      _output = _output + namekey;
    }
    print(_output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(1);
    });
  }

  Widget button(String nameKey) {
    if(nameKey == "/" || nameKey == "x" || nameKey == "-" || nameKey == "+"){
      return MaterialButton(
        height: 70,
        minWidth: 70,
        shape: RoundedRectangleBorder(
           side: BorderSide(color: Color.fromRGBO(72, 155, 25, 1), width: 0.7),
            borderRadius: new BorderRadius.circular(35.0)),
        textColor: Color.fromRGBO(76, 112, 68, 1),
        color: Color.fromRGBO(31, 31, 31, 1),
        child: Text(
          nameKey,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          buttonPress(nameKey);
        });
    }
    else if(nameKey == "=")
    {
      return MaterialButton(
        height: 70,
        minWidth: 70,
        shape: RoundedRectangleBorder(
           side: BorderSide(color: Color.fromRGBO(72, 155, 25, 1), width: 0.7),
            borderRadius: new BorderRadius.circular(35.0)),
        textColor: Color.fromRGBO(255, 255, 255, 1),
        color: Color.fromRGBO(70, 117, 21, 1),
        child: Text(
          nameKey,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          buttonPress(nameKey);
        });
    }
    return MaterialButton(
        height: 70,
        minWidth: 70,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Color.fromRGBO(72, 155, 25, 1), width: 0.7),
            borderRadius: new BorderRadius.circular(35.0)),
        textColor: Color.fromRGBO(255, 255, 255, 1),
        color: Color.fromRGBO(31, 31, 31, 1),
        child: Text(
          nameKey,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          buttonPress(nameKey);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 42, right: 10, left: 10),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: Text(output ,style : TextStyle(color: Colors.white) , textScaleFactor: 7.0),
            ),
            Expanded(
              child: GridView.count(
                padding: EdgeInsets.only(top: 20),
                crossAxisSpacing: 7.0,
                mainAxisSpacing: 7.0,
                crossAxisCount: 4,
                children: <Widget>[                 
                  Divider(),
                  Divider(),
                  Divider(),
                  button("CE"),
                  button("7"),
                  button("8"),
                  button("9"),
                  button("/"),
                  button("4"),
                  button("5"),
                  button("6"),
                  button("x"),
                  button("1"),
                  button("2"),
                  button("3"),
                  button("-"),
                  button("."),
                  button("0"),
                  button("="),
                  button("+"),
                  
                ],
              ),
            )
          ],
        ));
  }
}
// class Result extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return null;
//   }
// }
