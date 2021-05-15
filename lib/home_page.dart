import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _tax;
  String amount;
  double ans = 0.0, total = 0.0;
  TextEditingController t1 = new TextEditingController(text: "");
  void _clear() {
    setState(() {
      ans = 0.0;
      total = 0.0;
      t1.text = "";
      amount = "";
    });
  }

  void _cal() {
    setState(() {
      amount = (t1.text);
      if (amount.isEmpty) {
        ans = 0.0;
        total = 0.0;
      } else {
        if (_tax != null) {
          ans = (double.parse(amount) * _tax) / 100;
          total = ans + double.parse(amount);
        }
      }
    });
  }

  Widget _bodyWidget() {
    return Container(
      padding: new EdgeInsets.all(8),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                autofocus: false,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                controller: t1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Amount",
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              ),
              DropdownButtonFormField<int>(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
                focusColor: Colors.white,
                value: _tax,
                // elevation: 5,
                style: TextStyle(color: Colors.white),
                iconEnabledColor: Colors.black,
                items: <int>[5, 12, 18, 28]
                    .map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(
                      value.toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                hint: Text(
                  "Please choose a tax",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onChanged: (int value) {
                  setState(() {
                    _tax = value;
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              ),
              TextField(
                enabled: false,
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Amount : $amount ",
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              ),
              TextField(
                enabled: false,
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Tax    : $ans",
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              ),
              TextField(
                enabled: false,
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Total  : $total",
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              ),
              TextButton(
                child: Icon(Icons.clear),
                onPressed: _clear,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Tax Calculator"),
      ),
      body: _bodyWidget(),
      floatingActionButton: FloatingActionButton(
        child: new Icon(Icons.calculate),
        onPressed: _cal,
      ),
    );
  }
}
