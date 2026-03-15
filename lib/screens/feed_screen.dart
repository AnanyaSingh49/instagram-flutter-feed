import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/feed_provider.dart';
import '../widgets/post_widget.dart';
import '../widgets/story_widget.dart';
import '../widgets/shimmer_post.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      final provider = context.read<FeedProvider>();

      if (controller.position.pixels >
          controller.position.maxScrollExtent - 500) {
        provider.loadPosts();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final feed = context.watch<FeedProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Instagram",
            style: TextStyle(fontWeight: FontWeight.bold)),
        actions: const [
          Icon(Icons.favorite_border),
          SizedBox(width: 15),
          Icon(Icons.send),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
           StoryWidget(),

          Expanded(
            child: ListView.builder(
              controller: controller,
              itemCount: feed.posts.length + (feed.loading ? 3 : 0),
              itemBuilder: (context, i) {
                if (i >= feed.posts.length) {
                  return const ShimmerPost();
                }

                return PostWidget(post: feed.posts[i]);
              },
            ),
          )
        ],
      ),
    );
  }
}