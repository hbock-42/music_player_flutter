import 'package:flutter/material.dart';
import 'package:fluttery_audio/fluttery_audio.dart';

class AudioVisualizerWidget extends StatefulWidget {
  final Function(BuildContext context, List<double> fft) builder;

  AudioVisualizerWidget({
    this.builder,
  });

  @override
  _AudioVisualizerWidgetState createState() => _AudioVisualizerWidgetState();
}

class _AudioVisualizerWidgetState extends State<AudioVisualizerWidget> {
  AudioVisualizer audioVisualizer;
  List<double> decibelSamples = const [];

  @override
  void initState() {
    super.initState();

    audioVisualizer = FlutteryAudio.audioVisualizer()
      ..activate()
      ..addListener(fftCallback: _onFftUpdate);

//    audioVisualizer = FlutteryAudio.audioVisualizer()
//      ..activate()
//      ..addListener(
//          fftCallback: (List<double> samples) {
//            setState(() => decibelSamples = samples);
//          }
//      );
  }

  @override
  void dispose() {
    audioVisualizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, decibelSamples);
  }

  void _onFftUpdate(List<double> fftSamples) {
    setState(() {
      print('hello');
      decibelSamples = fftSamples;
    });
  }
}
