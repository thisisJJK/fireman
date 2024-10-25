import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

enum Mode { firewood, thanks }

class FirewoodThanksViewModel extends GetxController {
  TextEditingController textEditingController = TextEditingController();

  @override
  void onClose() {
    textEditingController.clear();
    super.onClose();
  }
}
