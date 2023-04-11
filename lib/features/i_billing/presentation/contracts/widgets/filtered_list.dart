import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_billing/assets/Strings.dart';
import 'package:i_billing/assets/colors.dart';
import 'package:i_billing/features/i_billing/presentation/contracts/bloc/filter_bloc/filter_bloc.dart';
import 'package:i_billing/features/i_billing/presentation/contracts/bloc/filter_bloc/filter_state.dart';
import 'package:i_billing/features/i_billing/presentation/contracts/widgets/item.dart';
import 'package:i_billing/features/i_billing/presentation/contracts/widgets/place_holder.dart';
class FilteredList extends StatefulWidget {
  const FilteredList({Key? key}) : super(key: key);

  @override
  State<FilteredList> createState() => _FilteredListState();
}
class _FilteredListState extends State<FilteredList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(builder: (context, state) {
      if (state.startDate > 0 && state.contracts.isNotEmpty) {
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
      if (state.status == Status.loading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state.status == Status.fail) {
        return Center(
          child: Text(
            somethingWentWrongText,
            style: TextStyle(fontSize: 20.0, color: lightGreen),
          ),
        );
      }
      if (state.status == Status.initial) {
        return const EmptyPlaceHolder();
      }
      return const EmptyPlaceHolder();
    });
  }
}
