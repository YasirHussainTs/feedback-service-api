class Feedback {
  final int id;
  final String customerName;
  final String comments;
  final int rating;

  Feedback({required this.id, required this.customerName, required this.comments, required this.rating});

  factory Feedback.fromJson(Map<String, dynamic> json) {
    return Feedback(
      id: json['id'],
      customerName: json['customerName'],
      comments: json['comments'],
      rating: json['rating'],
    );
  }

  Map<String, dynamic> toJson() => {
    'customerName': customerName,
    'comments': comments,
    'rating': rating,
  };
}
