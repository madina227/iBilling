import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_billing/features/i_billing/data/datasource/remote/api/app_api.dart';
import 'package:i_billing/features/i_billing/presentation/new/bloc/new_invoice_bloc/new_invoice_event.dart';
import 'package:i_billing/features/i_billing/presentation/new/bloc/new_invoice_bloc/new_invoice_state.dart';


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
