class User {
  final String username;
  final String firstname;
  final String lastname;
  final String address;
  final double score;
  final int reviewcount;
  final String profileImg;

  User(
      {this.username,
      this.firstname,
      this.lastname,
      this.address,
      this.score,
      this.reviewcount,
      this.profileImg});

  factory User.fromJson(json) {
    return User(
      username: json['username'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      address: json['address'],
      score: json['score'] is String
          ? double.parse(json['score'])
          : (json['score'] is int
              ? double.parse(json['score'].toString())
              : json['score']),
      reviewcount: json['reviewcount'] is String
          ? int.parse(json['reviewcount'])
          : json['reviewcount'],
      profileImg: json['profileImg'],
    );
  }
}
