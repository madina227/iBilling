import 'package:bloc/bloc.dart';
import 'package:i_billing/features/i_billing/presentation/main/bloc/navBar/nav_bar_event.dart';
import 'package:i_billing/features/i_billing/presentation/main/bloc/navBar/nav_bar_state.dart';

class NavBarBloc extends Bloc<NavbarItems, NavBarState> {
  NavBarBloc() : super(const NavBarState(NavbarItems.contracts, 0));

  void getNavBarItem(NavbarItems navbarItems) {
    switch (navbarItems) {
      case NavbarItems.contracts:
        emit(const NavBarState(NavbarItems.contracts, 0));
        break;
      case NavbarItems.history:
        emit(const NavBarState(NavbarItems.history, 1));
        break;
      case NavbarItems.neW:
        emit(const NavBarState(NavbarItems.neW, 2));
        break;
      case NavbarItems.saved:
        emit(const NavBarState(NavbarItems.saved, 3));
        break;
      case NavbarItems.profile:
        emit(const NavBarState(NavbarItems.profile, 4));
        break;
    }
  }
}
