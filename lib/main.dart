import 'package:flutter/material.dart';
import 'package:flutter_custom_dropdowns/custom_dropdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

// ignore: must_be_immutable
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String dropdownValue1 = 'One';
  String dropdownValue2 = 'Two';

  @override
  Widget build(BuildContext context) {
    double dropdownWidth =
        (MediaQuery.of(context).size.width - 40.0 - 48.0) / 2;
    return Scaffold(
//      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text('Native Dropdown Demo ThaiMatch'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Row(
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Parent label 1'),
                  SizedBox(
                    height: 10.0,
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        width: dropdownWidth,
                        child: _createCustomDropDown(
                            Icon(
                              FontAwesomeIcons.sort,
                              size: 20,
                            ),
                            1),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Parent label 2'),
                  SizedBox(
                    height: 10.0,
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        width: dropdownWidth,
                        child: _createCustomDropDown(
                            Icon(Icons.keyboard_arrow_down), 2),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _createCustomDropDown(Icon icon, int menuIndex) {
    return CustomDropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Some label',
        isDense: true,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      dropDownIcon: icon,
      value: (menuIndex == 1) ? dropdownValue1 : dropdownValue2,
      onChanged: (String newValue) {
        setState(() {
          (menuIndex == 1)
              ? dropdownValue1 = newValue
              : dropdownValue2 = newValue;
        });
      },
      items: <String>[
        'One',
        'Two',
        'Free',
        'Four',
      ].map<CustomDropdownMenuItem<String>>((String value) {
        return CustomDropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
