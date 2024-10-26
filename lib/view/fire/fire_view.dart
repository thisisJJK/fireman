import 'package:fireman/model/record_model.dart';
import 'package:fireman/view/main/mode_view.dart';
import 'package:fireman/view/main/widget/btn.dart';
import 'package:fireman/view_model/fire_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

class FireView extends StatelessWidget {
  FireView({super.key});

  final FireViewModel fireViewModel = Get.put(FireViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Stack(
            children: [
              //logo
              GestureDetector(
                onTap: () => Get.off(
                  () =>  ModeView(),
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
              Align(
                alignment: const Alignment(-1, -0.93),
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      FeatherIcons.chevronLeft,
                      size: 40,
                    )),
              ),
              //text
              Obx(
                () => Align(
                  alignment: const Alignment(0, -0.65),
                  child: Text(
                    fireViewModel.displayText.value,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              //fire
              Obx(
                () {
                  return GestureDetector(
                    onTap: () {
                      //increase fontsize
                      if (!fireViewModel.isFull.value) {
                        fireViewModel.increaseSize();
                      }

                      if (fireViewModel.isFull.value) {
                        fireViewModel.decreaseSize();
                      }
                    },
                    child: Center(
                      child: AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 222),
                        style: TextStyle(
                          fontSize: fireViewModel.size.value,
                        ),
                        child: const Text('🔥'),
                      ),
                    ),
                  );
                },
              ),

              //tap hint
              Obx(
                () => !fireViewModel.isEnd.value
                    ? Align(
                        alignment: const Alignment(0, 0.65),
                        child: Text(
                          !fireViewModel.isFull.value
                              ? '  Tap 해서\n감정땔감 넣기!'
                              : '좋아! 잘했어!',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    : Align(
                        alignment: const Alignment(0, 0.65),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Btn(
                              mode: Mode.thanks,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextButton(
                              onPressed: () {
                                Get.off(
                                  () =>  ModeView(),
                                  transition: Transition.fadeIn,
                                );
                              },
                              child: Text('처음으로',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                    decoration: TextDecoration.underline,
                                    decorationColor:
                                        Theme.of(context).colorScheme.tertiary,
                                  )),
                            ),
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
