import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_billing/assets/Strings.dart';
import 'package:i_billing/assets/colors.dart';
import 'package:i_billing/features/i_billing/presentation/new/bloc/new_invoice_bloc/new_invoice_bloc.dart';
import 'package:i_billing/features/i_billing/presentation/new/bloc/new_invoice_bloc/new_invoice_event.dart';
import 'package:i_billing/features/i_billing/presentation/new/bloc/new_invoice_bloc/new_invoice_state.dart';
import 'package:i_billing/features/i_billing/presentation/new/widgets/text_form_field.dart';


class NewInvoiceForm extends StatefulWidget {
  const NewInvoiceForm({Key? key}) : super(key: key);

  @override
  State<NewInvoiceForm> createState() => _NewInvoiceFormState();
}

class _NewInvoiceFormState extends State<NewInvoiceForm> {
  String dropdownValue = ' ';
  String hintText = ' ';
  bool isSelected = false;
  final _nameController = TextEditingController();
  final _adressController = TextEditingController();
  final _innController = TextEditingController();

  late NewInvoiceBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<NewInvoiceBloc>(context);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _adressController.dispose();
    _innController.dispose();
    super.dispose();
  }


  String? selectedValue = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                xizmatNomiText,
                style: TextStyle(fontSize: 14, color: grey),
              ),
              MyTextFormField(
                _nameController,
                validator: (val) {
                  if (val!.length < 3) {
                    return notEmptyText;
                  }
                  return null;
                },
                onChanged: (String? value) {
                  if (value != null) {
                    _bloc.add(GetNameEvent(value));
                  }
                },
              ),
              const SizedBox(height: 16),
              Text(
                invoiceSumText,
                style: TextStyle(fontSize: 14, color: grey),
              ),
              MyTextFormField(
                _adressController,
                keyboardType: TextInputType.number,
                onChanged: (String? value) {
                  if (value != null) {
                    _bloc.add(GetCostEvent(value));
                  }
                },
              ),
              const SizedBox(height: 16),
              Text(
                statusInvoiceText,
                style: TextStyle(fontSize: 14, color: grey),
              ),
              DropdownButtonFormField2(
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: grey, width: 0.5),
                  ),
                ),
                isExpanded: true,
                hint: Text(
                  hintText,
                  style: const TextStyle(fontSize: 14),
                ),
                items: statusList
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return pleaseSelectText;
                  }
                  return null;
                },
                onChanged: (value) {
                  if (value != null) {
                    _bloc.add(ChooseStatusEvent(value));
                  }
                  selectedValue = value;
                  hintText = value!;
                },
                onSaved: (value) {
                  selectedValue = value.toString();
                },
                buttonStyleData: ButtonStyleData(
                  decoration: BoxDecoration(
                    border: Border.all(color: grey, width: 1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  height: 60,
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    color: dark,
                    border: Border.all(color: dark, width: 2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              BlocConsumer<NewInvoiceBloc, NewInvoiceState>(
                  listener: (context, state) {
                if (state.status == Status.success) {
                  Navigator.popUntil(
                      context, ModalRoute.withName(Navigator.defaultRouteName));
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                    savedText,
                  )));
                }
              }, builder: (context, state) {
                if (state.name.isNotEmpty &&
                    state.sts.isNotEmpty &&
                    state.cost.isNotEmpty) {
                  return SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        _bloc.add(SaveInvoiceEvent(
                            state.name, state.cost, state.sts));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: darkGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                      child: const Text(
                        saveInvoiceText,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  );
                }
                return const SizedBox();
              })
            ],
          ),
        ));
  }
  final List<String> statusList = [
    'Paid',
    'In Process',
    'Rejected by Payme',
    'Rejected by IQ',
  ];
}
