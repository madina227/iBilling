import 'package:flutter/material.dart';
import 'package:i_billing/data/source/remote/model/user_contract.dart';
import 'package:jiffy/jiffy.dart';
import '../../../../assets/Strings.dart';
import '../../../../assets/colors.dart';
import '../../../../assets/icons.dart';
import '../../utils/text_row.dart';

class ContractItem extends StatefulWidget {
  final UserContractData contractData;

  const ContractItem({Key? key, required this.contractData}) : super(key: key);

  @override
  State<ContractItem> createState() => _ContractItemState();
}

class _ContractItemState extends State<ContractItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/single', arguments: widget.contractData);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration:
            BoxDecoration(color: dark, borderRadius: BorderRadius.circular(6)),
        child: Column(
          children: [
            Row(
              children: [
                contractIcon,
                Text(
                  "№ ${widget.contractData.id}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                      color: alfaLightGreen,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "${widget.contractData.status}",
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
              rightText: "${widget.contractData.fullName}",
            ),
            TextRow(
              leftText: amountText,
              rightText: "${widget.contractData.amount} $uzsText",
            ),
            const SizedBox(
              height: 4,
            ),
            TextRow(
              leftText: lastInvoiceText,
              rightText: "№ ${widget.contractData.lastInvoice}",
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                TextRow(
                  leftText: numberOfInvoicesText,
                  rightText: "${widget.contractData.numberOfInvoice}",
                ),
                const Spacer(),
                Text(
                  Jiffy.parseFromDateTime(DateTime.fromMillisecondsSinceEpoch(
                          widget.contractData.createdData! * 1000))
                      .format(pattern: 'dd.MM.yyyy hh:mm'),
                  style: TextStyle(
                      color: grey, fontSize: 14, fontWeight: FontWeight.w700),
                )
              ],
            ),
            const SizedBox(
              height: 4,
            ),
          ],
        ),
      ),
    );
  }
}
