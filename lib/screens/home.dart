import 'package:body_mass_index/widget/bmi_form.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Body Mass Index"),
      ),
      body: BMIForm(),
    );
  }
}
