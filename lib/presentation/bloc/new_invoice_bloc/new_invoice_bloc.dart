import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/source/remote/api/app_api.dart';
import 'new_invoice_event.dart';
import 'new_invoice_state.dart';

class NewInvoiceBloc extends Bloc<NewInvoiceEvent, NewInvoiceState> {
  final AppApi _appApi;

  NewInvoiceBloc(this._appApi) : super(const NewInvoiceState(status: Status.initial)) {
    final List<String> statusList = [
      'Paid',
      'In Process',
      'Rejected by Payme',
      'Rejected by IQ',
    ];

    on<GetNameEvent>((event, emit) {
      final name = event.name;
      emit(state.copyWith(name: name));
      print("name ${state.name}");
    });

    on<GetCostEvent>((event, emit) {
      final cost = event.cost;
      emit(state.copyWith(cost: cost));
      print("cost ${state.cost}");
    });

    on<ChooseStatusEvent>((event, emit) {
      final sts = event.choosedStatus;
      emit(state.copyWith(sts: sts));
      print("sts ${state.sts}");
    });

    on<SaveInvoiceEvent>((event, emit) async {
      emit(state.copyWith(status: Status.loading));
      try {
        await _appApi.addInvoice();
        emit(state.copyWith(status: Status.success));
      } catch (_) {
        emit(state.copyWith(status: Status.fail));
      }
    });
  }
}
