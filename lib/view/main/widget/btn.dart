import 'package:fireman/model/record_model.dart';
import 'package:fireman/view/firewood_thanks/firewood_thanks_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Btn extends StatelessWidget {
  final Mode mode;

  const Btn({
    super.key,
    required this.mode,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => FirewoodThanksView(mode: mode),
          transition: Transition.fadeIn,
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            mode == Mode.firewood ? '나쁜마음 다 태워버릴' : '차갑게 마음을 가라앉혀줄',
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: mode == Mode.firewood
                    ? Theme.of(context).colorScheme.secondaryContainer
                    : Theme.of(context).colorScheme.tertiaryContainer),
            child: Center(
              child: Text(
                mode == Mode.firewood ? '🪵   감정땔감 만들기   ' : '🧯 감정소화기 만들기  ',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: mode == Mode.firewood
                        ? Theme.of(context).colorScheme.onSecondaryContainer
                        : Theme.of(context).colorScheme.onTertiaryContainer),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
