import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_billing/features/i_billing/data/datasource/remote/api/app_api.dart';
import 'package:i_billing/features/i_billing/presentation/new/bloc/new_contract_bloc/new_contract_event.dart';
import 'package:i_billing/features/i_billing/presentation/new/bloc/new_contract_bloc/new_contract_state.dart';

class NewContractBloc extends Bloc<NewContractEvent, NewContractState> {
  final AppApi _appApi;

  NewContractBloc(this._appApi)
      : super(const NewContractState(status: Status.initial)) {
    on<ChooseLitsoEvent>((event, emit) {
      final litso = event.choosedLitso;
      emit(state.copyWith(litso: litso));
      print("litso ${state.litso}");
    });

    on<GetFullName>((event, emit) {
      final fullName = event.fullName;
      emit(state.copyWith(fullName: fullName));
      print("fullName ${state.fullName}");
    });

    on<GetAdress>((event, emit) {
      final adress = event.adress;
      emit(state.copyWith(adress: adress));
      print("adress ${state.adress}");
    });

    on<GetInn>((event, emit) {
      final inn = event.inn;
      emit(state.copyWith(inn: inn));
      print("inn ${state.inn}");
    });

    on<ChooseStatusEvent>((event, emit) {
      final sts = event.choosedStatus;
      emit(state.copyWith(sts: sts));
      print("sts ${state.sts}");
    });

    on<SaveContractEvent>((event, emit) async {
      emit(state.copyWith(status: Status.loading));
      try {
        await _appApi.addContract();
        emit(state.copyWith(status: Status.success));
      } catch (_) {
        emit(state.copyWith(status: Status.fail));
      }
    });
  }
}
