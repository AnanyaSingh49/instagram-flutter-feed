import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../models/post.dart';
import '../providers/feed_provider.dart';
import 'pinch_zoom_overlay.dart'; // NEW: Import overlay

class PostWidget extends StatefulWidget {
  final Post post;

  const PostWidget({super.key, required this.post});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final provider = context.read<FeedProvider>();
    final post = widget.post;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// USER HEADER
        ListTile(
          leading: const CircleAvatar(
            backgroundImage: NetworkImage("https://i.pravatar.cc/150"),
          ),
          title: Text(
            post.username,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: const Icon(Icons.more_vert),
        ),

        /// IMAGE CAROUSEL WITH PINCH-TO-ZOOM OVERLAY
        SizedBox(
          height: 320,
          child: PageView.builder(
            itemCount: post.images.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return PinchZoomOverlay(imageUrl: post.images[index]);
            },
          ),
        ),

        /// DOT INDICATOR
        if (post.images.length > 1)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                post.images.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentPage == index
                        ? Colors.blue
                        : Colors.grey.shade400,
                  ),
                ),
              ),
            ),
          ),

        /// ACTION BUTTONS
        Row(
          children: [
            IconButton(
              icon: Icon(
                post.liked ? Icons.favorite : Icons.favorite_border,
                color: post.liked ? Colors.red : Colors.black,
              ),
              onPressed: () => provider.toggleLike(post),
            ),
            IconButton(
              icon: const Icon(Icons.comment_outlined),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Comments coming soon"),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Share feature coming soon"),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),
            const Spacer(),
            IconButton(
              icon: Icon(
                post.saved ? Icons.bookmark : Icons.bookmark_border,
              ),
              onPressed: () => provider.toggleSave(post),
            ),
          ],
        ),

        /// LIKES TEXT
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            post.liked
                ? "Liked by you and others"
                : "Liked by 120 people",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        /// CAPTION
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text("${post.username}  Beautiful day 🌅"),
        ),

        const SizedBox(height: 20)
      ],
    );
  }
}