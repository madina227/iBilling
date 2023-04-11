import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:i_billing/assets/colors.dart';

class MyTextFormField extends StatefulWidget {
  final bool isInn;
  final bool isEnabled;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final Function(String? value) onChanged;

  const MyTextFormField(
    this.controller, {
    this.isInn = false,
    this.isEnabled = false,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  bool isVisible = false;
  final FocusScopeNode focusNode = FocusScopeNode();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      validator: widget.validator,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(color: grey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(color: grey, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(color: grey, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(color: grey, width: 1),
          ),
          suffixIcon:
              widget.isInn ? const Icon(CupertinoIcons.question_circle_fill) : null),

      // obscureText: widget.isInn ? !isVisible : isVisible,
      controller: widget.controller,
      textInputAction: TextInputAction.next,
      onChanged: widget.onChanged,
    );
  }
}
