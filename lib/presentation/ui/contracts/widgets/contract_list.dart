import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_billing/data/source/remote/model/user_contract.dart';
import 'package:i_billing/presentation/bloc/main_bloc/main_bloc.dart';
import 'package:i_billing/presentation/ui/contracts/widgets/item.dart';
import 'package:i_billing/presentation/ui/contracts/widgets/place_holder.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../assets/colors.dart';
import '../../../../assets/icons.dart';
import '../../../../data/source/remote/model/user_data.dart';
import '../../../bloc/main_bloc/main_state.dart';
import '../../utils/text_row.dart';

class ContractList extends StatefulWidget {
  const ContractList({Key? key}) : super(key: key);

  @override
  State<ContractList> createState() => _ContractListState();
}

class _ContractListState extends State<ContractList> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainBloc, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ContractLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ContractErrorState) {
            return Center(
              child: Text(
                'Something went wrong',
                style: TextStyle(fontSize: 20.0, color: lightGreen),
              ),
            );
          }
          if (state is ContractEmptyState) {
            return const EmptyPlaceHolder();
          }
          if (state is ContractsLoadedState) {
            return ListView.separated(
              scrollDirection: Axis.vertical,
              physics: const ClampingScrollPhysics(),
              itemCount: state.userContracts.length,
              itemBuilder: (BuildContext context, int index) {
                return ContractItem(contractData: state.userContracts[index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 12,
                );
              },
            );
          }
          if (state is InvoicecLoadedState) {
            return ListView.separated(
              scrollDirection: Axis.vertical,
              physics: const ClampingScrollPhysics(),
              itemCount: state.invoice.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 140,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: dark, borderRadius: BorderRadius.circular(6)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          contractIcon,
                          Text(
                            "№ ${state.invoice[index].id}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                                color: alfaLightGreen,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "${state.invoice[index].status}",
                              style: TextStyle(
                                  color: lightGreen,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextRow(
                        leftText: "Name of Invoice",
                        rightText: "${state.invoice[index].name}",
                      ),
                      TextRow(
                        leftText: "Amount invoice:",
                        rightText: "${state.invoice[index].cost} UZS",
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          state.invoice[index].createdDate != null
                              ? Jiffy.parseFromDateTime(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          state.invoice[index].createdDate! *
                                              1000))
                                  .format(pattern: 'dd.MM.yyyy hh:mm')
                              : "",
                          style: TextStyle(
                              color: grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 12,
                );
              },
            );
          }
          return const SizedBox.shrink();
        });
  }
}
