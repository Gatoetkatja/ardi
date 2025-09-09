import 'package:hive/hive.dart';

part 'test_result.g.dart';

@HiveType(typeId: 0)
class TestResult extends HiveObject {
  @HiveField(0)
  final String learningStyle;

  @HiveField(1)
  final Map<String, int> scores;

  @HiveField(2)
  final DateTime timestamp;

  @HiveField(3)
  final String description;

  TestResult({
    required this.learningStyle,
    required this.scores,
    required this.timestamp,
    required this.description,
  });
}
