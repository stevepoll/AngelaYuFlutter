import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color buttonColor;
  final Function buttonPressed;
  final String buttonText;

  RoundedButton({
    @required this.buttonColor,
    @required this.buttonPressed,
    @required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: buttonColor,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: buttonPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            buttonText,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
