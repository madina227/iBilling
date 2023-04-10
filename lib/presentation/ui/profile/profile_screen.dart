import 'package:flutter/material.dart';
import 'package:i_billing/assets/icons.dart';
import 'package:i_billing/presentation/ui/utils/text_row.dart';
import 'package:jiffy/jiffy.dart';

import '../../../assets/Strings.dart';
import '../../../assets/colors.dart';
import '../utils/circle_gradient.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkest,
        leading: const Padding(
          padding: EdgeInsets.only(
            left: 20.0,
            top: 14,
            bottom: 13,
          ),
          child: CircleGradient(),
        ),
        title: const Text(
          profileText,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: dark, borderRadius: BorderRadius.circular(6)),
              child: Column(
                children: [
                  Row(
                    children: [
                      userPlaceholder,
                      const SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${Jiffy.now().startOf(Unit.week).date+1}',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: lightGreen),
                          ),
                          Text(
                            graficDesText,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: textColor),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const TextRow(
                    leftText: dateOfBirthText,
                    rightText: date2Text,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const TextRow(
                    leftText: phoneNumberText,
                    rightText: phone2Text,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const TextRow(
                    leftText: eMailText,
                    rightText: mail2Text,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                  color: dark, borderRadius: BorderRadius.circular(6)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    englishLang,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: textColor),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(36),
                    child: flagUs,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
