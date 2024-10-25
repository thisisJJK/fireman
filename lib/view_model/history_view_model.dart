import 'package:fireman/model/record_model.dart';
import 'package:fireman/service/database_service.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HistoryViewModel extends GetxController {
  DatabaseService databaseService = DatabaseService();

  List<RecordModel> records = [];
  Map<String, List<RecordModel>> recordsByDate = {};
  var dates = <String>[].obs;
  var typeCountsByDate = <String, Map<String, int>>{}.obs;

  Future<bool> getRecords() async {
    try {
      Map<String, Map<String, int>> tempTypeCountsByDate = {};
      records = await databaseService.databaseConfig().then(
            (_) => databaseService.readRecords(),
          );

      for (var record in records) {
        if (recordsByDate.containsKey(record.date)) {
          recordsByDate[record.date]!.add(record);
        } else {
          recordsByDate[record.date] = [record];
        }

        if (!tempTypeCountsByDate.containsKey(record.date)) {
          tempTypeCountsByDate[record.date] = {
            Mode.thanks.name: 0,
            Mode.firewood.name: 0
          };
        }
        tempTypeCountsByDate[record.date]![record.type] =
            (tempTypeCountsByDate[record.date]![record.type] ?? 0) + 1;
      }

      dates.value = recordsByDate.keys.toList();
      typeCountsByDate.value = tempTypeCountsByDate;

      return true;
    } catch (err) {
      print('getRecords err : ${err.toString()}');
      return false;
    }
  }

  Future<void> insertTestRecords() async {
    final formatter = DateFormat('yyyy-MM-dd');
    final List<String> testDates = [
      formatter.format(DateTime.now()),
      formatter.format(DateTime.now().subtract(const Duration(days: 1))),
      formatter.format(DateTime.now().subtract(const Duration(days: 2))),
      formatter.format(DateTime.now().subtract(const Duration(days: 3))),
      formatter.format(DateTime.now().subtract(const Duration(days: 4))),
      formatter.format(DateTime.now().subtract(const Duration(days: 5))),
      formatter.format(DateTime.now().subtract(const Duration(days: 6))),
    ];

    for (var i = 0; i < testDates.length; i++) {
      await databaseService.insertRecord(
        RecordModel(
          id: null,
          date: testDates[i],
          content: '테스트 내용 $i',
          type: i % 2 == 0 ? Mode.firewood.name : Mode.thanks.name,
        ),
      );
    }

    // 데이터 삽입 후 다시 불러오기
    getRecords();
  }

  @override
  void onInit() async {
    await getRecords();
    // insertTestRecords();
    super.onInit();
  }
}
