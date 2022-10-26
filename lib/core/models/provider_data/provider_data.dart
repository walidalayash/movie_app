import 'package:flutter/material.dart';

class ProviderData with ChangeNotifier {
  List<Comment> comments = [
    Comment(
      name: 'Ali',
      rating: 3,
      comment: 'Nice Movie',
    ),
    Comment(
      name: 'Hossam',
      rating: 1,
      comment: 'I do not like it',
    ),
    Comment(
      name: 'Walid',
      rating: 5,
      comment: 'Amazing movie, I like it',
    ),
    Comment(
      name: 'taha',
      rating: 2,
      comment: 'no comment',
    ),
  ];
  double ratingCommentNow = 0;
}

class Comment {
  // final String pic;
  final String name;
  final double rating;
  final String comment;
  Comment({
    //required this.pic,
    required this.name,
    required this.rating,
    required this.comment,
  });
}
