import 'package:zoom_pinch_overlay/zoom_pinch_overlay.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/feed_provider.dart';
import 'screens/feed_screen.dart';

void main() {
  runApp(const InstagramClone());
}

class InstagramClone extends StatelessWidget {
  const InstagramClone({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FeedProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FeedScreen(),
      ),
    );
  }
}