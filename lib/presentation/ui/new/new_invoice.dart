import 'package:flutter/material.dart';
import 'package:i_billing/presentation/ui/new/widgets/new_invoice_form.dart';

import '../../../assets/Strings.dart';
import '../../../assets/colors.dart';
import '../utils/circle_gradient.dart';

class NewInvoiceScreen extends StatefulWidget {
  const NewInvoiceScreen({Key? key}) : super(key: key);

  @override
  State<NewInvoiceScreen> createState() => _NewInvoiceScreenState();
}

class _NewInvoiceScreenState extends State<NewInvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          newInvoiceText,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: NewInvoiceForm(),
    );
  }
}
