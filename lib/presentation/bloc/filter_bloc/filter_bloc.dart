import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_billing/presentation/bloc/filter_bloc/filer_event.dart';
import 'package:i_billing/presentation/bloc/filter_bloc/filter_state.dart';

import '../../../data/source/remote/api/app_api.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  final AppApi _appApi;
  late final List<String> statuses = [];
  late int startDate = 0;
  late int endDate = DateTime.now().millisecondsSinceEpoch;

  FilterBloc(this._appApi) : super(const FilterState(status: Status.initial)) {
    on<StatusCheckEvent>((event, emit) async {
      if (!statuses.contains(event.checkedStatus)) {
        statuses.add(event.checkedStatus);
        // print("cheked1 ${state.statuses}");
        emit(state.copyWith(status: Status.success, statuses: statuses));
        // print("cheked2 ${state.statuses}");
        if (state.statuses.isNotEmpty && startDate > 0) {
          emit(state.copyWith(status: Status.loading));
          print("ttt1 $statuses, $startDate, $endDate");
          try {
            final contracts =
                await _appApi.filterContracts(statuses, startDate, endDate);
            // print("ttt2 $contracts");
            // for(int i=0; i<contracts.length; i++){
            //   contracts[i].status==statuses[0];
            // }
            emit(state
                .copyWith(status: Status.success, contracts: [...contracts]));
            // print("ttt $statuses, $startDate, $endDate");
          } catch (_) {
            emit(state.copyWith(status: Status.fail));
          }
        } else {
          emit(state.copyWith(status: Status.initial));
        }
      }
    });

    on<StatusUncheckEvent>((event, emit) async {
      emit(state.copyWith(status: Status.initial));
      if (statuses.contains(event.uncheckedStatus)) {
        statuses.remove(event.uncheckedStatus);
        emit(state.copyWith(status: Status.initial));
        if (state.statuses.isNotEmpty && startDate > 0) {
          print("cheked1 ${state.statuses}");
          emit(state.copyWith(status: Status.success, statuses: statuses));
          print("cheked2 ${state.statuses}");
          emit(state.copyWith(status: Status.loading));
          print("ttt1 $statuses, $startDate, $endDate");
          try {
            final contracts =
                await _appApi.filterContracts(statuses, startDate, endDate);
            print("ttt2 $contracts");
            emit(state
                .copyWith(status: Status.success, contracts: [...contracts]));
            print("ttt $statuses, $startDate, $endDate");
          } catch (_) {
            emit(state.copyWith(status: Status.fail));
          }
        } else {
          emit(state.copyWith(status: Status.initial));
        }
      }
    });

    on<ChooseStartDateEvent>((event, emit) async {
      emit(state.copyWith(status: Status.initial));
      startDate = event.startDate;
      emit(state.copyWith(status: Status.success, startDate: startDate));
      print("cheked3 ${state.startDate}");
      if (state.startDate > 0) {
        emit(state.copyWith(status: Status.loading));
        try {
          final contracts =
              await _appApi.filterContracts(statuses, startDate, endDate);
          emit(state
              .copyWith(status: Status.success, contracts: [...contracts]));
        } catch (_) {
          emit(state.copyWith(status: Status.fail));
        }
      } else {
        emit(state.copyWith(status: Status.initial));
      }
    });
    on<ChooseEndDateEvent>((event, emit) async {
      emit(state.copyWith(status: Status.initial));
      endDate = event.endDate;
      emit(state.copyWith(status: Status.success, endDate: endDate));
      print("cheked4 ${state.endDate}");
      if (state.startDate > 0) {
        emit(state.copyWith(status: Status.loading));
        try {
          final contracts =
              await _appApi.filterContracts(statuses, startDate, endDate);
          emit(state
              .copyWith(status: Status.success, contracts: [...contracts]));
        } catch (_) {
          emit(state.copyWith(status: Status.fail));
        }
      } else {
        emit(state.copyWith(status: Status.initial));
      }
    });

    // if (state.startDate > 0 &&
    //     state.endDate > 0 &&
    //     state.statuses.isNotEmpty) {
    //   emit(state.copyWith(status: Status.loading));
    //   try {
    //     final contracts = await _appApi.filterContracts(
    //         event.checkedStatuses, event.startDate, event.endDate);
    //     emit(state.copyWith(
    //         status: Status.success, contracts: [...state.contracts]));
    //   } catch (_) {}
    // }

    // on<FilterRequestEvent>((event, emit) async {
    //   if (state.startDate > 0 &&
    //       state.endDate > 0 &&
    //       state.statuses.isNotEmpty) {
    //     emit(state.copyWith(status: Status.loading));
    //     try {
    //       final contracts = await _appApi.filterContracts(
    //           event.checkedStatuses, event.startDate, event.endDate);
    //       emit(state.copyWith(
    //           status: Status.success, contracts: [...state.contracts]));
    //     } catch (_) {}
    //   }
    // });
  }
}
