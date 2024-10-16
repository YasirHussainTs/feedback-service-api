import 'package:flutter/material.dart';
import 'models/feedback.dart';
import 'services/feedback-service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Customer Feedback',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FeedbackScreen(),
    );
  }
}

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final FeedbackService feedbackService = FeedbackService();
  List<Feedback> feedbackList = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _commentsController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadFeedback();
  }

  void _loadFeedback() async {
    feedbackList = await feedbackService.getAllFeedback();
    setState(() {});
  }

  void _submitFeedback() async {
    Feedback feedback = Feedback(
      id: 0,
      customerName: _nameController.text,
      comments: _commentsController.text,
      rating: int.parse(_ratingController.text),
    );
    await feedbackService.addFeedback(feedback);
    _loadFeedback();
    _nameController.clear();
    _commentsController.clear();
    _ratingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Customer Feedback')),
      body: Column(
        children: [
          TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Name')),
          TextField(controller: _commentsController, decoration: InputDecoration(labelText: 'Comments')),
          TextField(controller: _ratingController, decoration: InputDecoration(labelText: 'Rating')),
          ElevatedButton(onPressed: _submitFeedback, child: Text('Submit')),
          Expanded(
            child: ListView.builder(
              itemCount: feedbackList.length,
              itemBuilder: (context, index) {
                Feedback feedback = feedbackList[index];
                return ListTile(
                  title: Text(feedback.customerName),
                  subtitle: Text("${feedback.comments} (Rating: ${feedback.rating})"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
