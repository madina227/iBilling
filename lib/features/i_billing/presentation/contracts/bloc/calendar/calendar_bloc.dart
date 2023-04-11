import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';

import './calendar_event.dart';
import './calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  var currentDate = Jiffy.now().date;
  var currentYear = Jiffy.now().year;
  var currentMonth = Jiffy.now().month;

  var firstWeekDay = Jiffy.now().startOf(Unit.week).date; //dushanba sanasi
  List<Date> dateOfWeek = [];

  CalendarBloc() : super(CalendarState(currentDate: Jiffy.now().dateTime)) {
    var daysInMonth =
        Jiffy.parseFromDateTime(DateTime.utc(currentYear, currentMonth))
            .daysInMonth;

    on<CalendarInitialEvent>((event, emit) {
      firstWeekDay = Jiffy.now().startOf(Unit.week).date; //dushanba sanasi
      dateOfWeek.clear();
      for (int i = firstWeekDay; i < firstWeekDay + 7; i++) {
        dateOfWeek.add(Date(i,
            Jiffy.parseFromDateTime(DateTime(currentYear, currentMonth, i)).E));
      }

      emit(state.copyWith(
          status: Status.success,
          month: Jiffy.now().month,
          year: Jiffy.now().year,
          week: dateOfWeek,
          currentDate: Jiffy.now().dateTime));
    });

    on<CalendarNextEvent>((event, emit) {
      firstWeekDay = firstWeekDay + 7; //dushanba sanasi
      var endOfWeek = firstWeekDay + 7;
      var days = 0;
      dateOfWeek.clear();
      if (endOfWeek > daysInMonth) {
        if (currentMonth == 12) {
          currentYear = currentYear + 1;
          currentMonth = 0;
        }
        currentMonth = currentMonth + 1;
        print("current month $currentMonth");
        print("days month $daysInMonth");

        days = endOfWeek - daysInMonth;
        for (int i = firstWeekDay; i < daysInMonth + 1; i++) {
          dateOfWeek.add(Date(
              i,
              Jiffy.parseFromDateTime(
                      DateTime(currentYear, currentMonth - 1, i))
                  .E));
        }
        for (int i = 1; i < days; i++) {
          dateOfWeek.add(Date(
              i,
              Jiffy.parseFromDateTime(DateTime(currentYear, currentMonth, i))
                  .E));
        }
        endOfWeek = days;
        firstWeekDay = days - 7;
        daysInMonth =
            Jiffy.parseFromDateTime(DateTime.utc(currentYear, currentMonth))
                .daysInMonth;
        print("days month $daysInMonth");
      } else {
        for (int i = firstWeekDay; i < endOfWeek; i++) {
          dateOfWeek.add(Date(
              i,
              Jiffy.parseFromDateTime(DateTime(currentYear, currentMonth, i))
                  .E));
        }
      }
      emit(state.copyWith(
        status: Status.success,
        week: dateOfWeek,
        month: currentMonth,
        year: currentYear,
      ));
    });

    on<CalendarPreviousEvent>((event, emit) {
      firstWeekDay = firstWeekDay - 7; //dushanba sanasi
      var day = 0;
      dateOfWeek.clear();
      var endOfWeek = firstWeekDay + 7;
      if (firstWeekDay < 0) {
        if (currentMonth == 1) {
          currentYear = currentYear - 1;
          currentMonth = 13;
        }
        day = (0 - firstWeekDay);
        currentMonth = currentMonth - 1;
        daysInMonth =
            Jiffy.parseFromDateTime(DateTime.utc(currentYear, currentMonth))
                .daysInMonth;
        for (int i = daysInMonth - day; i < daysInMonth + 1; i++) {
          dateOfWeek.add(Date(
              i,
              Jiffy.parseFromDateTime(DateTime(currentYear, currentMonth, i))
                  .E));
        }
        for (int i = 1; i < 7 - day; i++) {
          dateOfWeek.add(Date(
              i,
              Jiffy.parseFromDateTime(
                      DateTime(currentYear, currentMonth + 1, i))
                  .E));
        }
        firstWeekDay = daysInMonth - day;
      } else {
        for (int i = firstWeekDay; i < endOfWeek; i++) {
          dateOfWeek.add(Date(
              i,
              Jiffy.parseFromDateTime(DateTime(currentYear, currentMonth, i))
                  .E));
        }
      }

      // print(dateOfWeek[0].day);

      emit(state.copyWith(
        status: Status.success,
        week: dateOfWeek,
        month: currentMonth,
        year: currentYear,
      ));
    });

    on<ChooseDateEvent>((event, emit) {
      emit(state.copyWith(status: Status.success, currentDate: event.date));
    });
  }
}
