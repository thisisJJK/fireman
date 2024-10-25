import 'package:fireman/view/fire/fire_view.dart';
import 'package:fireman/view/history/history_view.dart';
import 'package:fireman/view/main/mode_view.dart';
import 'package:fireman/view_model/firewood_thanks_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

class FirewoodThanksView extends StatelessWidget {
  final Mode mode;
  const FirewoodThanksView({super.key, required this.mode});

  @override
  Widget build(BuildContext context) {
    final FirewoodThanksViewModel firewoodThanksViewModel =
        Get.put(FirewoodThanksViewModel());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        FeatherIcons.chevronLeft,
                        size: 40,
                      )),
                  GestureDetector(
                    onTap: () => Get.off(
                      () => const ModeView(),
                      transition: Transition.fadeIn,
                    ),
                    child: Align(
                      alignment: const Alignment(0, -1),
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
              Text(
                mode == Mode.firewood
                    ? '어떤 감정을 태워줄까?'
                    : ' 긍정적인 말이나\n감사한 일 적어줘!',
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        30,
                      ),
                    ),
                    child: TextField(
                      autofocus: true,
                      maxLines: 5,
                      minLines: 1,
                      controller: firewoodThanksViewModel.textEditingController,
                      decoration: InputDecoration(
                        hintText: mode == Mode.firewood
                            ? '불태워 없앨 안좋은 기억이나 \n경험을 적어보세요.'
                            : '나에 대한 칭찬이나\n감사한 일을 적어보세요.',
                        hintStyle: const TextStyle(fontSize: 21),
                        filled: true,
                        fillColor: mode == Mode.firewood
                            ? Theme.of(context).colorScheme.secondaryContainer
                            : Theme.of(context).colorScheme.tertiaryContainer,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        isDense: true,
                        contentPadding:
                            const EdgeInsets.fromLTRB(10, 10, 30, 10),
                      ),
                      style: TextStyle(
                        color: mode == Mode.firewood
                            ? Theme.of(context).colorScheme.onSecondaryContainer
                            : Theme.of(context).colorScheme.onTertiaryContainer,
                        fontSize: 21,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      mode == Mode.firewood
                          ? Get.to(() => FireView(),
                              transition: Transition.fadeIn)
                          : Get.to(() => const HistoryView(),
                              transition: Transition.fadeIn);

                      firewoodThanksViewModel.textEditingController.clear();
                    },
                    icon: const Icon(
                      FeatherIcons.send,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
