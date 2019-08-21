import 'package:flutter/material.dart';
import 'package:fluttery_audio/fluttery_audio.dart';

class AudioVisualizerWidget extends StatefulWidget {
  final Function(BuildContext context, double decibel) builder;

  AudioVisualizerWidget({
    this.builder,
  });

  @override
  _AudioVisualizerWidgetState createState() => _AudioVisualizerWidgetState();
}

class _AudioVisualizerWidgetState extends State<AudioVisualizerWidget> {
  AudioVisualizer audioVisualizer;
  double _decibel = 0;

  @override
  void initState() {
    super.initState();

    audioVisualizer = FlutteryAudio.audioVisualizer()
      ..activate()
      ..addListener(decibelCallback: _onDecibelUpdate);
  }

  @override
  void dispose() {
    audioVisualizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _decibel);
  }

  void _onDecibelUpdate(double decibel) {
    setState(() {
      print(decibel);
      _decibel = decibel;
    });
  }
}
