import 'package:flutter/material.dart';

class Temperature extends StatelessWidget {
  final double temperature;
  final double low;
  final double high;

  const Temperature({
    Key? key,
    required this.temperature,
    required this.low,
    required this.high,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Text(
            '${_formattedTemperature(temperature)}º',
            style: TextStyle(
              fontSize: 46,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        Column(
          children: [
            Text(
              'max: ${_formattedTemperature(high)}º',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w100,
                color: Colors.white,
              ),
            ),
            Text(
              'min: ${_formattedTemperature(low)}º',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w100,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  int _formattedTemperature(double t) => t.round();
}
