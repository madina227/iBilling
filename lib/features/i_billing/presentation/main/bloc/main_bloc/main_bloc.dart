import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_billing/features/i_billing/data/datasource/remote/api/app_api.dart';
import 'package:i_billing/features/i_billing/presentation/main/bloc/main_bloc/main_event.dart';
import 'package:i_billing/features/i_billing/presentation/main/bloc/main_bloc/main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final AppApi _appApi;

  MainBloc(this._appApi) : super(ContractEmptyState()) {
    on<ContractsEvent>((event, emit) async {
      emit(ContractLoadingState());
      print("hello from mainBloc");
      try {
        print("hello from mainBloc try");
        final userContracts = await _appApi.contracts();
        print("data from main bloc $userContracts");
        if (userContracts.isEmpty) {
          emit(ContractEmptyState());
        } else {
          emit(ContractsLoadedState(userContracts: userContracts));
        }
      } catch (_) {
        print("hello from mainBloc catch");
        emit(ContractErrorState());
      }
    });

    on<ContractsEmptyEvent>((event, emit) async {
      emit(ContractEmptyState());
    });

    on<FiltrContractsWithDateEvent>((event, emit) async {
      emit(ContractLoadingState());
      try {
        final userContracts =
            await _appApi.getContractsWithDate(event.startTime, event.endTime);
        final invoices =
            await _appApi.getInvoicesWithDate(event.startTime, event.endTime);
        if (event.isContractPressed) {
          if (userContracts.isEmpty) {
            emit(ContractEmptyState());
          } else {
            emit(ContractsLoadedState(userContracts: userContracts));
          }
        } else if (event.isInvoicePressed) {
          if (userContracts.isEmpty) {
            emit(ContractEmptyState());
          } else {
            emit(InvoicecLoadedState(invoice: invoices));
          }
        } else {
          emit(ContractEmptyState());
        }
      } catch (_) {
        emit(ContractErrorState());
      }
    });

    on<SearchByQueryEvent>((event, emit) async {
      emit(ContractLoadingState());
      try {
        final contracts = await _appApi.searchByQuery(query: event.query);
        if (contracts.isEmpty) {
          emit(ContractEmptyState());
        } else {
          emit(ContractsLoadedState(userContracts: contracts));
        }
      } catch (_) {
        emit(ContractErrorState());
      }
    });

    on<DeleteContractEvent>((event, emit) async {
      emit(ContractLoadingState());
      try {
        await _appApi.deleteContract(event.index);
        emit(BackToHomeState());
      } catch (_) {}
    });

    on<SavedContractsEvent>((event, emit) async {
      emit(ContractLoadingState());
      try {
        final contracts = await _appApi.getSavedContracts();
        if (contracts.isEmpty) {
          emit(ContractEmptyState());
        } else {
          emit(SavedState(contracts: contracts));
        }
      } catch (_) {}
    });

    on<StartDateEvent>((event, emit) async {
      emit(ContractLoadingState());
      try {
        final contracts = await _appApi.getSavedContracts();
        if (contracts.isEmpty) {
          emit(ContractEmptyState());
        } else {
          emit(ContractsLoadedState(userContracts: contracts));
        }
      } catch (_) {}
    });
  }
}
