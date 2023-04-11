import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_billing/assets/Strings.dart';
import 'package:i_billing/assets/colors.dart';
import 'package:i_billing/features/i_billing/presentation/contracts/widgets/item.dart';
import 'package:i_billing/features/i_billing/presentation/contracts/widgets/place_holder.dart';
import 'package:i_billing/features/i_billing/presentation/main/bloc/main_bloc/main_bloc.dart';
import 'package:i_billing/features/i_billing/presentation/main/bloc/main_bloc/main_state.dart';

class SavedList extends StatefulWidget {
  const SavedList({Key? key}) : super(key: key);

  @override
  State<SavedList> createState() => _SavedListState();
}

class _SavedListState extends State<SavedList> {
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
                somethingWentWrongText,
                style: TextStyle(fontSize: 20.0, color: lightGreen),
              ),
            );
          }
          if (state is ContractEmptyState) {
            return const EmptyPlaceHolder();
          }
          if (state is SavedState) {
            return ListView.separated(
              scrollDirection: Axis.vertical,
              physics: const ClampingScrollPhysics(),
              itemCount: state.contracts.length,
              itemBuilder: (BuildContext context, int index) {
                return ContractItem(contractData: state.contracts[index]);
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
