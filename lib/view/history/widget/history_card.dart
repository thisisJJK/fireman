import 'package:fireman/model/record_model.dart';
import 'package:fireman/view_model/history_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryCard extends StatelessWidget {
  final String date;

  const HistoryCard({
    super.key,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final HistoryViewModel historyViewModel = Get.find<HistoryViewModel>();
    final recordList = historyViewModel.recordsByDate[date]!;
    Map<String, int> typeCounts =
        historyViewModel.typeCountsByDate[date] ?? {'화남': 0, '감사': 0};
    double fontsize = 18;
    return Card(
      color: Theme.of(context).colorScheme.surface,
      child: ExpansionTile(
        expandedCrossAxisAlignment: CrossAxisAlignment.start,

        textColor: Theme.of(context).colorScheme.onSurface,
        shape: const Border(),

        //date
        leading: Text(
          date,
          style: TextStyle(
            fontSize: fontsize,
          ),
        ),
        //count
        title: Row(
          children: [
            Text(
              '${typeCounts[Mode.thanks.name]}🧯',
              style: TextStyle(
                fontSize: fontsize,
              ),
            ),
            Text(
              '${typeCounts[Mode.firewood.name]}🔥',
              style: TextStyle(
                fontSize: fontsize,
              ),
            ),
          ],
        ),

        //list
        children: recordList.map((record) {
          bool isThanks = record.type == Mode.thanks.name;
          bool isLast = recordList.last.id == record.id;
          print('${recordList.last.id}');
          print(record.id);

          return Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: isLast
                  ? const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    )
                  : BorderRadius.zero,
              color: isThanks
                  ? Theme.of(context).colorScheme.tertiaryContainer
                  : Theme.of(context).colorScheme.secondaryContainer,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(isThanks ? '🧯' : '🔥',
                    style: TextStyle(
                      fontSize: fontsize,
                    )),
                Expanded(
                  child: Text(
                    record.content,
                    style: TextStyle(
                      fontSize: fontsize,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),

        // children: [
        //   Container(
        //     padding: const EdgeInsets.all(8),
        //     color: Theme.of(context).colorScheme.tertiaryContainer,
        //     child:

        //     const Row(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Text(
        //           '🧯',
        //           style: TextStyle(
        //             color: Colors.black,
        //             fontSize: 18,
        //           ),
        //         ),
        //         Expanded(
        //           child: Text(
        //             '칭찬해~',
        //             style: TextStyle(
        //               color: Colors.black,
        //               fontSize: 18,
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        //   //두가지 다 존재하면 생성

        //   //thanks
        //   Container(
        //     padding: const EdgeInsets.all(8),
        //     decoration: BoxDecoration(
        //       //마지막 인덱스+ 화남모드 => 맨밑보더처리
        //       borderRadius: const BorderRadius.only(
        //           bottomLeft: Radius.circular(10),
        //           bottomRight: Radius.circular(10)),
        //       color: Theme.of(context).colorScheme.secondaryContainer,
        //     ),
        //     child: const Row(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Text(
        //           '🔥',
        //           style: TextStyle(
        //             color: Colors.black,
        //             fontSize: 18,
        //           ),
        //         ),
        //         Expanded(
        //           child: Text(
        //             '너무 화가 나너무 화가 나너무 화가 나너무 화가 나너무 화가 나너무 화가 나너무 화가 나너무 화가 나너무 화가 나너무 화가 나너무 화가 나너무 화가 나너무 화가 나너무 화가 나너무 화가 나너무 화가 나너무 화가 나너무 화가 나',
        //             style: TextStyle(
        //               color: Colors.black,
        //               fontSize: 18,
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ],
      ),
    );
  }
}
