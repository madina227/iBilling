// abstract class NavBarState {}
//
// class ShowContracts extends NavBarState {
//   final String title = "Contracts";
//   final int itemIndex = 0;
// }
//
// class ShowHistory extends NavBarState {
//   final String title = "History";
//   final int itemIndex = 1;
// }
//
// class ShowNew extends NavBarState {
//   final String title = "New Contract";
//   final int itemIndex = 2;
// }
//
// class ShowSaved extends NavBarState {
//   final String title = "Saved";
//   final int itemIndex = 3;
// }
//
// class ShowProfile extends NavBarState {
//   final String title = "Profile";
//   final int itemIndex = 4;
// }

import 'package:equatable/equatable.dart';
import 'package:i_billing/presentation/bloc/navBar/nav_bar_event.dart';

class NavBarState extends Equatable {
  final NavbarItems navbarItems;
  final int index;

  const NavBarState(this.navbarItems, this.index);

  @override
  List<Object> get props => [navbarItems, index];
}
