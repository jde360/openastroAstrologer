import 'package:flutter/material.dart';

import '../../../widgets/space.dart';
import '../widgets/comment_widget.dart';
import '../widgets/review_card.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        space(height: 15, width: 0),
        const ReviewCard(),
        const CommentWidget(),
      ],
    );
  }
}
