import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_billing/data/source/remote/model/user_contract.dart';
import 'package:i_billing/presentation/bloc/main_bloc/main_event.dart';
import 'package:i_billing/presentation/ui/contracts/widgets/contract_list.dart';
import 'package:i_billing/presentation/ui/contracts/widgets/dialog_delete.dart';
import 'package:jiffy/jiffy.dart';

import '../../../assets/Strings.dart';
import '../../../assets/colors.dart';
import '../../../assets/icons.dart';
import '../../bloc/main_bloc/main_bloc.dart';
import '../utils/text_row.dart';

class SingleItemScreen extends StatefulWidget {
  const SingleItemScreen({Key? key}) : super(key: key);

  @override
  State<SingleItemScreen> createState() => _SingleItemScreenState();
}

class _SingleItemScreenState extends State<SingleItemScreen> {
  late bool isSaved;
  late MainBloc _bloc;
  String index = '1';

  @override
  void initState() {
    _bloc = BlocProvider.of<MainBloc>(context);
    isSaved = false;
    super.initState();
  }

  _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return DeleteDialog(
            index: index,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context)!.settings;
    var contractData = settings.arguments as UserContractData;
    index = contractData.id!;
    _bloc.add(SearchByQueryEvent(query: contractData.fullName));
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(
            top: 16,
            bottom: 16,
          ),
          child: Row(
            children: [
              contractIcon,
              const SizedBox(
                width: 12,
              ),
              Text(
                "№ ${contractData.id}",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isSaved = !isSaved;
                });
              },
              icon: isSaved ? bookmarkBoldIcon : bookmarkOutlIcon)
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: dark, borderRadius: BorderRadius.circular(6)),
              child: Column(
                children: [
                  TextRow(
                    leftText: fullNameText,
                    rightText: "${contractData.fullName}",
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextRow(
                    leftText: statusOfTheContractText,
                    rightText: "${contractData.status}",
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextRow(
                    leftText: amountText,
                    rightText: "${contractData.amount} $uzsText",
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextRow(
                    leftText: lastInvoiceText,
                    rightText: "№ ${contractData.lastInvoice}",
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextRow(
                    leftText: numberOfInvoicesText,
                    rightText: "${contractData.numberOfInvoice}",
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextRow(
                    leftText: adressOrganizationText,
                    rightText: "${contractData.adress}",
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextRow(
                    leftText: itnOrganizationText,
                    rightText: "${contractData.itn}",
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextRow(
                    leftText: createdAtText,
                    rightText: Jiffy.parseFromDateTime(
                            DateTime.fromMillisecondsSinceEpoch(
                                contractData.createdData! * 1000))
                        .format(pattern: 'hh:mm dd MMMM, yyyy'),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2 - 24,
                  child: ElevatedButton(
                    onPressed: () {
                      // _bloc.add(DeleteContractEvent(index: contractData.id!));
                      SchedulerBinding.instance
                          .addPostFrameCallback((_) => _showDialog());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: alfaRed,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                    ),
                    child: Text(
                      'Delete contract',
                      style: TextStyle(
                          color: red,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2 - 24,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: darkGreen,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                    ),
                    child: const Text(
                      'Back',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ), //
            const SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '$otherContractsWithText \n${contractData.fullName}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Expanded(child: ContractList())
          ],
        ),
      ),
    );
  }
}
