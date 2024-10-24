import 'package:get/get.dart';

class FireViewModel extends GetxController {
  var size = 100.0.obs;
  var isFull = false.obs;
  var displayText = '안좋은 것들 전부\n   다 태워버려'.obs;

  void increaseSize() {
    if (size.value < 350) {
      size.value += 20;
    } else
      isFull.value = true;
  }

  void decreaseSize() async {
    if (size.value > 3) {
      changeText(size.value);
      await Future.delayed(const Duration(milliseconds: 222));
      size.value -= 1;
      decreaseSize();
    }
  }

  void changeText(double size) async {
    await Future.delayed(const Duration(milliseconds: 2222));

    if (size > 250) displayText.value = '이 감정불꽃은\n나에게 맡겨둬!';
    if (size < 250 && size > 5) displayText.value = '감정불꽃은 순조롭게\n     꺼져가고 있어';
    if (size < 5) displayText.value = '   이제 불이 꺼졌어!\n마음이 가벼워졌을거야!';
  }
}
// 