import 'package:equatable/equatable.dart';
import 'package:i_billing/data/source/remote/model/user_contract.dart';
import '../../../data/source/remote/model/user_invoice.dart';

abstract class MainState extends Equatable {}

class ContractEmptyState extends MainState {
  @override
  List<Object?> get props => [];
}

class ContractLoadingState extends MainState {
  @override
  List<Object?> get props => [];
}

class ContractsLoadedState extends MainState {
  List<UserContractData> userContracts;

  ContractsLoadedState({required this.userContracts});

  @override
  List<Object?> get props => [];
}

class InvoicecLoadedState extends MainState {
  List<InvoiceData> invoice;

  InvoicecLoadedState({required this.invoice});

  @override
  List<Object?> get props => [];
}

class SavedState extends MainState {
  List<UserContractData> contracts;

  SavedState({required this.contracts});

  @override
  List<Object?> get props => [];
}

class ContractErrorState extends MainState {
  @override
  List<Object?> get props => [];
}

class BackToHomeState extends MainState {
  @override
  List<Object?> get props => throw UnimplementedError();
}
