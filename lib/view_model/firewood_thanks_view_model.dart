import 'package:fireman/model/record_model.dart';
import 'package:fireman/service/database_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FirewoodThanksViewModel extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  DatabaseService databaseService = DatabaseService();

  @override
  void onClose() {
    textEditingController.clear();
    super.onClose();
  }

  Future<bool> insertFirewood(String text, String type) async {
    try {
      databaseService.databaseConfig().then((_) => databaseService.insertRecord(
            RecordModel(
              id: null,
              date: today(),
              content: text,
              type: type,
            ),
          ));
      return true;
    } catch (err) {
      print('firewood insert err : ${err.toString()}');
      return false;
    }
  }

  String today() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy.MM.dd').format(now);
    String weekDay = DateFormat('E', 'ko_KR').format(now);

    return '$formattedDate $weekDay';
  }
}
