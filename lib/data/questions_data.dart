import '../models/question.dart';

class QuestionsData {
  static List<Question> getQuestions() {
    return [
      Question(
        text: "When learning something new, I prefer to:",
        answers: [
          Answer(text: "Read about it", learningStyle: "visual", weight: 3),
          Answer(text: "Listen to explanations", learningStyle: "auditory", weight: 3),
          Answer(text: "Try it hands-on", learningStyle: "kinesthetic", weight: 3),
          Answer(text: "Watch demonstrations", learningStyle: "visual", weight: 2),
        ],
      ),
      Question(
        text: "In a classroom, I learn best when:",
        answers: [
          Answer(text: "The teacher uses diagrams and charts", learningStyle: "visual", weight: 3),
          Answer(text: "The teacher explains verbally", learningStyle: "auditory", weight: 3),
          Answer(text: "We do group activities", learningStyle: "kinesthetic", weight: 3),
          Answer(text: "I can take detailed notes", learningStyle: "visual", weight: 2),
        ],
      ),
      Question(
        text: "When giving directions, I prefer to:",
        answers: [
          Answer(text: "Draw a map", learningStyle: "visual", weight: 3),
          Answer(text: "Explain verbally", learningStyle: "auditory", weight: 3),
          Answer(text: "Walk through the route", learningStyle: "kinesthetic", weight: 3),
          Answer(text: "Write down the steps", learningStyle: "visual", weight: 2),
        ],
      ),
      Question(
        text: "I remember best when information is:",
        answers: [
          Answer(text: "Shown in pictures or diagrams", learningStyle: "visual", weight: 3),
          Answer(text: "Explained to me", learningStyle: "auditory", weight: 3),
          Answer(text: "Experienced through practice", learningStyle: "kinesthetic", weight: 3),
          Answer(text: "Written in organized lists", learningStyle: "visual", weight: 2),
        ],
      ),
      Question(
        text: "When studying, I prefer to:",
        answers: [
          Answer(text: "Use flashcards and highlights", learningStyle: "visual", weight: 3),
          Answer(text: "Read aloud or discuss", learningStyle: "auditory", weight: 3),
          Answer(text: "Use models or practice exercises", learningStyle: "kinesthetic", weight: 3),
          Answer(text: "Create mind maps", learningStyle: "visual", weight: 2),
        ],
      ),
      Question(
        text: "In meetings, I prefer to:",
        answers: [
          Answer(text: "See presentations and charts", learningStyle: "visual", weight: 3),
          Answer(text: "Participate in discussions", learningStyle: "auditory", weight: 3),
          Answer(text: "Have interactive workshops", learningStyle: "kinesthetic", weight: 3),
          Answer(text: "Take written notes", learningStyle: "visual", weight: 2),
        ],
      ),
      Question(
        text: "When learning a new skill, I:",
        answers: [
          Answer(text: "Watch others do it first", learningStyle: "visual", weight: 3),
          Answer(text: "Listen to instructions", learningStyle: "auditory", weight: 3),
          Answer(text: "Jump in and try it", learningStyle: "kinesthetic", weight: 3),
          Answer(text: "Read the manual", learningStyle: "visual", weight: 2),
        ],
      ),
      Question(
        text: "I concentrate best when:",
        answers: [
          Answer(text: "The environment is visually organized", learningStyle: "visual", weight: 3),
          Answer(text: "There's background music or quiet", learningStyle: "auditory", weight: 3),
          Answer(text: "I can move around freely", learningStyle: "kinesthetic", weight: 3),
          Answer(text: "I have good lighting", learningStyle: "visual", weight: 2),
        ],
      ),
      Question(
        text: "When explaining ideas, I tend to:",
        answers: [
          Answer(text: "Draw diagrams or use gestures", learningStyle: "visual", weight: 3),
          Answer(text: "Talk through the concept", learningStyle: "auditory", weight: 3),
          Answer(text: "Use examples and demonstrations", learningStyle: "kinesthetic", weight: 3),
          Answer(text: "Write it down step by step", learningStyle: "visual", weight: 2),
        ],
      ),
      Question(
        text: "I prefer books and materials that:",
        answers: [
          Answer(text: "Have lots of diagrams and images", learningStyle: "visual", weight: 3),
          Answer(text: "I can read aloud", learningStyle: "auditory", weight: 3),
          Answer(text: "Include interactive elements", learningStyle: "kinesthetic", weight: 3),
          Answer(text: "Are well-organized visually", learningStyle: "visual", weight: 2),
        ],
      ),
      Question(
        text: "When problem-solving, I:",
        answers: [
          Answer(text: "Visualize the solution", learningStyle: "visual", weight: 3),
          Answer(text: "Talk through the problem", learningStyle: "auditory", weight: 3),
          Answer(text: "Try different approaches", learningStyle: "kinesthetic", weight: 3),
          Answer(text: "Make lists of options", learningStyle: "visual", weight: 2),
        ],
      ),
      Question(
        text: "I learn vocabulary best by:",
        answers: [
          Answer(text: "Seeing words written down", learningStyle: "visual", weight: 3),
          Answer(text: "Hearing words pronounced", learningStyle: "auditory", weight: 3),
          Answer(text: "Using words in sentences", learningStyle: "kinesthetic", weight: 3),
          Answer(text: "Making word cards", learningStyle: "visual", weight: 2),
        ],
      ),
      Question(
        text: "During free time, I prefer activities that:",
        answers: [
          Answer(text: "Are visually stimulating", learningStyle: "visual", weight: 3),
          Answer(text: "Involve music or conversation", learningStyle: "auditory", weight: 3),
          Answer(text: "Are physically active", learningStyle: "kinesthetic", weight: 3),
          Answer(text: "Allow me to create or design", learningStyle: "visual", weight: 2),
        ],
      ),
      Question(
        text: "I understand instructions best when they are:",
        answers: [
          Answer(text: "Written down clearly", learningStyle: "visual", weight: 3),
          Answer(text: "Explained verbally", learningStyle: "auditory", weight: 3),
          Answer(text: "Demonstrated step by step", learningStyle: "kinesthetic", weight: 3),
          Answer(text: "Shown with pictures", learningStyle: "visual", weight: 2),
        ],
      ),
      Question(
        text: "When recalling information, I:",
        answers: [
          Answer(text: "Picture it in my mind", learningStyle: "visual", weight: 3),
          Answer(text: "Hear it in my head", learningStyle: "auditory", weight: 3),
          Answer(text: "Remember how it felt to learn", learningStyle: "kinesthetic", weight: 3),
          Answer(text: "See it written down", learningStyle: "visual", weight: 2),
        ],
      ),
    ];
  }
}
