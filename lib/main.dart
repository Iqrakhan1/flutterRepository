import 'package:flutter/material.dart'; //package

void main() {
  // main method
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "calculator",
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int firstNum = 0; //inputs
  int secondNum = 0;
  String res = ' ';
  String texttodisplay = ' ';
  String oprator = ' ';
  void btnClicked(String btnval) {
    if (btnval == "C") {
      texttodisplay = "";
      firstNum = 0;
      secondNum = 0;
      res = "";
    } else if (btnval == "+" ||
        btnval == "-" ||
        btnval == "x" ||
        btnval == "/") {
      firstNum = int.parse(texttodisplay);
      res = " ";
      oprator = btnval;
      //oprations
    } else if (btnval == "=") {
      secondNum = int.parse(texttodisplay);
      if (oprator == "+") {
        res = (firstNum + secondNum).toString();
      }
      if (oprator == "-") {
        res = (firstNum - secondNum).toString();
      }
      if (oprator == "x") {
        res = (firstNum * secondNum).toString();
      }
      if (oprator == "/") {
        res = (firstNum / secondNum).toString();
      }
    } else {
      res = int.parse(texttodisplay + btnval).toString();
    }
    setState(() {
      texttodisplay = res; //result
    });
  }

  Widget costombutton(String butval) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: OutlinedButton(
          onPressed: () => btnClicked(butval),
          child: Text(butval, style: TextStyle(fontSize: 50.0)),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
              child: Container(
            padding: EdgeInsets.all(30.0),
            alignment: Alignment.bottomRight,
            child: Text(
              "$texttodisplay",
              style: const TextStyle(
                fontSize: 60.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          )),
          Row(
            children: [
              costombutton("9"),
              costombutton("8"),
              costombutton("7"),
              costombutton("+"),
            ],
          ),
          Row(
            children: <Widget>[
              costombutton("6"),
              costombutton("5"),
              costombutton("4"),
              costombutton("-")
            ],
          ),
          Row(
            children: <Widget>[
              costombutton("3"),
              costombutton("2"),
              costombutton("1"),
              costombutton("x"),
            ],
          ),
          Row(
            children: <Widget>[
              costombutton("C"),
              costombutton("0"),
              costombutton("="),
              costombutton("/"),
            ],
          )
        ],
      )),
    );
  }
}
