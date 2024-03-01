import 'package:flutter_application_1/constants/app_constants.dart';
import 'package:flutter_application_1/widgets/left_bar.dart';
import 'package:flutter_application_1/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";
  String _category = "";

  // Add a flag to determine the current unit system
  bool isMetric = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "BMI Calculator",
            style:
                TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: mainHexColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 130,
                    child: TextField(
                      controller: _heightController,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: accentHexColor),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Height",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8)),
                      ),
                    ),
                  ),
                  // Display user input for height
                  Text(
                    isMetric
                        ? '${_heightController.text} cm'
                        : '${_heightController.text} inches',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
            ),
          ),
        ],
      ),
// Display user input for weight
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 130,
            child: TextField(
              controller: _weightController,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w300,
                  color: accentHexColor),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Weight",
                hintStyle: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w300,
                    color: Colors.white.withOpacity(.8)),
              ),
            ),
          ),
          // Display user input for weight
          Text(
            isMetric
                ? '${_weightController.text} kg'
                : '${_weightController.text} lbs',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
              Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Use Metric Units',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          Switch(
            value: isMetric,
            onChanged: (value) {
              setState(() {
                isMetric = value;
              });
            },
          ),
        ],
      ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  double _h = isMetric
                      ? double.parse(_heightController.text)
                      : double.parse(_heightController.text) * 0.0254; // Convert inches to meters

                  double _w = isMetric
                      ? double.parse(_weightController.text)
                      : double.parse(_weightController.text) * 0.453592; // Convert pounds to kilogramsdouble _h = double.parse(_heightController.text);
                  
                  setState(() {
                    _bmiResult = _w / (_h * _h);
                    if (_bmiResult >= 40) {
                      _textResult = "You are serverly obese";
                    } else if (_bmiResult >= 30 && _bmiResult < 40) {
                      _textResult = "You are obese";
                    } else if (_bmiResult >= 25 && _bmiResult < 30) {
                      _textResult = "You are over-weight";
                    } else if (_bmiResult >= 18.5 && _bmiResult < 25) {
                      _textResult = "You are a healthy weight";
                    } else {
                      _textResult = "You are under weight";
                    }
                  });
                },
                child: Container(
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: accentHexColor),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                child: Text(
                  _bmiResult.toStringAsFixed(2),
                  style: TextStyle(fontSize: 90, color: accentHexColor),
                ),
              ),
              SizedBox(height: 30,),
              Visibility(
                  visible: _textResult.isNotEmpty,
                  child: Container(
                    child: Text(
                      _textResult,
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w400,
                          color: accentHexColor),
                    ),
                  )),
              SizedBox(height: 10,),
              LeftBar(barWidth: 40,),
              SizedBox(height: 20,),
              LeftBar(barWidth: 70),
              SizedBox(height: 20,),
              LeftBar(barWidth: 40,),
              SizedBox(height: 20,),
              RightBar(barWidth: 70),
              SizedBox(height: 50,),
              RightBar(barWidth: 70),

              LeftBar(barWidth: 30,),
              SizedBox(height: 10,),
              LeftBar(barWidth: 40),
              SizedBox(height: 10,),
              LeftBar(barWidth: 60,),
              SizedBox(height: 70,),
              RightBar(barWidth: 80),
              SizedBox(height: 40,),
              RightBar(barWidth: 70),
            ],
          ),
        ));
  }
}
