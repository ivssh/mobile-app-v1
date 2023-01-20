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

  static List<Post> posts = [
    const Post(
      id: '1',
      type: PostType.video,
      caption:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus dui dolor, pulvinar ut odio a, facilisis dignissim risus.',
      assetPath: 'assets/videos/video_1.mp4',
    ),
    const Post(
      id: '2',
      type: PostType.video,
      caption:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus dui dolor, pulvinar ut odio a, facilisis dignissim risus.',
      assetPath: 'assets/videos/video_2.mp4',
    ),
    const Post(
      id: '3',
      type: PostType.video,
      caption:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus dui dolor, pulvinar ut odio a, facilisis dignissim risus.',
      assetPath: 'assets/videos/video_3.mp4',
    ),
    const Post(
      id: '4',
      type: PostType.video,
      caption:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus dui dolor, pulvinar ut odio a, facilisis dignissim risus.',
      assetPath: 'assets/videos/video_4.mp4',
    ),
    const Post(
      id: '5',
      type: PostType.video,
      caption:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus dui dolor, pulvinar ut odio a, facilisis dignissim risus.',
      assetPath: 'assets/videos/video_5.mp4',
    ),
    const Post(
      id: '6',
      type: PostType.video,
      caption:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus dui dolor, pulvinar ut odio a, facilisis dignissim risus.',
      assetPath: 'assets/videos/video_6.mp4',
    ),
    const Post(
      id: '7',
      type: PostType.video,
      caption:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus dui dolor, pulvinar ut odio a, facilisis dignissim risus.',
      assetPath: 'assets/videos/video_7.mp4',
    ),
    const Post(
      id: '8',
      type: PostType.video,
      caption:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus dui dolor, pulvinar ut odio a, facilisis dignissim risus.',
      assetPath: 'assets/videos/video_8.mp4',
    ),
    const Post(
      id: '9',
      type: PostType.video,
      caption:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus dui dolor, pulvinar ut odio a, facilisis dignissim risus.',
      assetPath: 'assets/videos/video_9.mp4',
    ),
    const Post(
      id: '10',
      type: PostType.video,
      caption:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus dui dolor, pulvinar ut odio a, facilisis dignissim risus.',
      assetPath: 'assets/videos/video_10.mp4',
    ),
  ];
}
