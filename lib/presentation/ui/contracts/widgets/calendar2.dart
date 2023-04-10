import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_billing/assets/colors.dart';
import 'package:i_billing/presentation/bloc/calendar/calendar_bloc.dart';
import 'package:i_billing/presentation/bloc/calendar/calendar_event.dart';
import 'package:i_billing/presentation/bloc/calendar/calendar_state.dart';
import 'package:i_billing/presentation/bloc/main_bloc/main_event.dart';
import 'package:jiffy/jiffy.dart';
import '../../../bloc/main_bloc/main_bloc.dart';

class MyCalendar extends StatefulWidget {
  const MyCalendar({Key? key}) : super(key: key);

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  bool isContractSelected = false;
  bool isInvoiceSelected = false;
  int selectedIndex = Jiffy.now().date - 1;
  final daysInMonth = DateUtils.getDaysInMonth(
      Jiffy.now().year, Jiffy.now().month); //qaysi oyda nechi kunligi =30

  late MainBloc _bloc;
  late CalendarBloc _cBloc;
  late int startTime;
  late int endTime;

  @override
  void initState() {
    _cBloc = BlocProvider.of<CalendarBloc>(context)
      ..add(CalendarInitialEvent());
    _bloc = BlocProvider.of<MainBloc>(context)..add(ContractsEmptyEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalendarState>(builder: (context, state) {
      return Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: darker,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "${Jiffy.parseFromDateTime(DateTime(state.year, state.month)).MMMM} , ${state.year}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        _cBloc.add(CalendarPreviousEvent());
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    IconButton(
                      onPressed: () {
                        _cBloc.add(CalendarNextEvent());
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 28,
                ),
                SingleChildScrollView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ////////////////////////////////////////////////////////////
                      children: List.generate(state.week.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            _cBloc.add(ChooseDateEvent(DateTime.utc(state.year,
                                state.month, state.week[index].day)));

                            startTime =
                                ((DateTime.utc(state.year,
                                    state.month, state.week[index].day)).millisecondsSinceEpoch /
                                        1000)
                                    .ceil();
                            print("startTime $startTime");
                            // setState(() {
                            //   startTime = state.currentDate.millisecondsSinceEpoch /1000)
                            //       .ceil();
                            // });
                            endTime = startTime + 86400;
                            _bloc.add(FiltrContractsWithDateEvent(
                                startTime, endTime,
                                isContractPressed: isContractSelected,
                                isInvoicePressed: isInvoiceSelected));
                          },
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 14),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: state.currentDate.day ==
                                        state.week[index].day
                                    ? lightGreen
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    state.week[index].weekDay,
                                    style: TextStyle(
                                        color: state.currentDate.day ==
                                                state.week[index].day
                                            ? Colors.white
                                            : Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    "${state.week[index].day}",
                                    style: TextStyle(
                                        color: state.currentDate.day ==
                                                state.week[index].day
                                            ? Colors.white
                                            : Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Container(
                                      height: 2.0,
                                      width: 16.0,
                                      color: state.currentDate.day ==
                                              state.week[index].day
                                          ? Colors.white
                                          : Colors.grey),
                                ],
                              )),
                        );
                      })),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isContractSelected = !isContractSelected;
                      isInvoiceSelected = false;
                    });
                    if (isContractSelected || isInvoiceSelected) {
                      _bloc.add(FiltrContractsWithDateEvent(startTime, endTime,
                          isContractPressed: isContractSelected,
                          isInvoicePressed: isInvoiceSelected));
                    } else {
                      _bloc.add(ContractsEmptyEvent());
                    }
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color:
                          isContractSelected ? lightGreen : Colors.transparent,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Text(
                      "Contracts",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isInvoiceSelected = !isInvoiceSelected;
                      isContractSelected = false;
                    });
                    if (isContractSelected || isInvoiceSelected) {
                      _bloc.add(FiltrContractsWithDateEvent(startTime, endTime,
                          isContractPressed: isContractSelected,
                          isInvoicePressed: isInvoiceSelected));
                    } else {
                      _bloc.add(ContractsEmptyEvent());
                    }
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color:
                          isInvoiceSelected ? lightGreen : Colors.transparent,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Text(
                      "Invoice",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      );
    });
  }
}


