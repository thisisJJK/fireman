import 'package:fireman/view_model/history_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final HistoryViewModel historyViewModel = Get.find<HistoryViewModel>();

    return Card(
      color: Theme.of(context).colorScheme.surface,
      child: ExpansionTile(
        expandedCrossAxisAlignment: CrossAxisAlignment.start,

        textColor: Theme.of(context).colorScheme.onSurface,
        shape: const Border(),

        //date
        leading: const Text(
          '2024.10.25 (금)',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        //count
        title: const Row(
          children: [
            Text(
              '🧯',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              '🔥',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        //list

        children: [
          Container(
            padding: const EdgeInsets.all(8),
            color: Theme.of(context).colorScheme.tertiaryContainer,
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '🧯',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                Expanded(
                  child: Text(
                    '칭찬해~',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //두가지 다 존재하면 생성

          //thanks
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              color: Theme.of(context).colorScheme.secondaryContainer,
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '🔥',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                Expanded(
                  child: Text(
                    '너무 화가 나너무 화가 나너무 화가 나너무 화가 나너무 화가 나너무 화가 나너무 화가 나너무 화가 나너무 화가 나너무 화가 나너무 화가 나너무 화가 나너무 화가 나너무 화가 나너무 화가 나너무 화가 나너무 화가 나너무 화가 나',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
