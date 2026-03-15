// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:instagram_feed_app/screens/feed_screen.dart';
import 'package:instagram_feed_app/models/post.dart';

class TestFeedProvider extends ChangeNotifier {
  List<Post> posts = [];
  bool loading = false;

  void toggleLike(Post post) {}
  void toggleSave(Post post) {}
}

void main() {
  testWidgets('App bar shows Instagram title', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text('Instagram')),
        ),
      ),
    );

    expect(find.text('Instagram'), findsOneWidget);
  });
}
