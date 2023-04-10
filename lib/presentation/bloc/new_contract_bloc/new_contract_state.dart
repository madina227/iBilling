import 'package:flutter/material.dart';

enum Status {
  initial,
  loading,
  success,
  fail,
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

@immutable
class NewContractState {
  final Status status;
  final String litso;
  final String fullName;
  final String adress;
  final String inn;
  final String sts;

  const NewContractState(
      {this.status = Status.initial,
      this.litso = "",
      this.fullName = "",
      this.adress = "",
      this.inn = "",
      this.sts = ""});

  NewContractState copyWith(
      {Status? status,
      String? litso,
      String? fullName,
      String? adress,
      String? inn,
      String? sts}) {
    return NewContractState(
        status: status ?? this.status,
        litso: litso ?? this.litso,
        fullName: fullName ?? this.fullName,
        adress: adress ?? this.adress,
        inn: inn ?? this.inn,
        sts: sts ?? this.sts);
  }
}
