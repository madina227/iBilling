import 'package:flutter/material.dart';

enum Status { initial, loading, success, fail }

class Date {
  final int day;
  final String weekDay;

  Date(this.day, this.weekDay);
}

@immutable
class CalendarState {
  final Status status;
  final int month;
  final int year;
  final List<Date> week;
  final DateTime currentDate;

  const CalendarState({this.status = Status
      .initial, this.month = 1, this.year = 2023, this.week = const[
  ], required this.currentDate,});

  CalendarState copyWith({
    Status? status,
    int? month,
    int? year,
    List<Date>? week,
    DateTime? currentDate,
  }) {
    return CalendarState(
        status: status ?? this.status,
        month: month ?? this.month,
        year: year ?? this.year,
        week: week ?? this.week,
        currentDate: currentDate ?? this.currentDate,);
  }
}
