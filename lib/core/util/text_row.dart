import 'package:flutter/cupertino.dart';
import 'package:i_billing/assets/colors.dart';

class TextRow extends StatelessWidget {
  final rightText;
  final leftText;
  const TextRow({Key? key, this.rightText, this.leftText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          leftText,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: textColor),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          rightText,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: grey),
        ),
      ],
    );
  }
}