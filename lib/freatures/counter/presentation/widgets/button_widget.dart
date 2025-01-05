import 'package:flutter/material.dart';
import 'package:weather_app_with_bloc_statemanagement/core/theme/app_palate.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonName;
  final Color buttonColor1;
  final Color buttonColor2;
  final VoidCallback onPressed;

  const ButtonWidget({
    super.key,
    required this.buttonName,
    required this.buttonColor1,
    required this.buttonColor2,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [buttonColor1, buttonColor2],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(150, 50),
          backgroundColor: AppPalate.transparentColor,
          shadowColor: AppPalate.transparentColor,
        ),
        child: Text(
          buttonName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: AppPalate.buttonTextColor,
          ),
        ),
      ),
    );
  }
}
