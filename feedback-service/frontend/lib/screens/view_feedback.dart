import 'package:flutter/material.dart';
import '../services/feedback_service.dart';

class ViewFeedbackPage extends StatefulWidget {
  @override
  _ViewFeedbackPageState createState() => _ViewFeedbackPageState();
}

class _ViewFeedbackPageState extends State<ViewFeedbackPage> {
  final FeedbackService _feedbackService = FeedbackService();
  late Future<List<String>> _feedbackList;

  @override
  void initState() {
    super.initState();
    _feedbackList = _feedbackService.getAllFeedback();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Feedback'),
      ),
      body: FutureBuilder<List<String>>(
        future: _feedbackList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error fetching feedback.'));
          } else if (snapshot.hasData && snapshot.data!.isEmpty) {
            return Center(child: Text('No feedback found.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index]),
                );
              },
            );
          }
        },
      ),
    );
  }
}
