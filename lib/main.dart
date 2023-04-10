import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_billing/presentation/bloc/calendar/calendar_bloc.dart';
import 'package:i_billing/presentation/bloc/calendar/calendar_bloc.dart';
import 'package:i_billing/presentation/bloc/filter_bloc/filter_bloc.dart';
import 'package:i_billing/presentation/bloc/main_bloc/main_bloc.dart';
import 'package:i_billing/presentation/bloc/navBar/nav_bar_bloc.dart';
import 'package:i_billing/presentation/bloc/new_contract_bloc/new_contract_bloc.dart';
import 'package:i_billing/presentation/bloc/new_contract_bloc/new_contract_bloc.dart';
import 'package:i_billing/presentation/bloc/new_invoice_bloc/new_invoice_bloc.dart';
import 'package:i_billing/presentation/bloc/new_invoice_bloc/new_invoice_bloc.dart';
import 'package:i_billing/presentation/ui/contracts/filter_screen.dart';
import 'package:i_billing/presentation/ui/contracts/single_item_screen.dart';
import 'package:i_billing/presentation/ui/main_container.dart';

import 'assets/colors.dart';
import 'di/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavBarBloc>(
          create: (context) => NavBarBloc(),
        ),
        BlocProvider<MainBloc>(create: (context) => MainBloc(di.get())),
        BlocProvider<FilterBloc>(create: (context) => FilterBloc(di.get())),
        BlocProvider<NewContractBloc>(create: (context) => NewContractBloc(di.get())),
        BlocProvider<NewInvoiceBloc>(create: (context) => NewInvoiceBloc(di.get())),
        BlocProvider<CalendarBloc>(create: (context) => CalendarBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true,
            appBarTheme: AppBarTheme(backgroundColor: darkest),
            scaffoldBackgroundColor: Colors.black,
            iconTheme: const IconThemeData(color: Colors.white),
            textTheme: Theme.of(context).textTheme.apply(
                  bodyColor: Colors.white,
                  displayColor: Colors.white,
                ),
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: Colors.white,
            ),
            inputDecorationTheme: const InputDecorationTheme(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                hintStyle: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 16))),
        routes: {
          '/filter': (context) => const FilterScreen(),
          '/single': (context) => const SingleItemScreen(),
          '/main': (context) => const MainContainer(),
        },
        home: const MainContainer(),
      ),
    );
  }
}
