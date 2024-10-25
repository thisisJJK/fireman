import 'package:fireman/view/firewood_thanks/firewood_thanks_view.dart';
import 'package:fireman/view_model/firewood_thanks_view_model.dart';
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
            mode == Mode.firewood ? '분노,짜증,억울함으로' : '긍정과 감사 한 마디로',
            style: const TextStyle(color: Colors.white, fontSize: 20),
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
