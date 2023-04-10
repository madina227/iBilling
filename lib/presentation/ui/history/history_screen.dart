import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';
import '../../../assets/Strings.dart';
import '../../../assets/colors.dart';
import '../../bloc/filter_bloc/filer_event.dart';
import '../../bloc/filter_bloc/filter_bloc.dart';
import '../contracts/widgets/filtered_list.dart';
import '../utils/circle_gradient.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late FilterBloc _filterBloc;

  @override
  void initState() {
    _filterBloc = BlocProvider.of<FilterBloc>(context);
    super.initState();
  }

  DateTime currentDate = DateTime.now();
  String from = fromText;
  String to = toText;

  //dry ga moslashtrish kere
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: dark,
                onPrimary: Colors.white,
                onSurface: darkest,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: darker, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
        firstDate: DateTime(2022),
        lastDate: DateTime(2024));

    // if (pickedDate != null && pickedDate != currentDate) {
    if (pickedDate != null) {
      _filterBloc.add(ChooseStartDateEvent(
          (pickedDate.millisecondsSinceEpoch / 1000).ceil()));
    }
    setState(() {
      // currentDate = pickedDate;
      from = Jiffy.parseFromDateTime(pickedDate!).format(pattern: 'dd.MM.yyyy');
      // _bloc.add(FilterContractsEvent(statuses: statuses, startTime: startTime, endTime: endTime))
    });
    // }
  }

  Future<void> _selectDate2(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: dark,
                onPrimary: Colors.white,
                onSurface: darkest,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: darker, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
        firstDate: DateTime(2022),
        lastDate: DateTime(2024));

    if (pickedDate != null) {
      _filterBloc.add(ChooseEndDateEvent(
          (pickedDate.millisecondsSinceEpoch / 1000).ceil()));
    }
    setState(() {
      // currentDate = pickedDate;
      to = Jiffy.parseFromDateTime(pickedDate!).format(pattern: 'dd.MM.yyyy');
    });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkest,
        leading: const Padding(
          padding: EdgeInsets.only(
            left: 20.0,
            top: 14,
            bottom: 13,
          ),
          child: CircleGradient(),
        ),
        title: const Text(
          historyText,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, right: 16, left: 16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                dateText,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: grey,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Container(
                  constraints: const BoxConstraints(
                    minWidth: 140,
                  ),
                  padding: const EdgeInsets.only(left: 12),
                  decoration: BoxDecoration(
                      color: dark, borderRadius: BorderRadius.circular(6)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        from,
                        style: TextStyle(
                            color: grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      IconButton(
                        onPressed: () {
                          _selectDate(context);
                          setState(() {
                            from = Jiffy.parseFromDateTime(currentDate)
                                .format(pattern: 'dd.MM.yyyy');
                          });
                        },
                        icon: const Icon(Icons.calendar_month_outlined),
                        color: grey,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Container(
                  constraints: const BoxConstraints(
                    minWidth: 140,
                  ),
                  padding: const EdgeInsets.only(left: 12),
                  decoration: BoxDecoration(
                      color: dark, borderRadius: BorderRadius.circular(6)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        to,
                        style: TextStyle(
                            color: grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _selectDate2(context);
                            to = Jiffy.parseFromDateTime(currentDate)
                                .format(pattern: 'dd.MM.yyyy');
                          });
                        },
                        icon: const Icon(Icons.calendar_month_outlined),
                        color: grey,
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Expanded(child: FilteredList())
          ],
        ),
      ),
    );
  }
}
