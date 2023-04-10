import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_billing/assets/Strings.dart';
import 'package:i_billing/presentation/bloc/filter_bloc/filer_event.dart';
import 'package:jiffy/jiffy.dart';
import '../../../../assets/colors.dart';
import '../../../bloc/filter_bloc/filter_bloc.dart';

class FilterHead extends StatefulWidget {
  const FilterHead({Key? key}) : super(key: key);

  @override
  State<FilterHead> createState() => _FilterHeadState();
}

class _FilterHeadState extends State<FilterHead> {
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

    if(pickedDate!=null){
      _filterBloc.add(ChooseStartDateEvent((pickedDate.millisecondsSinceEpoch/1000).ceil()));
    }
    setState(() {
      from = Jiffy.parseFromDateTime(pickedDate!).format(pattern: 'dd.MM.yyyy');
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
    if(pickedDate!=null){
      _filterBloc.add(ChooseEndDateEvent((pickedDate.millisecondsSinceEpoch/1000).ceil()));
    }
    setState(() {
      to = Jiffy.parseFromDateTime(pickedDate!).format(pattern: 'dd.MM.yyyy');
    });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            statusText,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: grey,
            ),
          ),
          Row(
            children: const [
              CheckStatus(
                status: paidText,
              ),
              Spacer(),
              CheckStatus(
                status: rejectedByIqText,
              ),
            ],
          ),
          Row(
            children: const [
              CheckStatus(
                status: inProcesstext,
              ),
              Spacer(),
              CheckStatus(
                status: rejectedByPaymeText,
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
            dateText,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: grey,
            ),
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
          )
        ],
      ),
    );
  }
}

class CheckStatus extends StatefulWidget {
  final String status;

  const CheckStatus({
    Key? key,
    required this.status,
  }) : super(key: key);

  @override
  State<CheckStatus> createState() => _CheckStatusState();
}

class _CheckStatusState extends State<CheckStatus> {
  late FilterBloc _filterBloc;

  @override
  void initState() {
    _filterBloc = BlocProvider.of<FilterBloc>(context);
    super.initState();
  }

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2 - 16,
      child: Row(
        children: [
          Checkbox(
              visualDensity: const VisualDensity(horizontal: -4),
              //default paddingi yoqotish uchun
              checkColor: Colors.black,
              fillColor: isChecked
                  ? MaterialStateProperty.all(Colors.white)
                  : MaterialStateProperty.all(grey),
              value: isChecked,
              onChanged: (bool? value) {
                if (value!) {
                  _filterBloc.add(StatusCheckEvent(widget.status));
                  print(widget.status);
                } else {
                  _filterBloc.add(StatusUncheckEvent(widget.status));
                }
                setState(() {
                  isChecked = value;
                });
              },
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)))),
          Text(
            widget.status,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isChecked ? Colors.white : grey),
          )
        ],
      ),
    );
  }
}
