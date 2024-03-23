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
  final weightController = TextEditingController();
  final feetController = TextEditingController();
  final inchController = TextEditingController();
  String result = '';
  var bgColor = Colors.white;

  @override
  void dispose() {
    weightController.dispose();
    feetController.dispose();
    inchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('YOUR BMI REPORT'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: bgColor,
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Container(
                width: 300,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'BMI',
                      style: TextStyle(fontSize: 45),
                    ),
                    TextField(
                      controller: weightController,
                      decoration: const InputDecoration(
                        labelText: 'Enter your weight in kg',
                        prefixIcon: Icon(Icons.line_weight_rounded),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: feetController,
                      decoration: const InputDecoration(
                        labelText: 'Enter your height in feet',
                        prefixIcon: Icon(Icons.height),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 11),
                    TextField(
                      controller: inchController,
                      decoration: const InputDecoration(
                        labelText: 'Enter your height in inches',
                        prefixIcon: Icon(Icons.height),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        double weight = double.tryParse(weightController.text) ?? 0;
                        double feet = double.tryParse(feetController.text) ?? 0;
                        double inches = double.tryParse(inchController.text) ?? 0;

                        if (weight > 0 && feet > 0 && inches > 0) {
                          double heightInMeters = ((feet * 12) + inches) * 0.0254;
                          double bmi = weight / (heightInMeters * heightInMeters);

                          String category;
                          if (bmi < 18.5) {
                            category = 'Underweight';
                          } else if (bmi < 24.9) {
                            category = 'Normal weight';
                          } else if (bmi < 29.9) {
                            category = 'Overweight';
                          } else {
                            category = 'Obese';
                          }

                          setState(() {
                            result = 'Your BMI: ${bmi.toStringAsFixed(2)}\nCategory: $category';
                            bgColor = Colors.green.shade100;
                          });
                        } else {
                          setState(() {
                            result = 'Please fill all the required fields with valid numbers';
                            bgColor = Colors.red.shade100;
                          });
                        }
                      },
                      child: const Text('Calculate'),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      result,
                      style: const TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
