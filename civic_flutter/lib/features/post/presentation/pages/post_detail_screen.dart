import 'package:civic_flutter/features/feed/presentation/routes/feed_routes.dart';
import 'package:flutter/material.dart';

class PostDetailScreen extends StatelessWidget {
  const PostDetailScreen({
    super.key,
    required this.id,
  });

  final int id;

  static String route([int? id]) =>
      '${FeedRoutes.namespace}/post/${id ?? ':id'}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'Post details scrren of id $id',
      )),
    );
  }
}
