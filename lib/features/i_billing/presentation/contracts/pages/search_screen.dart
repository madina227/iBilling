import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_billing/assets/Strings.dart';
import 'package:i_billing/assets/colors.dart';
import 'package:i_billing/assets/icons.dart';
import 'package:i_billing/core/util/text_row.dart';
import 'package:i_billing/features/i_billing/presentation/contracts/widgets/place_holder.dart';
import 'package:i_billing/features/i_billing/presentation/main/bloc/main_bloc/main_bloc.dart';
import 'package:i_billing/features/i_billing/presentation/main/bloc/main_bloc/main_event.dart';
import 'package:i_billing/features/i_billing/presentation/main/bloc/main_bloc/main_state.dart';
import 'package:jiffy/jiffy.dart';

class SearchScreen extends SearchDelegate<List> {
  MainBloc bloc;

  SearchScreen({required this.bloc});

  late String queryString;

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      scaffoldBackgroundColor: darkest,
    );
  }

  @override
  String get searchFieldLabel => searchByKeywordsText;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.close),
        color: Colors.white,
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back_outlined,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    queryString = query;
    bloc.add(SearchByQueryEvent(query: query));
    return BlocBuilder<MainBloc, MainState>(
        builder: (BuildContext context, MainState state) {
      if (state is ContractLoadingState) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is ContractErrorState) {
        return Center(
          child: Text(
            somethingWentWrongText,
            style: TextStyle(fontSize: 20.0, color: lightGreen),
          ),
        );
      }
      if (state is ContractEmptyState) {
        return const EmptyPlaceHolder();
      }
      if (state is ContractsLoadedState) {
        return ListView.separated(
          scrollDirection: Axis.vertical,
          physics: const ClampingScrollPhysics(),
          itemCount: state.userContracts.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: dark, borderRadius: BorderRadius.circular(6)),
              child: Column(
                children: [
                  Row(
                    children: [
                      contractIcon,
                      Text(
                        "№ ${state.userContracts[index].id}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                            color: alfaLightGreen,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "${state.userContracts[index].status}",
                          style: TextStyle(
                              color: lightGreen,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextRow(
                    leftText: fishText,
                    rightText: "${state.userContracts[index].fullName}",
                  ),
                  TextRow(
                    leftText: amountText,
                    rightText: "${state.userContracts[index].amount} $uzsText",
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  TextRow(
                    leftText: lastInvoiceText,
                    rightText: "№ ${state.userContracts[index].lastInvoice}",
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      TextRow(
                        leftText: numberOfInvoicesText,
                        rightText:
                            "${state.userContracts[index].numberOfInvoice}",
                      ),
                      const Spacer(),
                      Text(
                        Jiffy.parseFromDateTime(
                                DateTime.fromMillisecondsSinceEpoch(
                                    state.userContracts[index].createdData! *
                                        1000))
                            .format(pattern: 'dd.MM.yyyy hh:mm'),
                        style: TextStyle(
                            color: grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 12,
            );
          },
        );
      }
      return const SizedBox.shrink();
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(child: EmptyPlaceHolder());
  }
}
