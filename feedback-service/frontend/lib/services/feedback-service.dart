import 'dart:convert';
import 'package:http/http.dart' as http;
import 'feedback.dart';

class FeedbackService {
  final String baseUrl = "http://localhost:8080/api/feedback";

  Future<List<Feedback>> getAllFeedback() async {
    final response = await http.get(Uri.parse("$baseUrl/all"));
    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return list.map((json) => Feedback.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load feedback");
    }
  }

  Future<void> addFeedback(Feedback feedback) async {
    final response = await http.post(
      Uri.parse("$baseUrl/add"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(feedback.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception("Failed to add feedback");
    }
  }
}
