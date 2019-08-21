import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:fluttery_audio/fluttery_audio.dart';
import 'package:music_player/AudioVisualizer/AudioVisualizerWidget.dart';
import 'package:permission/permission.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> implements AudioPlayerListener {
  AudioPlayer audioPlayer;
  bool recordAudioPermissionGranted = false;

  @override
  void initState() {
    audioPlayer = FlutteryAudio.audioPlayer();
    audioPlayer.addListener(this);

    // Todo: somewhere else
    var soundPath =   "https://api.soundcloud.com/tracks/266891990/stream?secret_token=s-tj3IS&client_id=LBCcHmRB8XSStWL6wKH2HPACspQlXg2P";
//    var soundPath = "assets/sounds/joergmueller-black ice (original).wav";
    _setAudioUrl(soundPath);

    _requestPermissions();

    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.removeListener(this);
    audioPlayer.dispose();
    super.dispose();
  }

  void _setAudioUrl(String url) {
    audioPlayer.loadMedia(Uri.parse(url));
  }

  void _requestPermissions() async {
    List<Permissions> permissions =
        await Permission.requestPermissions([PermissionName.Microphone]);

    for (var permission in permissions) {
      if (permission.permissionName == PermissionName.Microphone) {
        if (permission.permissionStatus == PermissionStatus.allow) {
          setState(() {
            recordAudioPermissionGranted = true;
          });
        } else {
          var permissionStatus = permission.permissionStatus;
          throw new Exception(
              "Recording permission not allowed: status = $permissionStatus");
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: <Widget>[
            Text(
              "Hello",
              style: Theme.of(context).textTheme.display2,
            ),
            GestureDetector(
                onTap: () {
                  audioPlayer.play();
                },
                child: Container(
                  width: 60,
                  height: 60,
                  color: Theme.of(context).primaryColor,
                )),
            if (recordAudioPermissionGranted) AudioVisualizerWidget(
              builder: (BuildContext context, double decibel) {
                double newHeight = -(math.max(-100.0, math.min(decibel, 0.0)));
                return Container(width: 60, height: newHeight, color: Theme.of(context).primaryColorLight,);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Audio Listeners
  @override
  onAudioLengthChanged(Duration length) {
    // TODO: implement onAudioLengthChanged
    return null;
  }

  @override
  onAudioLoading() {
    // TODO: implement onAudioLoading
    return null;
  }

  @override
  onAudioReady() {
    // TODO: implement onAudioReady
    return null;
  }

  @override
  onAudioStateChanged(AudioPlayerState audioState) {
    // TODO: implement onAudioStateChanged
    return null;
  }

  @override
  onBufferingUpdate(int percent) {
    // TODO: implement onBufferingUpdate
    return null;
  }

  @override
  onPlayerCompleted() {
    // TODO: implement onPlayerCompleted
    return null;
  }

  @override
  onPlayerPaused() {
    // TODO: implement onPlayerPaused
    return null;
  }

  @override
  onPlayerPlaying() {
    // TODO: implement onPlayerPlaying
    return null;
  }

  @override
  onPlayerPositionChanged(Duration position) {
    // TODO: implement onPlayerPositionChanged
    return null;
  }

  @override
  onPlayerStopped() {
    // TODO: implement onPlayerStopped
    return null;
  }

  @override
  onSeekCompleted() {
    // TODO: implement onSeekCompleted
    return null;
  }

  @override
  onSeekStarted() {
    // TODO: implement onSeekStarted
    return null;
  }
}
