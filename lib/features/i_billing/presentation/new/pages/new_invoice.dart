import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_billing/assets/Strings.dart';
import 'package:i_billing/assets/colors.dart';
import 'package:i_billing/core/util/circle_gradient.dart';
import 'package:i_billing/features/i_billing/presentation/new/bloc/new_invoice_bloc/new_invoice_bloc.dart';
import 'package:i_billing/features/i_billing/presentation/new/widgets/new_invoice_form.dart';
import 'package:i_billing/injection_controller.dart';

class NewInvoiceScreen extends StatefulWidget {
  const NewInvoiceScreen({Key? key}) : super(key: key);

  @override
  State<NewInvoiceScreen> createState() => _NewInvoiceScreenState();
}

class _NewInvoiceScreenState extends State<NewInvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewInvoiceBloc>(
        create: (context) => NewInvoiceBloc(di.get()),
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
              newInvoiceText,
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: NewInvoiceForm(),
        ));
  }
}
