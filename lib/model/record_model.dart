enum Mode { firewood, thanks }

class RecordModel {
  final int? id;
  final String date;
  final String content;
  final String type;

  RecordModel({
    this.id,
    required this.date,
    required this.content,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'content': content,
      'type': type,
    };
  }

  factory RecordModel.fromMap(Map<String, dynamic> map) {
    return RecordModel(
      id: map['id'],
      date: map['date'],
      content: map['content'],
      type: map['type'],
    );
  }
}
