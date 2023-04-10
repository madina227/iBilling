import 'calendar_state.dart';

abstract class CalendarEvent {}

class CalendarInitialEvent extends CalendarEvent {}

class CalendarNextEvent extends CalendarEvent {}

class CalendarPreviousEvent extends CalendarEvent {}

class ChooseDateEvent extends CalendarEvent {
  final DateTime date;

  ChooseDateEvent(this.date);
}
