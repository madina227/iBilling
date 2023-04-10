import 'package:flutter/material.dart';

enum Status {
  initial,
  loading,
  success,
  fail,
}

@immutable
class NewInvoiceState {
  final Status status;
  final String name;
  final String cost;
  final String sts;

  const NewInvoiceState(
      {this.status = Status.initial,
      this.name = "",
      this.cost = "",
      this.sts = ""});

  NewInvoiceState copyWith(
      {Status? status,
      String? name,
      String? cost,
      String? sts}) {
    return NewInvoiceState(
        status: status ?? this.status,
        name: name ?? this.name,
        cost: cost ?? this.cost,
        sts: sts ?? this.sts);
  }
}
