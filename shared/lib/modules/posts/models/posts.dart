enum PostType { image, video, audio }

class Post {
  final String id;
  final PostType type;
  final String caption;
  final String assetPath;

  const Post({
    this.id,
    this.type,
    this.caption,
    this.assetPath,
  });
}
