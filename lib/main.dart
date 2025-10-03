import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Quiz {
  final String title;
  final List<Question> questions;
  final List<PlayerScore> ranking = [];

  Quiz({required this.title, required this.questions});
}

class Question {
  final String text;
  final bool answer;

  Question({required this.text, required this.answer});
}

class PlayerScore {
  final String name;
  final int score;

  PlayerScore({required this.name, required this.score});
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Quiz> quizzes = [
    Quiz(
      title: "Quiz de Marvel",
      questions: [
        Question(text: "O Homem de Ferro se chama Tony Stark.", answer: true),
        Question(text: "O Capitão América empunha o Mjolnir.", answer: true),
        Question(text: "Thanos é irmão do Thor.", answer: false),
        Question(text: "Viúva Negra se chama Natasha Romanoff.", answer: true),
        Question(text: "O Pantera Negra é de Wakanda.", answer: true),
        Question(text: "Loki é irmão adotivo do Thor.", answer: true),
        Question(text: "Homem-Aranha é da DC Comics.", answer: false),
        Question(text: "O Hulk é verde.", answer: true),
        Question(text: "O Doutor Estranho é cirurgião.", answer: true),
        Question(text: "Deadpool faz parte dos Vingadores.", answer: false),
      ],
    ),
    Quiz(
      title: "Quiz de League of Legends",
      questions: [
        Question(text: "Yasuo é conhecido como o Sem Rosto.", answer: false),
        Question(text: "Jinx é a irmã de Vi.", answer: true),
        Question(text: "Teemo é cego.", answer: false),
        Question(text: "Ahri tem 9 caudas.", answer: true),
        Question(text: "Riven é de Noxus.", answer: false),
        Question(text: "Lux é de Demacia.", answer: true),
        Question(text: "Draven é irmão do Darius.", answer: true),
        Question(text: "Garen é rival de Katarina.", answer: true),
        Question(text: "Lee Sin é cego.", answer: true),
        Question(text: "Tryndamere é irmão de Ashe.", answer: false),
      ],
    ),
    Quiz(
      title: "Quiz de Pokémon",
      questions: [
        Question(text: "Pikachu é do tipo elétrico.", answer: true),
        Question(text: "Charmander evolui para Charizard diretamente.", answer: false),
        Question(text: "Mewtwo foi criado em laboratório.", answer: true),
        Question(text: "Bulbasaur é o número 1 da Pokédex.", answer: true),
        Question(text: "Ash nunca venceu uma liga Pokémon.", answer: true),
        Question(text: "Squirtle é do tipo água.", answer: true),
        Question(text: "Gyarados é evolução do Magikarp.", answer: true),
        Question(text: "Jigglypuff coloca os outros para dormir cantando.", answer: true),
        Question(text: "Eevee tem apenas 2 evoluções.", answer: false),
        Question(text: "Mew é considerado o Pokémon original.", answer: true),
      ],
    ),
    Quiz(
      title: "Quiz de Fortnite",
      questions: [
        Question(text: "Fortnite foi lançado em 2017.", answer: true),
        Question(text: "O modo Battle Royale suporta 100 jogadores por partida.", answer: true),
        Question(text: "Construção é um recurso exclusivo do Fortnite.", answer: false),
        Question(text: "A moeda do jogo é chamada V-Bucks.", answer: true),
        Question(text: "O modo 'Save the World' sempre foi totalmente gratuito.", answer: false),
        Question(text: "Tilted Towers é (ou já foi) um local do mapa de Fortnite.", answer: true),
        Question(text: "Fortnite é desenvolvido pela Activision.", answer: false),
        Question(text: "Cada temporada de Fortnite dura exatamente 10 semanas.", answer: false),
        Question(text: "Jogadores podem usar planadores (gliders) para pousar no mapa.", answer: true),
        Question(text: "O Passe de Batalha oferece recompensas conforme o jogador sobe de nível.", answer: true),
      ],
    ),
    Quiz(
  title: "Quiz de Conhecimentos Gerais",
  questions: [
    Question(text: "A Terra é o terceiro planeta do Sistema Solar.", answer: true),
    Question(text: "O corpo humano tem 206 ossos.", answer: true),
    Question(text: "A capital da França é Berlim.", answer: false),
    Question(text: "O Sol é uma estrela.", answer: true),
    Question(text: "A água ferve a 100 graus Celsius ao nível do mar.", answer: true),
    Question(text: "O maior oceano do mundo é o Atlântico.", answer: false), // é o Pacífico
    Question(text: "O Brasil faz fronteira com 10 países da América do Sul.", answer: false), // são 9
    Question(text: "O monte Everest é a montanha mais alta do mundo.", answer: true),
    Question(text: "Um ano bissexto tem 366 dias.", answer: true),
    Question(text: "A moeda oficial do Japão é o Yuan.", answer: false), // é o Iene
  ],
),
Quiz(
  title: "Quiz de Filmes e Séries",
  questions: [
    Question(text: "A série 'Friends' se passa em Nova York.", answer: true),
    Question(text: "O personagem Harry Potter pertence à Casa Sonserina.", answer: false), // é Grifinória
    Question(text: "O filme 'Titanic' foi dirigido por James Cameron.", answer: true),
    Question(text: "O personagem Walter White é protagonista da série 'Breaking Bad'.", answer: true),
    Question(text: "O Senhor dos Anéis foi escrito por J. K. Rowling.", answer: false), // é de Tolkien
    Question(text: "A série 'Stranger Things' se passa na cidade fictícia de Hawkins.", answer: true),
    Question(text: "Capitão Jack Sparrow é um personagem da franquia 'Piratas do Caribe'.", answer: true),
    Question(text: "A série 'Game of Thrones' foi baseada em livros de George R. R. Martin.", answer: true),
    Question(text: "O personagem Tony Stark também é conhecido como Batman.", answer: false), // é o Homem de Ferro
    Question(text: "A animação 'Frozen' é da DreamWorks.", answer: false), // é da Disney
  ],
),  
    
  ];

  void updateRanking(Quiz quiz, PlayerScore playerScore) {
    setState(() {
      quiz.ranking.add(playerScore);
      quiz.ranking.sort((a, b) => b.score.compareTo(a.score));
      if (quiz.ranking.length > 5) {
        quiz.ranking.removeLast();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz App", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: quizzes.length,
        itemBuilder: (context, index) {
          final quiz = quizzes[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(quiz.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizPage(
                            quiz: quiz,
                            onFinish: (playerScore) => updateRanking(quiz, playerScore),
                          ),
                        ),
                      );
                    },
                    child: Text("Jogar"),
                  ),
                  SizedBox(height: 10),
                  Text("Top 5 Ranking:"),
                  for (var player in quiz.ranking)
                    Text("${player.name}: ${player.score}/10"),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RankingPage(quiz: quiz),
                          ),
                        );
                      },
                      child: Text("Ver Ranking Completo →", style: TextStyle(color: Colors.purple)),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  final Quiz quiz;
  final Function(PlayerScore) onFinish;

  QuizPage({required this.quiz, required this.onFinish});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionIndex = 0;
  int score = 0;
  bool answered = false;
  bool? correctAnswer;

  void answerQuestion(bool value) {
    setState(() {
      answered = true;
      correctAnswer = widget.quiz.questions[questionIndex].answer == value;
      if (correctAnswer!) score++;
    });

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        if (questionIndex < widget.quiz.questions.length - 1) {
          questionIndex++;
          answered = false;
          correctAnswer = null;
        } else {
          _finishQuiz();
        }
      });
    });
  }

  void _finishQuiz() {
    TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Fim do Quiz!"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Sua pontuação: $score/10"),
            TextField(
              controller: controller,
              decoration: InputDecoration(labelText: "Digite seu nome"),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                widget.onFinish(PlayerScore(name: controller.text, score: score));
                Navigator.pop(context);
                Navigator.pop(context);
              }
            },
            child: Text("Salvar"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.quiz.questions[questionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.quiz.title, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Pergunta ${questionIndex + 1}/${widget.quiz.questions.length}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(question.text, style: TextStyle(fontSize: 18)),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: answered
                    ? (correctAnswer == true ? Colors.green : Colors.red)
                    : Colors.grey,
                foregroundColor: Colors.white,
              ),
              onPressed: answered ? null : () => answerQuestion(true),
              child: Text("Verdadeiro"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: answered
                    ? (correctAnswer == false ? Colors.green : Colors.red)
                    : Colors.grey,
                foregroundColor: Colors.white,
              ),
              onPressed: answered ? null : () => answerQuestion(false),
              child: Text("Falso"),
            ),
          ],
        ),
      ),
    );
  }
}

class RankingPage extends StatelessWidget {
  final Quiz quiz;

  RankingPage({required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ranking - ${quiz.title}", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: quiz.ranking.length,
        itemBuilder: (context, index) {
          final player = quiz.ranking[index];
          return ListTile(
            title: Text(player.name),
            trailing: Text("${player.score}/10"),
          );
        },
      ),
    );
  }
}
