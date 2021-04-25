import 'package:devquiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color fontColor;

  NextButtonWidget({
    required this.label,
    required this.backgroundColor,
    required this.fontColor,
  }) : super();

  NextButtonWidget.green({required String label})
      : this.backgroundColor = AppColors.darkGreen,
        this.fontColor = AppColors.white,
        this.label = label;

  NextButtonWidget.white({required String label})
      : this.backgroundColor = AppColors.white,
        this.fontColor = AppColors.grey,
        this.label = label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        onPressed: () => null,
        child: Text(label,
            style: GoogleFonts.notoSans(
              color: fontColor,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            )),
      ),
    );
  }
}
