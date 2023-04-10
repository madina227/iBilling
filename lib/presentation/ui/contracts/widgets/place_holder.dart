import 'package:flutter/material.dart';
import '../../../../assets/Strings.dart';
import '../../../../assets/colors.dart';
import '../../../../assets/icons.dart';

class EmptyPlaceHolder extends StatelessWidget {
  const EmptyPlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        contractsIcon,
        const SizedBox(
          height: 16,
        ),
        Text(
          noContractsAreMadeText,
          style: TextStyle(
              fontSize: 14.0, color: grey, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
