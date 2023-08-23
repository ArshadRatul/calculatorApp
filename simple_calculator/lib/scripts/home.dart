import 'package:flutter/material.dart';
import 'package:simple_calculator/Widget/Button.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  static const Color color1= Color(0xff0a2430);
  static const Color color2= Color(0xff15435a);
  static const Color color3= Color(0xff083347);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  num num1=0;
  num pressed=0;
  num res=0;
  List<dynamic> values = [];
  List<dynamic> bracValues = [];
  num num2=0;
  String del='';
  String history= '';
  String display ='';

  //This function is to clear the current displayed number
  void clear(String text) {
    setState(() {
      display = '';
    });
  }

  //This function is to delete the last button pressed
  void back(String text){
    del=display;
    if(del.isNotEmpty){
      del=del.substring(0, del.length -1) ;
      display=del;
      setState(() {
      });
    }
  }

  //This function is to reset the calculator
  void allclear(String text){
    setState(() {
      history='';
      display='';
      num1=0;
      res=0;
      pressed=0;
      values.clear();
    });
  }

  // This function is to add the displayed value
  void numClick(String text) {
    setState(() {
      display += text;
    });
  }

  // This function is to handel negative value and negative button
  void neg(String text){
      if(display==''){
        numClick(text);
      }
      else{
        calc(text);
      }
  }

  // This function is to handle the operation buttons
  void calc(String text){
    // If equal was pressed once
    if(pressed==0) {
      setState(() {
        values.add(num.parse(display));
        history += display;
        values.add(text);
        history += text;
        display = '';
        print(values);
      });
    }
    // If equal was pressed more than once
    else{
      values.clear();
      pressed=0;
      history='';
      print(values);
      setState(() {
        values.add(num.parse(display));
        history += display;
        history += text;
        values.add(text);
        display = '';
        print(values);
      });
    }
  }
  // This function is to handle equal button
  void ans (String text){
    if(pressed==0) {
      pressed=1;
      values.add(num.parse(display));
      history += display;
      //values.add(text);
      print(values);
      res = values[0];
      for (var i = 1; i < values.length - 1; i++) {
        if (values[i] == '+') {
          res = res + values[i + 1];
        }
        else if (values[i] == '-') {
          res = res - values[i + 1];
        }
        else if (values[i] == '*') {
          res = res * values[i + 1];
        }
        else if (values[i] == '/') {
          res = res / values[i + 1];
        }
        else if (values[i] == '%') {
          res = res / 100 * values[i + 1];
        }
      }
      setState(() {
        display = res.toString();
      });
    }
    else{
      setState(() {
        display = res.toString();
      });
    }
  }

  //This function is to handle bracket functionality
  String ans2(){

      res = values[1];
      for (var i = 2; i < values.length - 2; i++) {
        if (values[i] == '+') {
          res = res + values[i + 1];
        }
        else if (values[i] == '-') {
          res = res - values[i + 1];
        }
        else if (values[i] == '*') {
          res = res * values[i + 1];
        }
        else if (values[i] == '/') {
          res = res / values[i + 1];
        }
        else if (values[i] == '%') {
          res = res / 100 * values[i + 1];
        }
      }
        return res.toString();

  }

//This function is to handle bracket operations
void brackets(String text){
  if (text==')'){
    values.add(num.parse(display));
    values.add(text);
    history+=display;
    history += text;

    print(values);
    display=ans2();
    setState(() {

    });
  }
  else{
    values.add(text);
    history += text;
    display = '';
    setState(() {

    });
  }

}
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyHomePage.color1,

        title: Text(widget.title, style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      backgroundColor: MyHomePage.color1,
      body:
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child:
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(history,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white54,
                    ),
                  ),
                ),
                alignment: Alignment.centerRight,
              ),
              Container(
                child:
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(display,
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                  ),
                  ),
                ),
                alignment: Alignment.centerRight,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(text: 'AC',fillColor: MyHomePage.color3,textSize: 18,  callback: allclear,height: 70,),
                  CalculatorButton(text: 'C',fillColor: MyHomePage.color3,textSize: 18, callback: clear,height: 70,),
                  CalculatorButton(text: '<',fillColor: MyHomePage.color3,textSize: 20, callback: calc,height: 70,),
                  CalculatorButton(text: '/',fillColor: MyHomePage.color3,textSize: 20, callback: calc,height: 70,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(text: '(',fillColor: MyHomePage.color3,textSize: 20, callback: brackets,height: 70,),
                  CalculatorButton(text: ')',fillColor: MyHomePage.color3,textSize: 20, callback: brackets,height: 70,),
                  CalculatorButton(text: '%',fillColor: MyHomePage.color3,textSize: 20, callback: calc,height: 70,),
                  CalculatorButton(text: '*',fillColor: MyHomePage.color3,textSize: 24, callback: calc,height: 70,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(text: '7',fillColor: MyHomePage.color3,textSize: 20, callback: numClick,height: 70,),
                  CalculatorButton(text: '8',fillColor: MyHomePage.color3,textSize: 20, callback: numClick,height: 70,),
                  CalculatorButton(text: '9',fillColor: MyHomePage.color3,textSize: 20, callback: numClick,height: 70,),
                  CalculatorButton(text: '-',fillColor: MyHomePage.color3,textSize: 30, callback: neg,height: 70,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(text: '4',fillColor: MyHomePage.color3,textSize: 20, callback: numClick,height: 70,),
                  CalculatorButton(text: '5',fillColor: MyHomePage.color3,textSize: 20, callback: numClick,height: 70,),
                  CalculatorButton(text: '6',fillColor: MyHomePage.color3,textSize: 20, callback: numClick,height: 70,),
                  CalculatorButton(text: '+',fillColor: MyHomePage.color3,textSize: 20, callback: calc,height: 70,),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalculatorButton(text: '1',fillColor: MyHomePage.color3,textSize: 20, callback: numClick,height: 70,),
                          CalculatorButton(text: '2',fillColor: MyHomePage.color3,textSize: 20, callback: numClick,height: 70,),
                          CalculatorButton(text: '3',fillColor: MyHomePage.color3,textSize: 20, callback: numClick,height: 70,),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalculatorButton(text: '0',fillColor: MyHomePage.color3,textSize: 20, callback: numClick,height: 70,),
                          CalculatorButton(text: '00',fillColor: MyHomePage.color3,textSize: 20, callback: numClick,height: 70,),
                          CalculatorButton(text: '.',fillColor: MyHomePage.color3,textSize: 30, callback: numClick,height: 70,),
                        ],
                      ),
                    ],
                  ),
                  CalculatorButton(text: '=',fillColor: MyHomePage.color2,textSize: 20, callback: ans,height: 140,),
                ],
              )

            ],
          ),
        )
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
