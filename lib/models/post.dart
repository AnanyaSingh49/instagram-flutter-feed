class Post {
  final String username;
  final List<String> images;
  bool liked;
  bool saved;

  Post({
    required this.username,
    required this.images,
    this.liked = false,
    this.saved = false,
  });
}