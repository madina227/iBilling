import 'package:bloc/bloc.dart';
import 'package:i_billing/presentation/bloc/navBar/nav_bar_event.dart';
import 'package:i_billing/presentation/bloc/navBar/nav_bar_state.dart';

class NavBarBloc extends Bloc<NavbarItems, NavBarState> {
  NavBarBloc() : super(NavBarState(NavbarItems.contracts, 0));

  void getNavBarItem(NavbarItems navbarItems) {
    switch (navbarItems) {
      case NavbarItems.contracts:
        emit(NavBarState(NavbarItems.contracts, 0));
        break;
      case NavbarItems.history:
        emit(NavBarState(NavbarItems.history, 1));
        break;
      case NavbarItems.neW:
        emit(NavBarState(NavbarItems.neW, 2));
        break;
      case NavbarItems.saved:
        emit(NavBarState(NavbarItems.saved, 3));
        break;
      case NavbarItems.profile:
        emit(NavBarState(NavbarItems.profile, 4));
        break;
    }
  }
}
