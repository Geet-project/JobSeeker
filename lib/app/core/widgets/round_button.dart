
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
class CustomButton extends StatelessWidget {
  Color textColor;
  Color firstColor;
  Color secondColor;
  String ButtonText;
  double buttonTopLeftRadius, ht, wd,buttonTopRightRadius,buttonBottomLeftRadius,buttonBottomRightRadius;
  double textSize;
  String FontFamily;
  String routeName;
  Color borderColor;
  VoidCallback onCustomButtonPressed;






  CustomButton({
    required this.textColor,
    required this.firstColor,
    required this.secondColor,
    required this.ButtonText,
    required this.buttonBottomLeftRadius,
    required this.buttonBottomRightRadius,
    required this.buttonTopLeftRadius,
    required this.buttonTopRightRadius,
    required this.ht,
    required this.wd,
    required this.textSize,
    required this.FontFamily,
    required this.routeName,
    required this.borderColor,
    required this.onCustomButtonPressed,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ht,
      width: wd,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [firstColor, secondColor]),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(buttonTopLeftRadius), topRight: Radius.circular(buttonTopRightRadius),bottomLeft:Radius.circular(buttonBottomLeftRadius),
            bottomRight: Radius.circular(buttonBottomRightRadius)),
        border: Border.all(
          color: borderColor
        ),
      ),
      child: Align(
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: onCustomButtonPressed,
          child: Text(ButtonText,
            style: TextStyle (fontSize: textSize, color: textColor,
                fontFamily: FontFamily),),
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            onSurface: Colors.transparent,
            shadowColor: Colors.transparent,
            minimumSize: ui.Size(wd, ht),
            elevation: 0
            //make color or elevated button transparent
          ),
        ),
      ),
    );
  }
}
