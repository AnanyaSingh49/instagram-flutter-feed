import '../models/post.dart';

class PostRepository {

  Future<List<Post>> fetchPosts(int page) async {

    await Future.delayed(const Duration(milliseconds: 1500));

    List<String> users = [
      "alex",
      "emma",
      "john",
      "sophia",
      "david",
      "olivia",
      "michael"
    ];

    return List.generate(10, (i) {

      int id = page * 10 + i;

      return Post(
        username: users[id % users.length],
        images: [
          "https://picsum.photos/500/400?random=$id",
          "https://picsum.photos/500/400?random=${id + 1}",
          "https://picsum.photos/500/400?random=${id + 2}",
        ],
      );

    });

  }

}