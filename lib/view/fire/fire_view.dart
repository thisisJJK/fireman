import 'package:fireman/view/main/mode_view.dart';
import 'package:fireman/view_model/fire_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FireView extends StatelessWidget {
  FireView({super.key});
  final FireViewModel _fireViewModel = Get.put(FireViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            //logo
            GestureDetector(
              onTap: () => Get.to(
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
            //text
            Obx(
              () => Align(
                alignment: const Alignment(0, -0.65),
                child: Text(
                  _fireViewModel.displayText.value,
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
                    if (!_fireViewModel.isFull.value)
                      _fireViewModel.increaseSize();

                    if (_fireViewModel.isFull.value)
                      _fireViewModel.decreaseSize();
                  },
                  child: Center(
                    child: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 222),
                      style: TextStyle(
                        fontSize: _fireViewModel.size.value,
                      ),
                      child: const Text('🔥'),
                    ),
                  ),
                );
              },
            ),

            //tap hint
            Obx(
              () => Align(
                alignment: const Alignment(0, 0.75),
                child: Text(
                  !_fireViewModel.isFull.value
                      ? '  Tap 해서\n감정땔감 넣기!'
                      : '좋아! 잘했어!',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
