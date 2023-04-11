abstract class FilterEvent {}

// class Statuses {
//   final String name;
//   final bool isChecked;
//
//   Statuses(this.name, this.isChecked);
// }

class StatusCheckEvent extends FilterEvent {
  String checkedStatus;

  StatusCheckEvent(this.checkedStatus);
}

class StatusUncheckEvent extends FilterEvent {
  String uncheckedStatus;

  StatusUncheckEvent(this.uncheckedStatus);
}

class ChooseStartDateEvent extends FilterEvent {
  int startDate;

  ChooseStartDateEvent(this.startDate);
}

class ChooseEndDateEvent extends FilterEvent {
  int endDate;

  ChooseEndDateEvent(this.endDate);
}

// class FilterRequestEvent extends FilterEvent {
//   List<String> checkedStatuses;
//   int startDate;
//   int endDate;
//
//   FilterRequestEvent(
//     this.checkedStatuses,
//     this.startDate,
//     this.endDate,
//   );
// }
