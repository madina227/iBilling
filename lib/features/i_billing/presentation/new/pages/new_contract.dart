import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_billing/assets/Strings.dart';
import 'package:i_billing/assets/colors.dart';
import 'package:i_billing/core/util/circle_gradient.dart';
import 'package:i_billing/features/i_billing/presentation/contracts/bloc/filter_bloc/filter_bloc.dart';
import 'package:i_billing/features/i_billing/presentation/new/widgets/new_contract_form.dart';
import 'package:i_billing/injection_controller.dart';

class NewContractScreen extends StatefulWidget {
  const NewContractScreen({Key? key}) : super(key: key);

  @override
  State<NewContractScreen> createState() => _NewContractScreenState();
}

class _NewContractScreenState extends State<NewContractScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FilterBloc>(
        create: (context) => FilterBloc(di.get()),
        child: Scaffold(
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
        ));
  }
}
