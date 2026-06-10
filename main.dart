import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const HealthHygieneApp());
}

class HealthHygieneApp extends StatelessWidget {
  const HealthHygieneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Health & Hygiene App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: const HomePage(),
    );
  }
}

//
// ---------------------- HOME PAGE ----------------------
//
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> categories = const [
    {"title": "Handwashing", "icon": Icons.clean_hands, "color": Color(0xffA8E6CF)},
    {"title": "Nutrition", "icon": Icons.restaurant, "color": Color(0xffFF8B94)},
    {"title": "Sanitation", "icon": Icons.delete, "color": Color(0xffFFD3B6)},
    {"title": "Exercise", "icon": Icons.fitness_center, "color": Color(0xffDCE775)},
    {"title": "Sleep", "icon": Icons.nightlight_round, "color": Color(0xff9FA8DA)},
    {"title": "Mental Care", "icon": Icons.self_improvement, "color": Color(0xffCE93D8)},
    {"title": "Oral Care", "icon": Icons.mood, "color": Color(0xff80DEEA)},
    {"title": "Hydration", "icon": Icons.water_drop, "color": Color(0xff4DD0E1)},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F8FC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Hello 👋",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),
              motivationCard(),
              const SizedBox(height: 25),
              const Text("Explore Topics",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),

              Expanded(
                child: GridView.builder(
                  itemCount: categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 4 / 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemBuilder: (context, i) {
                    return categoryCard(
                      categories[i]['title'],
                      categories[i]['icon'],
                      categories[i]['color'],
                      context,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget motivationCard() {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      gradient:
      const LinearGradient(colors: [Color(0xff6DD5FA), Color(0xff2980B9)]),
      borderRadius: BorderRadius.circular(18),
    ),
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("“Health is the biggest wealth!”",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
        SizedBox(height: 10),
        Text("Follow daily hygiene to stay strong!",
            style: TextStyle(fontSize: 14, color: Colors.white)),
      ],
    ),
  );
}

Widget categoryCard(String title, IconData icon, Color bg, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => SubCategoryPage(title: title),
        ),
      );
    },
    child: Container(
      decoration:
      BoxDecoration(color: bg, borderRadius: BorderRadius.circular(18)),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 40),
          const Spacer(),
          Text(title,
              style:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
        ],
      ),
    ),
  );
}

//
// ---------------------- SUB CATEGORY PAGE ----------------------
//
class SubCategoryPage extends StatelessWidget {
  final String title;
  const SubCategoryPage({super.key, required this.title});

  final List<String> subItems = const [
    "Basics",
    "Do’s & Don’ts",
    "Best Practices",
    "Tips",
    "Quiz"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), backgroundColor: Colors.teal),
      body: ListView.builder(
        itemCount: subItems.length,
        itemBuilder: (context, i) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            color: Colors.teal.shade50,
            child: ListTile(
              title: Text(subItems[i],
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16)),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                if (subItems[i] == "Quiz") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => QuizPage(topic: title)));
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailsPage(
                        category: title,
                        section: subItems[i],
                      ),
                    ),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}

//
// ---------------------- DETAILS PAGE ----------------------
//
class DetailsPage extends StatelessWidget {
  final String category;
  final String section;
  const DetailsPage({super.key, required this.category, required this.section});

  List<String> getContent() {
    switch (section) {
      case "Basics":
        return [
          "Hygiene keeps our body and surroundings clean.",
          "Wash hands regularly with soap and water.",
          "Eat healthy and avoid junk food.",
          "Exercise daily to stay fit and strong.",
          "Drink plenty of water and sleep well."
        ];
      case "Do’s & Don’ts":
        return [
          "✅ Wash your hands before eating.",
          "✅ Brush your teeth twice daily.",
          "🚫 Don’t litter in public places.",
          "🚫 Don’t eat uncovered street food.",
          "✅ Cover your mouth when sneezing."
        ];
      case "Best Practices":
        return [
          "Maintain personal hygiene every day.",
          "Keep your surroundings clean.",
          "Eat balanced meals at regular times.",
          "Exercise and meditate regularly.",
          "Follow a proper sleep schedule."
        ];
      case "Tips":
        return [
          "Start your day with a glass of warm water.",
          "Use a hand sanitizer when soap isn’t available.",
          "Stay hydrated during hot weather.",
          "Include fruits and vegetables in every meal.",
          "Smile more—it improves your mood and health!"
        ];
      default:
        return ["No data available."];
    }
  }

  @override
  Widget build(BuildContext context) {
    final content = getContent();
    return Scaffold(
      appBar: AppBar(
        title: Text("$section - $category"),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: content.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            color: Colors.teal.shade100,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.teal,
                child: Text(
                  "${index + 1}",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(
                content[index],
                style:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          );
        },
      ),
    );
  }
}

//
// ---------------------- QUIZ PAGE ----------------------
//
class QuizPage extends StatefulWidget {
  final String topic;
  const QuizPage({super.key, required this.topic});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentIndex = 0;
  int score = 0;

  final List<Map<String, dynamic>> quiz = [
    {
      "q": "How many times should you brush your teeth daily?",
      "options": ["Once", "Twice", "After every meal", "Only at night"],
      "answer": "Twice"
    },
    {
      "q": "Why is handwashing important?",
      "options": [
        "It looks good",
        "It removes germs",
        "It is fun",
        "It makes hands cold"
      ],
      "answer": "It removes germs"
    },
    {
      "q": "When should you wash your hands?",
      "options": [
        "Before eating",
        "After using toilet",
        "After sneezing",
        "All of the above"
      ],
      "answer": "All of the above"
    },
    {
      "q": "How much water should you drink daily?",
      "options": [
        "1 glass",
        "2 liters",
        "As less as possible",
        "No water needed"
      ],
      "answer": "2 liters"
    },
    {
      "q": "Why should you exercise regularly?",
      "options": [
        "To get tired",
        "To stay fit and healthy",
        "To waste time",
        "To avoid eating"
      ],
      "answer": "To stay fit and healthy"
    },
  ];

  void checkAnswer(String selected) {
    bool correct = quiz[currentIndex]["answer"] == selected;
    if (correct) score++;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: correct ? Colors.green : Colors.red,
      content: Text(correct ? "✅ Correct!" : "❌ Wrong!"),
      duration: const Duration(milliseconds: 600),
    ));
    Future.delayed(const Duration(milliseconds: 600), () {
      if (currentIndex < quiz.length - 1) {
        setState(() => currentIndex++);
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (_) =>
                  ResultPage(score: score, total: quiz.length)),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final q = quiz[currentIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.topic} Quiz"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Q${currentIndex + 1}. ${q['q']}",
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ...List.generate(
              q["options"].length,
                  (i) => Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal.shade100,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.all(14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () => checkAnswer(q["options"][i]),
                  child: Text(q["options"][i],
                      style: const TextStyle(fontSize: 16)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//
// ---------------------- RESULT PAGE ----------------------
//
class ResultPage extends StatelessWidget {
  final int score;
  final int total;
  const ResultPage({super.key, required this.score, required this.total});

  @override
  Widget build(BuildContext context) {
    double percent = (score / total) * 100;
    String message = percent >= 80
        ? "🌟 Excellent! Keep maintaining good hygiene!"
        : percent >= 50
        ? "🙂 Good job! Improve a bit more!"
        : "⚠️ Try to learn and practice better habits!";

    return Scaffold(
      appBar: AppBar(title: const Text("Quiz Result"), backgroundColor: Colors.teal),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Your Score: $score / $total",
                style:
                const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Text(message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 12)),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const HomePage()));
              },
              child: const Text("🏠 Back to Home"),
            )
          ],
        ),
      ),
    );
  }
}

