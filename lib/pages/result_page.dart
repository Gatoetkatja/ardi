import 'package:flutter/material.dart';
import '../models/test_result.dart';
import '../data/learning_styles_data.dart';
import '../widgets/result_card.dart';
import '../widgets/custom_button.dart';
import 'personality_test_page.dart';

class ResultPage extends StatelessWidget {
  final TestResult result;

  const ResultPage({super.key, required this.result});

  IconData _getIconForLearningStyle(String style) {
    switch (style) {
      case 'visual':
        return Icons.visibility;
      case 'auditory':
        return Icons.hearing;
      case 'kinesthetic':
        return Icons.touch_app;
      default:
        return Icons.psychology;
    }
  }

  Color _getColorForLearningStyle(String style) {
    switch (style) {
      case 'visual':
        return Colors.blue;
      case 'auditory':
        return Colors.green;
      case 'kinesthetic':
        return Colors.orange;
      default:
        return Colors.purple;
    }
  }

  @override
  Widget build(BuildContext context) {
    final learningStylesData = LearningStylesData.getLearningStyles();
    final styleData = learningStylesData[result.learningStyle]!;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Your Results',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Congratulations!',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: _getColorForLearningStyle(result.learningStyle),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    'Your learning style is',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    styleData['title']!,
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: _getColorForLearningStyle(result.learningStyle),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Scores:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ...result.scores.entries.map((entry) {
                    final percentage = (entry.value / result.scores.values.reduce((a, b) => a + b) * 100).round();
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              entry.key.toUpperCase(),
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: _getColorForLearningStyle(entry.key),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: LinearProgressIndicator(
                              value: entry.value / result.scores.values.reduce((a, b) => a > b ? a : b),
                              backgroundColor: Colors.grey.shade300,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                _getColorForLearningStyle(entry.key),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12.0),
                          Text(
                            '${entry.value} pts',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
            ResultCard(
              title: styleData['title']!,
              description: styleData['description']!,
              characteristics: styleData['characteristics']!,
              tips: styleData['tips']!,
              icon: _getIconForLearningStyle(result.learningStyle),
              color: _getColorForLearningStyle(result.learningStyle),
            ),
            CustomButton(
              text: 'Retake Test',
              backgroundColor: Colors.blue,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PersonalityTestPage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
