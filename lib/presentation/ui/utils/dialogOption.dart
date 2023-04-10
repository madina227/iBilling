import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:i_billing/assets/colors.dart';

class DialogOption extends StatefulWidget {
  final SvgPicture icon;
  final String text;
  final Function() onTap;

  const DialogOption({Key? key, required this.icon, required this.text, required this.onTap}) : super(key: key);

  @override
  State<DialogOption> createState() => _DialogOptionState();
}

class _DialogOptionState extends State<DialogOption> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(color: dark, borderRadius: BorderRadius.circular(6)),
        child: Row(
          children: [
            widget.icon,
            const SizedBox(width: 15,),
            Text(
              widget.text,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: textColor),
            )
          ],
        ),
      ),
    );
  }
}
