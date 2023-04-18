import 'package:flutter/material.dart';
import 'package:flutter_starter/shared/models/posts.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class CustomVideoPlayer extends StatefulWidget {
  final Post post;

  const CustomVideoPlayer({
    super.key,
    required this.post,
  });

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late VideoPlayerController controller;

  @override
  void initState() {
    controller = VideoPlayerController.asset(widget.post.assetPath);
    controller.initialize().then((_) {
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(controller.dataSource),
      onVisibilityChanged: (VisibilityInfo) {
        if (VisibilityInfo.visibleFraction > 0.5) {
          controller.play();
        } else {
          if (mounted) {
            controller.pause();
          }
        }
      },
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (controller.value.isPlaying) {
              controller.pause();
            } else {
              controller.play();
            }
          });
        },
        child: AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: Stack(
            children: [
              VideoPlayer(controller),
              const Positioned.fill(
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.transparent,
                  Colors.transparent,
                  Colors.black
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.2, 0.8, 1.0],
              )))),
              BuildVideoActions(controller: controller)
            ],
          ),
        ),
      ),
    );
  }
}

class BuildVideoActions extends StatelessWidget {
  const BuildVideoActions({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        height: controller.value.size.height,
        width: MediaQuery.of(context).size.width * 0.2,
        padding: const EdgeInsets.only(bottom: 20.0),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: const [
          VideoActionWidget(icon: Icons.favorite, value: '11.4k'),
          SizedBox(
            height: 10,
          ),
          VideoActionWidget(icon: Icons.comment, value: '30k'),
          SizedBox(
            height: 10,
          ),
          VideoActionWidget(icon: Icons.forward_10_rounded, value: '20.3k'),
        ]),
      ),
    );
  }
}

class VideoActionWidget extends StatelessWidget {
  const VideoActionWidget({Key? key, required this.icon, required this.value})
      : super(key: key);

  final IconData icon;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: Ink(
            decoration: const ShapeDecoration(
                shape: CircleBorder(), color: Colors.black),
            child: IconButton(
                onPressed: () {}, color: Colors.white, icon: Icon(icon)),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
