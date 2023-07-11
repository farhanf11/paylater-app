import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({Key? key}) : super(key: key);

  @override
  _MyHomeAppState createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Country State City Picker"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: CSCPicker(
          layout: Layout.vertical,
          flagState: CountryFlag.DISABLE,
          onCountryChanged: (country) {},
          onStateChanged: (state) {},
          onCityChanged: (city) {},
          countryDropdownLabel: "*Country",
          stateDropdownLabel: "*State",
          cityDropdownLabel: "*City",
        ),
      ),
    );
  }
}