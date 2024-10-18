import 'package:flutter/material.dart';

class FeedbackHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback System'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Settings button functionality (optional)
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40.0), // Space from top
            Text(
              'Welcome to the Feedback System',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            Text(
              'Share your valuable feedback or view previous feedback below:',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40.0),
            _buildFeedbackButton(
              context,
              icon: Icons.feedback,
              label: 'Submit Feedback',
              onPressed: () {
                Navigator.pushNamed(context, '/submitFeedback');
              },
            ),
            SizedBox(height: 20.0),
            _buildFeedbackButton(
              context,
              icon: Icons.history,
              label: 'View Feedback',
              onPressed: () {
                Navigator.pushNamed(context, '/viewFeedback');
              },
            ),
            Spacer(),
            Text(
              'Powered by Feedback System © 2024',
              style: TextStyle(color: Colors.black45),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeedbackButton(BuildContext context, {required IconData icon, required String label, required VoidCallback onPressed}) {
    return ElevatedButton.icon(
      icon: Icon(icon, size: 24.0),
      label: Text(label),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 40.0),
        primary: Color(0xFFEB1555), // Matching your theme color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}
