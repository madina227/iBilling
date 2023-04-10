import 'package:equatable/equatable.dart';

abstract class MainEvent extends Equatable {}

class ContractsEvent extends MainEvent {
  @override
  List<Object?> get props => [];
}

class ContractsEmptyEvent extends MainEvent {
  @override
  List<Object?> get props => [];
}

class FiltrContractsWithDateEvent extends MainEvent {
  final int startTime;
  final int endTime;
  final bool isContractPressed;
  final bool isInvoicePressed;

  FiltrContractsWithDateEvent(this.startTime, this.endTime,
      {this.isContractPressed = false, this.isInvoicePressed = false});

  @override
  List<Object?> get props => [];
}

class InvoicesEvent extends MainEvent {
  @override
  List<Object?> get props => [];
}

class SearchByQueryEvent extends MainEvent {
  final String? query;

  SearchByQueryEvent({required this.query});

  @override
  List<Object?> get props => [];
}

class DeleteContractEvent extends MainEvent {
  final String index;

  DeleteContractEvent({required this.index});

  @override
  List<Object?> get props => [];
}

class SavedContractsEvent extends MainEvent {
  @override
  List<Object?> get props => [];
}

class StartDateEvent extends MainEvent {
  final int startTime;

  StartDateEvent({
    required this.startTime,
  });

  @override
  List<Object?> get props => [];
}

class EndDateEvent extends MainEvent {
  final int endDate;

  EndDateEvent({
    required this.endDate,
  });

  @override
  List<Object?> get props => [];
}

class StatusesEvent extends MainEvent {
  final List<String> statuses;

  StatusesEvent({
    required this.statuses,
  });

  @override
  List<Object?> get props => [];
}
//
// class FilterEvent extends MainEvent{
//
//
//
//   @override
//   List<Object?> get props => [];
// }
