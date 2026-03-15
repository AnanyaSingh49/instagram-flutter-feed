import 'package:flutter/material.dart';
import '../models/post.dart';
import '../repositories/post_repository.dart';

class FeedProvider extends ChangeNotifier {
  final PostRepository repo = PostRepository();

  List<Post> posts = [];

  int page = 0;
  bool loading = false;

  FeedProvider() {
    loadPosts();
  }

  Future loadPosts() async {
    if (loading) return;

    loading = true;
    notifyListeners();

    List<Post> newPosts = await repo.fetchPosts(page);

    posts.addAll(newPosts);
    page++;

    loading = false;
    notifyListeners();
  }

  void toggleLike(Post post) {
    post.liked = !post.liked;
    notifyListeners();
  }

  void toggleSave(Post post) {
    post.saved = !post.saved;
    notifyListeners();
  }
}