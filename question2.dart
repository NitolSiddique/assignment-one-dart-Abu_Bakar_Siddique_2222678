// Question 2: Collections & Control Flow (Difficulty: 2/5) ⭐⭐
/**
 * EXPECTED OUTPUT:
 * Student Scores: {Alice: <random>, Bob: <random>, ...}
 * Highest Score: <Name> with <Score>
 * Lowest Score: <Name> with <Score>
 * Average Score: <Value>
 * Alice: <Score> (Category)
 * ...
 */

import 'dart:math';

void main() {
  // 1. Create a List<String> of student names
  List<String> studentNames = ["Alice", "Bob", "Charlie", "Diana", "Eve"];

  // 2. Create a Map<String, int> to store student scores
  Map<String, int> studentScores = {};

  // 3. Use a for loop to assign random scores (60-100) to each student
  final random = Random();
  for (String student in studentNames) {
    // nextInt(41) returns 0-40, so adding 60 gives 60-100 (inclusive)
    studentScores[student] = 60 + random.nextInt(41);
  }

  // 4. Find the highest, lowest and average scores
  String highestStudent = "";
  int highestScore = 0;
  String lowestStudent = "";
  int lowestScore = 100;
  int totalScore = 0;

  for (final entry in studentScores.entries) {
    final student = entry.key;
    final score = entry.value;

    totalScore += score;

    if (highestStudent.isEmpty || score > highestScore) {
      highestStudent = student;
      highestScore = score;
    }

    if (lowestStudent.isEmpty || score < lowestScore) {
      lowestStudent = student;
      lowestScore = score;
    }
  }

  double averageScore = totalScore / studentScores.length;

  print("Student Scores: $studentScores");
  print("Highest Score: $highestStudent with $highestScore");
  print("Lowest Score: $lowestStudent with $lowestScore");
  print("Average Score: $averageScore");

  // 5. Use a switch statement to categorize students
  for (String student in studentNames) {
    int score = studentScores[student] ?? 0;
    String category;

    switch (score) {
      case >= 90:
        category = "Excellent";
      case >= 80:
        category = "Good";
      case >= 70:
        category = "Average";
      default:
        category = "Needs Improvement";
    }

    print("$student: $score ($category)");
  }
}
