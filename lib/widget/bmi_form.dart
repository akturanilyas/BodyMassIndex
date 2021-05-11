import 'dart:math';
import 'package:body_mass_index/providers/bmi_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class BMIForm extends StatefulWidget {
  @override
  _BMIFormState createState() => _BMIFormState();
}

class _BMIFormState extends State<BMIForm> {
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Provider Configurations
    var bmi_provider = Provider.of<BMIFormProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          TextField(
            controller: heightController,
            decoration: InputDecoration(labelText: "Enter your height..."),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: weightController,
            decoration: InputDecoration(
              labelText: "Enter your weight...",
            ),
            keyboardType: TextInputType.number,
          ),
          RaisedButton(
            child: Icon(Icons.calculate),
            textColor: Colors.blue[400],
            color: Colors.lightGreen[200],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0)),
            onPressed: () {
              if (heightController.text != '' && weightController.text != '') {
                bmi_provider.setHeight(int.parse(heightController.text));
                bmi_provider.setWeight(double.parse(weightController.text));
                bmi_provider.setResult(
                    bmi_provider.weight / pow((bmi_provider.height / 100), 2));
              }
            },
          ),
          bmi_provider.result != 0.0
              ? Text(bmi_provider.result.toStringAsFixed(2))
              : Container(),
          _calculate(bmi_provider.result),
        ],
      ),
    );
  }
}

Widget _calculate(double result) {
  String text;
  Color color;
  
  if (result == 0) {
    text = '';
  } else if (result > 40) {
    color = Colors.red[300];
    text = "Very severely obese";
  } else if (result > 35) {
    color = Colors.red[300];
    text = "Severely obese";
  } else if (result > 30) {
    color = Colors.red[300];
    text = "Moderately obese";
  } else if (result > 25) {
    color = Colors.red[300];
    text = "Overweight";
  } else if (result > 18.5) {
    color = Colors.green[300];
    text = "Normal (healthy weight)";
  } else if (result > 16) {
    color = Colors.red[300];
    text = "Underweight";
  } else if (result > 15) {
    color = Colors.red[300];
    text = "Severely Underweight";
  } else {
    color = Colors.red[300];
    text = "Very Severely Underweight";
  }

  return Text(
    text,
    style: TextStyle(color: color, fontSize: 24),
  );
}
