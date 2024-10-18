import 'dart:convert';
import 'package:http/http.dart' as http;

class FeedbackService {
  final String baseUrl = 'http://localhost:8080/api/feedbacks'; // Replace with your server URL

  // Add feedback
  Future<bool> addFeedback(String comment) async {
    final url = Uri.parse(baseUrl);
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'comment': comment,  // Adjust this according to your DTO fields
      }),
    );

    if (response.statusCode == 201) {
      return true; // Successfully added
    } else {
      return false; // Failed to add feedback
    }
  }

  // Get all feedback
  Future<List<String>> getAllFeedback() async {
    final url = Uri.parse(baseUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((feedback) => feedback['comment'] as String).toList();
    } else {
      throw Exception('Failed to load feedback');
    }
  }
}
