import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_billing/assets/Strings.dart';
import 'package:i_billing/presentation/ui/contracts/widgets/filter_head.dart';
import 'package:i_billing/presentation/ui/contracts/widgets/filtered_list.dart';

import '../../bloc/filter_bloc/filter_bloc.dart';

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
    return Scaffold(
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
      body: Column(children: const [
        FilterHead(),
        Expanded(child: FilteredList())
      ],),
    );
  }
}
