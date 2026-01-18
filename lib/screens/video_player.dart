// ignore_for_file: library_private_types_in_public_api, use_super_parameters

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
 
class VideoView extends StatefulWidget {
  const VideoView(this.videoID, {Key? key}) : super(key: key);
  final String videoID;
 
  @override
  _VideoViewState createState() => _VideoViewState();
}
 
class _VideoViewState extends State<VideoView> {
  late final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: widget.videoID,
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
      hideControls: false

    ),
  );
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: _controller,
          ),
          builder: (context, player) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                player,
                
              ],
            );
            
          }),
    );
  }
}