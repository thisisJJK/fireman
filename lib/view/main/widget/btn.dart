import 'package:fireman/view/firewood_thanks/firewood_thanks_view.dart';
import 'package:fireman/view_model/firewood_thanks_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Btn extends StatelessWidget {
  final String text;
  final Mode mode;

  const Btn({
    super.key,
    required this.text,
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
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: mode == Mode.firewood
                ? Theme.of(context).colorScheme.secondaryContainer
                : Theme.of(context).colorScheme.tertiaryContainer),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: mode == Mode.firewood
                    ? Theme.of(context).colorScheme.onSecondaryContainer
                    : Theme.of(context).colorScheme.onTertiaryContainer),
          ),
        ),
      ),
    );
  }
}
