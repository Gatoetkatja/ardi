import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../data/questions_data.dart';
import '../models/question.dart';
import '../models/test_result.dart';
import '../widgets/custom_option_card.dart';
import '../widgets/progress_indicator_widget.dart';
import '../widgets/custom_button.dart';
import 'result_page.dart';

class PersonalityTestPage extends StatefulWidget {
  const PersonalityTestPage({super.key});

  @override
  State<PersonalityTestPage> createState() => _PersonalityTestPageState();
}

class _PersonalityTestPageState extends State<PersonalityTestPage> {
  int currentQuestionIndex = 0;
  List<Question> questions = [];
  Map<String, int> scores = {'visual': 0, 'auditory': 0, 'kinesthetic': 0};
  List<int?> selectedAnswers = [];

  @override
  void initState() {
    super.initState();
    questions = QuestionsData.getQuestions();
    selectedAnswers = List.filled(questions.length, null);
  }

  void selectAnswer(int answerIndex) {
    setState(() {
      selectedAnswers[currentQuestionIndex] = answerIndex;
    });
  }

  void nextQuestion() {
    if (selectedAnswers[currentQuestionIndex] != null) {
      // Update scores
      final selectedAnswer = questions[currentQuestionIndex]
          .answers[selectedAnswers[currentQuestionIndex]!];
      scores[selectedAnswer.learningStyle] = 
          (scores[selectedAnswer.learningStyle] ?? 0) + selectedAnswer.weight;

      if (currentQuestionIndex < questions.length - 1) {
        setState(() {
          currentQuestionIndex++;
        });
      } else {
        // Test completed, calculate result
        _completeTest();
      }
    }
  }

  void previousQuestion() {
    if (currentQuestionIndex > 0) {
      // Remove previous score
      final selectedAnswer = questions[currentQuestionIndex]
          .answers[selectedAnswers[currentQuestionIndex]!];
      scores[selectedAnswer.learningStyle] = 
          (scores[selectedAnswer.learningStyle] ?? 0) - selectedAnswer.weight;

      setState(() {
        currentQuestionIndex--;
      });
    }
  }

  void _completeTest() {
    // Determine dominant learning style
    String dominantStyle = scores.entries
        .reduce((a, b) => a.value > b.value ? a : b)
        .key;

    // Save result to Hive
    final testResult = TestResult(
      learningStyle: dominantStyle,
      scores: Map<String, int>.from(scores),
      timestamp: DateTime.now(),
      description: _getLearningStyleDescription(dominantStyle),
    );

    final box = Hive.box<TestResult>('test_results');
    box.add(testResult);

    // Navigate to result page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(result: testResult),
      ),
    );
  }

  String _getLearningStyleDescription(String style) {
    switch (style) {
      case 'visual':
        return 'You learn best through seeing and visualizing information.';
      case 'auditory':
        return 'You learn best through listening and verbal communication.';
      case 'kinesthetic':
        return 'You learn best through hands-on experience and physical activity.';
      default:
        return 'Your learning style has been determined.';
    }
  }

  @override
  Widget build(BuildContext context) {
    final progress = (currentQuestionIndex + 1) / questions.length;
    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: currentQuestionIndex > 0
            ? IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: previousQuestion,
              )
            : null,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ProgressIndicatorWidget(progress: progress),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Question ${currentQuestionIndex + 1} of ${questions.length}',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  currentQuestion.text,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: currentQuestion.answers.length,
              itemBuilder: (context, index) {
                return CustomOptionCard(
                  text: currentQuestion.answers[index].text,
                  isSelected: selectedAnswers[currentQuestionIndex] == index,
                  onTap: () => selectAnswer(index),
                );
              },
            ),
          ),
          CustomButton(
            text: currentQuestionIndex == questions.length - 1 
                ? 'Complete Test' 
                : 'Continue',
            isEnabled: selectedAnswers[currentQuestionIndex] != null,
            onPressed: nextQuestion,
          ),
        ],
      ),
    );
  }
}
