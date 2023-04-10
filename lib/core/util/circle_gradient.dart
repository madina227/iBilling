import 'package:flutter/material.dart';
import 'package:i_billing/assets/colors.dart';

class CircleGradient extends StatelessWidget {
  const CircleGradient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width:24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            mediumSpringGreen,
            blue,
            tongerineYellow,
            electricPurple,
            mediumSpringGreen2
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}