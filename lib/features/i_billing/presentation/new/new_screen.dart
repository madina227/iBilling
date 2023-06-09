import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:i_billing/assets/Strings.dart';
import 'package:i_billing/assets/colors.dart';
import 'package:i_billing/core/util/circle_gradient.dart';
import 'package:i_billing/features/i_billing/presentation/new/widgets/dialog.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({Key? key}) : super(key: key);

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) => _showDialog());
  }

  _showDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return const MyDialog();
        });
  }

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
          newText,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
