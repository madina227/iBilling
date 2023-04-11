import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_billing/assets/Strings.dart';
import 'package:i_billing/features/i_billing/presentation/contracts/bloc/filter_bloc/filter_bloc.dart';
import 'package:i_billing/features/i_billing/presentation/contracts/widgets/filter_head.dart';
import 'package:i_billing/features/i_billing/presentation/contracts/widgets/filtered_list.dart';
import 'package:i_billing/injection_controller.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late FilterBloc _filterBloc;

  @override
  void initState() {
    _filterBloc = BlocProvider.of<FilterBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FilterBloc>(create: (context) => FilterBloc(di.get()),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            filtersText,
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: const [FilterHead(), Expanded(child: FilteredList())],
        ),
      ),
    );
  }
}
