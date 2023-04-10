import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_billing/assets/Strings.dart';
import 'package:i_billing/presentation/bloc/new_contract_bloc/new_contract_bloc.dart';
import 'package:i_billing/presentation/bloc/new_contract_bloc/new_contract_event.dart';
import 'package:i_billing/presentation/bloc/new_contract_bloc/new_contract_state.dart';
import 'package:i_billing/presentation/ui/new/widgets/text_form_field.dart';

import '../../../../assets/colors.dart';

class NewContractForm extends StatefulWidget {
  const NewContractForm({Key? key}) : super(key: key);

  @override
  State<NewContractForm> createState() => _NewContractFormState();
}

class _NewContractFormState extends State<NewContractForm> {
  String dropdownValue = ' ';
  String hintText = ' ';
  bool isSelected = false;
  final _fishController = TextEditingController();
  final _adressController = TextEditingController();
  final _innController = TextEditingController();

  late NewContractBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<NewContractBloc>(context);
  }

  @override
  void dispose() {
    _fishController.dispose();
    _adressController.dispose();
    _innController.dispose();
    super.dispose();
  }

  String? selectedValue = '';

  final _formKey = GlobalKey<FormState>();
  late int selectedRadio;

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
                litsoText,
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
                items: items
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
                  //Do something when changing the item if you want.
                  if (value != null) {
                    _bloc.add(ChooseLitsoEvent(value));
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
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                fullNameText,
                style: TextStyle(fontSize: 14, color: grey),
              ),
              MyTextFormField(
                _fishController,
                validator: (val) {
                  if (val!.length < 3) {
                    return notEmptyText;
                  }
                  return null;
                },
                onChanged: (String? value) {
                  if (value != null) {
                    _bloc.add(GetFullName(value));
                  }
                },
              ),
              const SizedBox(height: 16),
              Text(
                adressOrganizationText,
                style: TextStyle(fontSize: 14, color: grey),
              ),
              MyTextFormField(
                _adressController,
                validator: (val) {
                  if (val!.length < 3) {
                    return notEmptyText;
                  }
                  return null;
                },
                onChanged: (String? value) {
                  if (value != null) {
                    _bloc.add(GetAdress(value));
                  }
                },
              ),
              const SizedBox(height: 16),
              Text(
                innText,
                style: TextStyle(fontSize: 14, color: grey),
              ),
              MyTextFormField(
                _innController,
                isInn: true,
                validator: (val) {
                  if (val!.length < 3) {
                    return notEmptyText;
                  }
                  return null;
                },
                onChanged: (String? value) {
                  if (value != null) {
                    _bloc.add(GetInn(value));
                  }
                },
              ),
              const SizedBox(height: 16),
              Text(
                statusOfTheContractText,
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
              BlocConsumer<NewContractBloc, NewContractState>(
                listener: (context, state){
                  if(state.status==Status.success){
                    Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          savedText,
                        )));
                  }
                },
                  builder: (context, state) {
                print(
                    "build inn-${state.inn}, adress-${state.adress}, name-${state.fullName}, litso-${state.litso}, status-${state.sts}");
                if (state.fullName.isNotEmpty &&
                    state.litso.isNotEmpty &&
                    state.sts.isNotEmpty &&
                    state.inn.isNotEmpty &&
                    state.adress.isNotEmpty) {
                  return SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        _bloc.add(SaveContractEvent(state.litso, state.fullName,
                            state.adress, state.inn, state.sts));

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: darkGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                      child: const Text(
                        saveContractText,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  );
                }
                return SizedBox();
              })
            ],
          ),
        ));
  }

  final List<String> items = [
    'Физическое',
    'Юридическое',
  ];

  final List<String> statusList = [
    'Paid',
    'In Process',
    'Rejected by Payme',
    'Rejected by IQ',
  ];
}
