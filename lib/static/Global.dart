import 'package:rate_me/static/User.dart';

import 'Review.dart';

class Global {
  static String imageBase64 = "nothing_yet";
  static String imagePath = "lib/assets/userAvatarTest.png";

  static int selectedIndex = 2;

  static User currentUser;
  static List<User> users = [];
  static List<User> searchedUsers = [];
  static User viewedUser;
  static List<Review> reviews = [];
}
