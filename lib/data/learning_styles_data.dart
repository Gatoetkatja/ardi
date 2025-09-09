class LearningStylesData {
  static Map<String, Map<String, String>> getLearningStyles() {
    return {
      'visual': {
        'title': 'Visual Learner',
        'description': 'You learn best through seeing and visualizing information. You prefer diagrams, charts, images, and written instructions.',
        'characteristics': '• Prefer visual aids and demonstrations\n• Remember faces better than names\n• Enjoy reading and writing\n• Think in pictures and images\n• Like organized, colorful notes',
        'tips': '• Use highlighters and color coding\n• Create mind maps and diagrams\n• Watch educational videos\n• Take detailed notes\n• Use flashcards with images',
      },
      'auditory': {
        'title': 'Auditory Learner',
        'description': 'You learn best through listening and verbal communication. You prefer lectures, discussions, and audio materials.',
        'characteristics': '• Learn through listening and speaking\n• Remember names better than faces\n• Enjoy music and sounds\n• Think in words and sounds\n• Prefer verbal instructions',
        'tips': '• Record lectures and replay them\n• Study in groups and discuss topics\n• Read aloud when studying\n• Use mnemonics and rhymes\n• Listen to educational podcasts',
      },
      'kinesthetic': {
        'title': 'Kinesthetic Learner',
        'description': 'You learn best through hands-on experience and physical activity. You prefer doing, touching, and moving.',
        'characteristics': '• Learn through movement and touch\n• Prefer hands-on activities\n• Need breaks during long study sessions\n• Use gestures when speaking\n• Remember what was done rather than seen or heard',
        'tips': '• Take frequent study breaks\n• Use hands-on experiments\n• Walk while studying\n• Use manipulatives and models\n• Practice skills repeatedly',
      },
    };
  }
}
