
import 'package:calculatorapp/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.lime
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}
 class _HomeScreenState extends State<HomeScreen> {
  //void initState() {
  //super.initState();
  // currentTheme.addListener(() {
  //  print('Changes');
  //setState((){});
  //   });
  // }
   //  @override
  //  Widget build(BuildContext context) {
  //    return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     theme: ThemeData.light(),
  //    darkTheme: ThemeData.dark(),
  //   themeMode: currentTheme.currentTheme(),
  //    home: new HomeScreen()
  //   );
  //}
  // }
//}
   String equation = '0';
  String result = '0';
  String expression = '';
  double equationFontSize = 40.0;
  double resultFontSize = 50.0;

  takkiPressed(String takkiText) {
    setState(() {
      if (takkiText == 'AC') {
        equation = '0';
        result = '0';
        equationFontSize = 40.0;
        resultFontSize = 50.0;
      } else if (takkiText == '⌫') {
        equation = equation.substring(0, equation.length - 1);
        equationFontSize = 40.0;
        resultFontSize = 50.0;
        if (equation == '') {
          equation = '0';
        }
      } else if (takkiText == '=') {
        equationFontSize = 40.0;
        resultFontSize = 50.0;

        expression = equation;
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('÷', '/');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = 'Error';
        }
      }
      else {
        equationFontSize = 40.0;
        resultFontSize = 50.0;
        if (equation == '0') {
          equation = takkiText;
        } else {
          equation = equation + takkiText;
        }
      }
    });
  }

  Widget build(BuildContext context) {
    Widget takki(takkiText, Color color) {
      return Container(
        padding: EdgeInsets.only(bottom: 10.0),
        child: new RaisedButton(
          child: Text(
            takkiText,
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          onPressed: () => takkiPressed(takkiText),
          color: color,
          padding: EdgeInsets.all(20.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          elevation: 3,
        ),
      );
    }
    Widget takkizero(takkiText, Color color) {
      return Container(
          padding: EdgeInsets.only(bottom: 10.0),
          child: new RaisedButton(
            color: Colors.white,
            child: Text(takkiText,
              style: TextStyle(fontSize: 30),
            ),
            onPressed: () => takkiPressed(takkiText),
            padding: EdgeInsets.only(left: 85, top: 20, right: 85, bottom: 20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
                side: BorderSide(
                    color: Colors.lime
                )
            ),
          )
      );
    }
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Text(
                  equation, style: TextStyle(fontSize: equationFontSize))
          ),
          Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
              child: Text(result, style: TextStyle(fontSize: resultFontSize),)
          ),
          //Expanded(
          //  child: Divider(),
          //),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  //result,
                 // style: TextStyle(
                    //  color: Colors.lime,
                     // fontSize: 40.0),
                  //textAlign: TextAlign.right,
                ),
            //  )
              )],
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                takki('AC', Colors.lime),
                takki('⌫', Colors.lime),
                takki('%', Colors.lime),
                takki('÷', Colors.lime),
              ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                takki('7', Colors.black26),
                takki('8', Colors.black26),
                takki('9', Colors.black26),
                takki('×', Colors.lime),
              ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                takki('4', Colors.black26),
                takki('5', Colors.black26),
                takki('6', Colors.black26),
                takki('-', Colors.lime),
              ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                takki('1', Colors.black26),
                takki('2', Colors.black26),
                takki('3', Colors.black26),
                takki('+', Colors.lime),
              ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                takki('0', Colors.black26),
                takki('.', Colors.lime),
                takkizero('=', Colors.lime),
              ]),
        ],
      ),
    );
  }
}
// https://www.youtube.com/watch?v=l4bLPfS1uik
// https://www.youtube.com/watch?v=l7MspzeKmMw
// http://www.youtube.com/watch?v=H0cJ0gUlgE8-
// https://www.youtube.com/watch?v=frb-EioDmr0&t=490s