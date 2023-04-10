import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_billing/assets/Strings.dart';
import 'package:i_billing/presentation/bloc/main_bloc/main_event.dart';

import '../../../../assets/colors.dart';
import '../../../bloc/main_bloc/main_bloc.dart';

class DeleteDialog extends StatefulWidget {
  final String index;

  const DeleteDialog({Key? key, required this.index}) : super(key: key);

  @override
  State<DeleteDialog> createState() => _DeleteDialogState();
}

class _DeleteDialogState extends State<DeleteDialog> {
  final myController = TextEditingController();
  late MainBloc _bloc;

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    print('aaaaaaaaaaaaaaaaaaaa: ${myController.text}');
    // if state event length dan kotta bosa add bloc
  }

  @override
  void initState() {
    _bloc = BlocProvider.of<MainBloc>(context);
    super.initState();
    myController.addListener(_printLatestValue);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: dark,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        height: 240,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              whyDeleteText,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 6),
                child: SizedBox(
                  // height: 56,
                  child: TextFormField(
                    controller: myController, //////////////////
                    // onChanged: ,
                    minLines: 1,
                    maxLines: null, // Set this
                    // expands: true, // and this
                    // keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      // isDense: false,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      hintText: typeCommentText,
                      hintStyle: TextStyle(
                        color: grey2,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.clip,
                      ),
                      fillColor: grey,
                      filled: true,
                    ),
                  ),
                )

                // DialogOption(
                //   icon: contractIcon,
                //   text: contractText,
                //   onTap: () {
                //     Navigator.pushReplacement(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => const NewContractScreen()));
                //   },
                // ),
                ),
            // _name.length>3?
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: alfaRed,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                    ),
                    child: Text(
                      cancelText,
                      style: TextStyle(
                          color: red,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: ElevatedButton(
                    onPressed: () {
                      _bloc.add(DeleteContractEvent(index: widget.index));
                      Navigator.popUntil(context,  ModalRoute.withName(Navigator.defaultRouteName));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: red,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                    ),
                    child: const Text(
                      doneText,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
