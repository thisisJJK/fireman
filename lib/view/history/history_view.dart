import 'package:fireman/view/history/widget/history_card.dart';
import 'package:fireman/view/main/mode_view.dart';
import 'package:fireman/view_model/history_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final HistoryViewModel historyViewModel = Get.put(HistoryViewModel());
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: const Alignment(-1, 0),
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        FeatherIcons.chevronLeft,
                        size: 40,
                      )),
                ),
                GestureDetector(
                  onTap: () => Get.off(
                    () => const ModeView(),
                    transition: Transition.fadeIn,
                  ),
                  child: Align(
                    alignment: const Alignment(0, -0.93),
                    child: Image.asset(
                      'assets/logo.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment(-0.95, 0),
              child: Text(
                '기록 내역',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 8,
                ),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return const HistoryCard();
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}