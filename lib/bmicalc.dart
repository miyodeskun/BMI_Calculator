import 'package:flutter/material.dart';

class BmiCalcPage extends StatefulWidget {
  const BmiCalcPage({Key? key}) : super(key: key);

  @override
  State<BmiCalcPage> createState() => _BmiCalcPageState();
}

class _BmiCalcPageState extends State<BmiCalcPage> {
  TextEditingController heightEditingController = TextEditingController();
  TextEditingController weightEditingController = TextEditingController();
  double height = 0.0, weight = 0.0, bmi = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Center(
        child: Column(
          children: [
            Flexible(
                flex: 4,
                child: Image.asset('assets/images/measuretape.png', scale: 2)),
            Flexible(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Text(
                          'BMI Calculator',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: heightEditingController,
                          keyboardType: const TextInputType.numberWithOptions(),
                          decoration: InputDecoration(
                              hintText: 'Height in meter',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: weightEditingController,
                          keyboardType: const TextInputType.numberWithOptions(),
                          decoration: InputDecoration(
                              hintText: 'Weight in Kg',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                            onPressed: _calBMI,
                            child: const Text("Get my BMI")),
                        const SizedBox(height: 10),
                        Text(
                          'Your BMI ' + bmi.toStringAsPrecision(3),
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  void _calBMI() {
    height = double.parse(heightEditingController.text);
    weight = double.parse(weightEditingController.text);
    setState(() {
      bmi = weight / (height * height);
    });
  }
}
