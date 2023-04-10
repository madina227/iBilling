import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_billing/assets/Strings.dart';
import 'package:i_billing/assets/icons.dart';
import 'package:i_billing/data/source/remote/model/user_contract.dart';
import 'package:i_billing/presentation/bloc/calendar/calendar_event.dart';
import 'package:i_billing/presentation/bloc/main_bloc/main_bloc.dart';
import 'package:i_billing/presentation/bloc/main_bloc/main_event.dart';
import 'package:i_billing/presentation/ui/contracts/search_screen.dart';
import 'package:i_billing/presentation/ui/contracts/widgets/calendar2.dart';
import 'package:i_billing/presentation/ui/contracts/widgets/contract_list.dart';
import 'package:i_billing/presentation/ui/utils/circle_gradient.dart';
import 'package:jiffy/jiffy.dart';

import '../../bloc/calendar/calendar_bloc.dart';

class ContractsScreen extends StatefulWidget {
  const ContractsScreen({Key? key}) : super(key: key);

  @override
  State<ContractsScreen> createState() => _ContractsScreenState();
}

class _ContractsScreenState extends State<ContractsScreen> {
  late MainBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<MainBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(
            left: 20.0,
            top: 14,
            bottom: 13,
          ),
          child: CircleGradient(),
        ),
        title: const Text(
          contractsText,
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/filter');
              },
              icon: filterIcon),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: VerticalDivider(
              thickness: 2,
              color: Colors.white,
            ),
          ),
          IconButton(
              onPressed: () {
                showSearch(
                    context: context, delegate: SearchScreen(bloc: bloc));
              },
              icon: searchIcon),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children:  const [
          MyCalendar(),
          // Text((Jiffy.now().dateTime.day -Jiffy.now().dayOfWeek+2).toString()),testga
          // ContractOrInvoice(),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: ContractList(),
            ),
          )
        ],
      ),
    );
  }
}
