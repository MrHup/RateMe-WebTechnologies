class Review {
  final String touser;
  final String fromuser;
  final String review;
  final double score;

  Review({
    this.touser,
    this.fromuser,
    this.review,
    this.score,
  });

  factory Review.fromJson(json) {
    return Review(
      touser: json['touser'] as String,
      fromuser: json['fromuser'] as String,
      review: json['review'] as String,
      score: json['score'] is String
          ? double.parse(json['score'])
          : (json['score'] is int
              ? double.parse(json['score'].toString())
              : json['score']),
    );
  }
}
