import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final weight1 = TextEditingController();
  final feet1 = TextEditingController();
  final inch1 = TextEditingController();
  String result = '';
  var bgColor = Colors.white;

  @override
  void dispose() {
    weight1.dispose();
    feet1.dispose();
    inch1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('YOUR BMI REPORT'),
      ),
      body: SingleChildScrollView( // Wrap with SingleChildScrollView
        child: Container(
          color: bgColor,
          child: Center(
            child: Container(
              width: 300,
              height: 300,
              child: Column(
                children: [
                  const Text(
                    'BMI',
                    style: TextStyle(fontSize: 45),
                  ),
                  TextField(
                    controller: weight1,
                    decoration: const InputDecoration(
                      labelText: 'Enter your weight in kg',
                      prefixIcon: Icon(Icons.line_weight_rounded),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: feet1,
                    decoration: const InputDecoration(
                      labelText: 'Enter your height in feet',
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                 const SizedBox(height: 11),
                  TextField(
                    controller: inch1,
                    decoration: const InputDecoration(
                      labelText: 'Enter your height in inches',
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: ElevatedButton(
                      onPressed: () {
                        var wt = weight1.text.toString();
                        var inch = inch1.text.toString();
                        var feet = feet1.text.toString();
                        if (wt.isNotEmpty && inch.isNotEmpty && feet.isNotEmpty) {
                          var iwt = int.parse(wt);
                          var ift = int.parse(feet);
                          var iinch = int.parse(inch);
                          var tinch = (ift * 12) + iinch;
                          var tcm = tinch * 2.54;
                          var tm = tcm / 100;
                          var bmi = iwt / (tm * tm);
                          var msg = " ";
                          if (bmi > 25) {
                            msg = "you are overweight";
                            bgColor = Colors.orange.shade100;
                          } else if (bmi < 18) {
                            msg = "you are underweight";
                            bgColor = Colors.red.shade100;
                          } else {
                            msg = "you are healthy";
                            bgColor = Colors.green.shade100;
                          }
                          setState(() {
                            result = '$msg \n Your BMI is ${bmi.toStringAsFixed(3)}';
                          });
                        } else {
                          setState(() {
                            result = 'Please fill all the required lines';
                          });
                        }
                      },
                      child: const Text('Calculate'),
                    ),
                  ),
                  const SizedBox(height: 11),
                  Text(
                    result,
                    style: const TextStyle(fontSize: 45),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
