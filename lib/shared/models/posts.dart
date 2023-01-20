enum PostType { image, video, audio }

class Post {
  final String id;
  final PostType type;
  final String caption;
  final String assetPath;

  const Post({
    required this.id,
    required this.type,
    required this.caption,
    required this.assetPath,
  });
}
