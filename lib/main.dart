import 'package:flutter/material.dart';
import 'pig.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PIG WEIGHT CALCULATOR',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _con =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.jpg'),
                fit: BoxFit.cover,
              )
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 40 ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          children: [
                            Text('PIG WEIGHT', style: TextStyle(fontSize: 35.0, color: Colors.pink), ),
                            Text('CALCULATOR', style: TextStyle(fontSize: 35.0, color: Colors.pink), ),
                          ],
                        ),
                      ),

                    ],
                  ),

                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40.0 ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Image.asset('assets/images/pig.png',height: 140,),
                    ],
                  ),

                ),
              Padding(
            padding: const EdgeInsets.only(bottom: 40.0 ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: _controller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      hintText: 'Enter Length (cm)',
                    ),
                  ),
                  height: 90.0,
                  width: 400,
                ),
                SizedBox(

                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: _con,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      hintText: 'Enter girth (cm)',
                    ),
                  ),
                  height: 90.0,
                  width: 400,
                ),
          ]
        ),
      ),
                SizedBox(
                  height: 65.0,
                  width: 150.0,
                  child: ElevatedButton(
                    child: Text('CALCULATE', style: TextStyle(fontSize: 15.0, color: Colors.white)),
                    onPressed: () {
                      var input1 = _controller.text;
                      var input2 = _con.text;
                      var length = double.tryParse(input1);
                      var girth = double.tryParse(input2);
                      String titleError = 'Error';
                      String errorMessage = 'Wrong input, Please enter number only.';
                      if(girth == null || length == null){
                        showDialog(context: context, barrierDismissible: false, builder: (BuildContext context, ) {
                          return AlertDialog(
                            title: Text(titleError),
                            content: Text(errorMessage),

                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Ok')
                              ),
                            ],
                          );
                        });
                      }
                      var weight ;
                      weight = girth! * girth! * length! * 69.3;








                    },
                  ),
                ),
              ],
            ),
          ),

        ),
      ),
    );
  }
}