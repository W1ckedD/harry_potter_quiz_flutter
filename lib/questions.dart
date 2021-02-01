List questions = [
  {
    'question':
        'Who is the following quote from ? \n\n\t  \"What you fear most of all is -- fear\"',
    'choices': [
      'Professor Dumbledore',
      'Professor McGonagall',
      'Professor Lupin',
      'Professor Snape',
    ],
    'selectedChoice': -1,
    'correctAnswer': 2,
  },
  {
    'question':
        'Fill in the blank. \n\nThe first thing you wanna know about Hippogriffs is that they are very   ________   creatures.',
    'choices': [
      'Dangerous',
      'Proud',
      'Sensitive',
      'Magnificant',
    ],
    'selectedChoice': -1,
    'correctAnswer': 1,
  },
  {
    'question': 'Fill in the blank. \n\n"Dobby can only be freed if his masters present him with ________ sir."',
    'choices': [
      'Clothes',
      'Food',
      'Shelter',
      'Gold',
    ],
    'selectedChoice': -1,
    'correctAnswer': 0,
  },
  {
    'question': 'Which pair of characters below had the same Patronus?',
    'choices': [
      'Harry Potter - Lily Potter',
      'Lily Potter - James Potter',
      'Lily Potter - Severus Snape',
      'Severus Snape - Harry Potter',
    ],
    'selectedChoice': -1,
    'correctAnswer': 2,
  },
  {
    'question': 'What was Hermaione Granger\'s bogart?',
    'choices': [
      'Lord Voldemort',
      'Dementor',
      'Professor Snape',
      'Failure',
    ],
    'selectedChoice': -1,
    'correctAnswer': 3,
  },
  {
    'question': 'What was the last Hurcrox?',
    'choices': [
      'Rowena Ravenclaw\'s Diadem',
      'Tom Riddle\'s diary',
      'Nagini the Snake',
      'Harry Potter',
    ],
    'selectedChoice': -1,
    'correctAnswer': 3,
  },
  {
    'question': 'What house was Cho Chang in?',
    'choices': [
      'gryffindor',
      'Ravenclaw',
      'Hufflepuff',
      'Slytherin',
    ],
    'selectedChoice': -1,
    'correctAnswer': 1,
  },
  {
    'question': 'What Luna Lovegood\'s Patronus?',
    'choices': [
      'Bunny',
      'Hare',
      'Jackrabbit',
      'Cotton Tail',
    ],
    'selectedChoice': -1,
    'correctAnswer': 1,
  },
  {
    'question': 'What was Professor Lupin\s bogart?',
    'choices': [
      'Lord Voldemort',
      'Warevolfe',
      'Shapeshifter',
      'Full Moon',
    ],
    'selectedChoice': -1,
    'correctAnswer': 3,
  },
  {
    'question': 'Who died in Harry Potter and the deathly hollows?',
    'choices': [
      'Albus Dumbledore',
      'Severus Snape',
      'Sirius Black',
      'Cedric Diggory',
    ],
    'selectedChoice': -1,
    'correctAnswer': 1,
  },
];

void reset() {
  for (int i = 0; i < questions.length; i++) {
    questions[i]['selectedChoice'] = -1;
  }
}
