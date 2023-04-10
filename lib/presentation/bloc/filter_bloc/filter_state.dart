import 'package:flutter/material.dart';
import 'package:i_billing/data/source/remote/model/user_contract.dart';

enum Status { initial, loading, success, fail }

// enum Statuses { paid, inProcess, rejectedByPayme, rejectedByIQ }

@immutable
class FilterState {
  final Status status;
  final List<String> statuses;
  final List<UserContractData> contracts;
  final int startDate;
  final int endDate;

  const FilterState(
      {this.status = Status.initial,
      this.statuses = const [],
      this.startDate = 0,
      this.endDate = 0,
      this.contracts = const []});

  FilterState copyWith(
      {List<String>? statuses,
      int? startDate,
      int? endDate,
      Status? status,
      List<UserContractData>? contracts}) {
    return FilterState(
        status: status ?? this.status,
        statuses: statuses ?? this.statuses,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        contracts: contracts ?? this.contracts);
  }
}
