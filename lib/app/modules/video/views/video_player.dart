import 'package:study/app/common/service/iconFonts.dart';
import 'package:study/app/common/service/screenUtils.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class VideoPlayerItem extends StatefulWidget {
  final String videoUrl;
  final String thumb;

  const VideoPlayerItem(
      {super.key, required this.videoUrl, required this.thumb});

  @override
  State<VideoPlayerItem> createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem>
    with SingleTickerProviderStateMixin {
  late VideoPlayerController _videoPlayerController; // 视频播放控制器
  late Future _videoPlayerDataFuture; // 视频播放器初始化数据
  late AnimationController _animationController; // 动画控制器
  bool _isPlaying = true; // 是否正在播放

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    _videoPlayerController.setLooping(true);
    _videoPlayerDataFuture = _videoPlayerController.initialize().then((_) {
      // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      _videoPlayerController.play();
    });

    _animationController = AnimationController(
        vsync: this, duration: const Duration(microseconds: 300));
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Colors.black,
      child: _video(),
    );
  }


  Widget _pauseButton() {
    return Center(
      child: ScaleTransition(
        scale: _animationController,
        child: Icon(IconFonts.play,
            color: Colors.white.withOpacity(0.8),
            size: ScreenUtils.width(60)),
      ),
    );
  }

  Widget _backgroundImage() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image.network(widget.thumb),
    );
  }

  Widget _video() {
    return FutureBuilder(
        future: _videoPlayerDataFuture,
        builder: (context, value) {
          if (value.connectionState == ConnectionState.done) {
            return InkWell(
              onTap: () {
                if (_videoPlayerController.value.isInitialized) {
                  if (_videoPlayerController.value.isPlaying) {
                    _videoPlayerController.pause();
                    setState(() {
                      _animationController.forward();
                      _isPlaying = false;
                    });
                  } else {
                    _videoPlayerController.play();
                    setState(() {
                      _animationController.reverse();
                      if(_animationController.value == 0.0){
                        _isPlaying = true;
                      }
                    });
                  }
                } else {
                  _videoPlayerDataFuture =
                      _videoPlayerController.initialize().then((_) {
                    _videoPlayerController.play();
                  });
                }
              },
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: AspectRatio(
                      aspectRatio: _videoPlayerController.value.aspectRatio,
                      child: VideoPlayer(_videoPlayerController),
                    ),
                  ),
                  _isPlaying ? const Text("") : _pauseButton(),
                ],
              ),
            );
          } else {
            return Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  LinearProgressIndicator(
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                    minHeight: 1.0,
                  ),
                  _backgroundImage(),
                ],
              ),
            );
          }
        });
  }
}
