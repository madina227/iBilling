import 'package:equatable/equatable.dart';
import 'package:i_billing/features/i_billing/presentation/main/bloc/navBar/nav_bar_event.dart';

class NavBarState extends Equatable {
  final NavbarItems navbarItems;
  final int index;

  const NavBarState(this.navbarItems, this.index);

  @override
  List<Object> get props => [navbarItems, index];
}
