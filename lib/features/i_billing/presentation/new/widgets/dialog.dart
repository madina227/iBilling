import 'package:flutter/material.dart';
import 'package:i_billing/assets/Strings.dart';
import 'package:i_billing/assets/colors.dart';
import 'package:i_billing/assets/icons.dart';
import 'package:i_billing/core/util/dialog_option.dart';
import 'package:i_billing/features/i_billing/presentation/new/pages/new_contract.dart';
import 'package:i_billing/features/i_billing/presentation/new/pages/new_invoice.dart';

class MyDialog extends StatefulWidget {
  const MyDialog({Key? key}) : super(key: key);

  @override
  State<MyDialog> createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: dark,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        height: 200,
        width: double.infinity,
        child: Column(
          children: [
            const Text(
              whatDoYouWantText,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 6),
              child: DialogOption(
                icon: contractIcon,
                text: contractText,
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NewContractScreen()));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16, top: 6),
              child: DialogOption(
                icon: invoiceIcon,
                text: invoiceText,
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NewInvoiceScreen()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
