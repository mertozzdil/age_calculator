import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Age Calculator",
      theme: new ThemeData(primarySwatch: Colors.deepPurple),
      home: MyHomePage(),
    ));

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int age = 0;
  var selectedYear;

  void _showPicker() {
    showDatePicker(
            context: context,
            initialDate:
                new DateTime(2020), // ilk açılan ekrandaki başlangıç tarihi
            firstDate: new DateTime(1900), // alt sınır
            lastDate: new DateTime.now())
        .then((DateTime dt) {
      setState(() {
        selectedYear = dt.year;
        calculateAge();
      });
    });
  }

  void calculateAge() {
    setState(() {
      age = (2020 - selectedYear).toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Age Calculator"),
        centerTitle: true,
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center, // Dikey olarak ortalar.
          children: <Widget>[
            new OutlineButton(
              child: new Text(selectedYear != null
                  ? selectedYear.toString()
                  : "Select your year of birth"),
              borderSide: new BorderSide(color: Colors.black, width: 3.0),
              color: Colors.black,
              onPressed: _showPicker,
            ),
            new Padding(padding: const EdgeInsets.all(20.0)),
            new Text(
              "Your age is ${age.toString()}",
              style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
