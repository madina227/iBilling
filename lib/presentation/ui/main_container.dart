import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_billing/assets/Strings.dart';
import 'package:i_billing/assets/colors.dart';
import 'package:i_billing/assets/icons.dart';
import 'package:i_billing/presentation/bloc/navBar/nav_bar_bloc.dart';
import 'package:i_billing/presentation/bloc/navBar/nav_bar_event.dart';
import 'package:i_billing/presentation/bloc/navBar/nav_bar_state.dart';
import 'package:i_billing/presentation/ui/contracts/contracts_screen.dart';
import 'package:i_billing/presentation/ui/history/history_screen.dart';
import 'package:i_billing/presentation/ui/new/new_screen.dart';
import 'package:i_billing/presentation/ui/profile/profile_screen.dart';
import 'package:i_billing/presentation/ui/saved/saved_screen.dart';

class MainContainer extends StatefulWidget {
  const MainContainer({Key? key}) : super(key: key);

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(systemNavigationBarColor: darkest,));
    return Scaffold(
        bottomNavigationBar: BlocBuilder<NavBarBloc, NavBarState>(
          builder: (context, state) {
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: state.index,
              showUnselectedLabels: true,
              backgroundColor: darkest,
              selectedItemColor: selectedColor,
              unselectedItemColor: unselectedColor,
              items: [
                BottomNavigationBarItem(
                  icon: state.navbarItems == NavbarItems.contracts
                      ? contractsBoldIcon
                      : contractsOutlIcon,
                  label: contractsText,
                ),
                BottomNavigationBarItem(
                  icon: state.navbarItems == NavbarItems.history
                      ? historyBoldIcon
                      : historyOutlIcon,
                  label: historyText,
                ),
                BottomNavigationBarItem(
                  icon: state.navbarItems == NavbarItems.neW
                      ? newBoldIcon
                      : newOutlIcon,
                  label: newText,
                ),
                BottomNavigationBarItem(
                  icon: state.navbarItems == NavbarItems.saved
                      ? bookmarkBoldIcon
                      : bookmarkOutlIcon,
                  label: savedText,
                ),
                BottomNavigationBarItem(
                  icon: state.navbarItems == NavbarItems.profile
                      ? profileBoldIcon
                      : profileOutlIcon,
                  label: profileText,
                ),
              ],
              onTap: (index) {
                switch (index) {
                  case 0:
                    {
                      BlocProvider.of<NavBarBloc>(context)
                          .getNavBarItem(NavbarItems.contracts);
                    }
                    break;
                  case 1:
                    {
                      BlocProvider.of<NavBarBloc>(context)
                          .getNavBarItem(NavbarItems.history);
                    }
                    break;
                  case 2:
                    {
                      BlocProvider.of<NavBarBloc>(context)
                          .getNavBarItem(NavbarItems.neW);
                    }
                    break;
                  case 3:
                    {
                      BlocProvider.of<NavBarBloc>(context)
                          .getNavBarItem(NavbarItems.saved);
                    }
                    break;
                  case 4:
                    {
                      BlocProvider.of<NavBarBloc>(context)
                          .getNavBarItem(NavbarItems.profile);
                    }
                    break;
                }
              },
            );
          },
        ),
        body: BlocBuilder<NavBarBloc, NavBarState>(
          builder: (context, state) {
            if (state.navbarItems == NavbarItems.contracts) {
              return const ContractsScreen();
            } else if (state.navbarItems == NavbarItems.history) {
              return const HistoryScreen();
            } else if (state.navbarItems == NavbarItems.neW) {
              return const NewScreen();
            } else if (state.navbarItems == NavbarItems.saved) {
              return const SavedScreen();
            } else if (state.navbarItems == NavbarItems.profile) {
              return const ProfileScreen();
            }
            return Container();
          },
        ));
  }
}
