import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_billing/presentation/ui/new/widgets/new_contract_form.dart';

import '../../../assets/Strings.dart';
import '../../../assets/colors.dart';
import '../utils/circle_gradient.dart';

class NewContractScreen extends StatefulWidget {
  const NewContractScreen({Key? key}) : super(key: key);

  @override
  State<NewContractScreen> createState() => _NewContractScreenState();
}

class _NewContractScreenState extends State<NewContractScreen> {
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
          newContractText,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const NewContractForm(),
    );
  }
}
