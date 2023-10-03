import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: BmiCalculator(),
  ));
}

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  final weight = TextEditingController(), height = TextEditingController();
  String? result;

  void calculate() {
    final w = double.parse(weight.text);
    var h = double.parse(height.text);

    if (w <= 0 || h <= 0) {
      return;
    }

    h /= 100;

    final ans = w / (h * h);
    var data;

    if (ans <= 18.5) {
      data = 'Underweight';
    } else if (ans > 18.5 && ans <= 24.9) {
      data = 'Normal';
    } else if (ans >= 25 && ans <= 29.9) {
      data = 'Overweight';
    } else {
      data = 'Obese';
    }

    setState(() {
      result = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 133, 115),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text(
                            'Enter Weight (in kgs)',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextField(
                            decoration:
                                const InputDecoration(labelText: 'weight'),
                            keyboardType: TextInputType.number,
                            controller: weight,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text(
                            overflow: TextOverflow.clip,
                            'Enter Height (in cm)',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextField(
                            decoration:
                                const InputDecoration(labelText: 'height'),
                            keyboardType: TextInputType.number,
                            controller: height,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: calculate,
              child: const Text('Calculate'),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              result != null ? result! : 'No Data entered',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
