import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_billing/assets/Strings.dart';
import 'package:i_billing/assets/colors.dart';
import 'package:i_billing/core/util/circle_gradient.dart';
import 'package:i_billing/features/i_billing/presentation/main/bloc/main_bloc/main_bloc.dart';
import 'package:i_billing/features/i_billing/presentation/main/bloc/main_bloc/main_event.dart';
import 'package:i_billing/features/i_billing/presentation/saved/widgets/saved_list.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  late MainBloc _bloc;
  
  @override
  void initState() {
    _bloc = BlocProvider.of<MainBloc>(context)..add(SavedContractsEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: darkest,
        leading: const Padding(
          padding: EdgeInsets.only(
            left: 20.0,
            top: 14,
            bottom: 13,
          ),
          child: CircleGradient(),
        ),
        title: const Text(savedText, style: TextStyle(color: Colors.white),),
      ),
      body: const Padding(
        padding: EdgeInsets.only(top: 20, left: 16, right: 16.0),
        child: SavedList(),
      ),
    );
  }
}
