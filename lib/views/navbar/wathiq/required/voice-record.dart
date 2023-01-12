// import 'dart:html';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart' as pre;
import 'package:permission_handler/permission_handler.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:wathiq/widgets/text.dart';

class VoiceRecord extends StatefulWidget {
  VoiceRecord({super.key});

  @override
  State<VoiceRecord> createState() => _VoiceRecordState();
}

class _VoiceRecordState extends State<VoiceRecord> {
  FlutterSoundRecorder recorder = FlutterSoundRecorder();
  bool isRecorderReady = false;
  late final audioFile;

  final audioPlayer = pre.AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  initState() {
    super.initState();
    initRecorder();
    // setAudio();
    //
    audioPlayer.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying = event == pre.PlayerState.PLAYING;
      });
    });

    audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        duration = event;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });
  }

  // Future setAudio() async {
  //   audioPlayer.play(audioFile.path, isLocal: true);
  // }

  @override
  void dispose() {
    recorder.closeRecorder();
    super.dispose();
  }

  Future initRecorder() async {
    final status = await Permission.microphone.request();
    // final status = await Permission.microphone.request();

    if (status != PermissionStatus.granted) {
      throw "mic premetion not granted";
    }
    await recorder.openRecorder();
    isRecorderReady = true;
    recorder.setSubscriptionDuration(
      const Duration(milliseconds: 500),
    );
  }

  Future record() async {
    if (!isRecorderReady) return;
    await recorder.startRecorder(toFile: 'audio');
  }

  Future stop() async {
    if (!isRecorderReady) return;

    final path = await recorder.stopRecorder();
    audioFile = File(path!);
    print('Recorded audio: ${audioFile}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              StreamBuilder<RecordingDisposition>(
                stream: recorder.onProgress,
                builder: (context, snapshot) {
                  final duration = snapshot.hasData
                      ? snapshot.data!.duration
                      : Duration.zero;
                  return TextWidget(data: "${duration.inSeconds} s");
                },
              ),
              ElevatedButton(
                child: Icon(
                  recorder.isRecording ? Icons.stop : Icons.mic,
                  size: 80,
                ),
                onPressed: () async {
                  if (recorder.isRecording) {
                    await stop();
                  } else {
                    await record();
                  }
                  setState(() {});
                },
              ),
              ElevatedButton(
                child: Text("AWDAWD"),
                onPressed: () {},
              ),
              Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                onChanged: (value) async {
                  final position = Duration(seconds: value.toInt());
                  await audioPlayer.seek(position);

                  //optinal
                  await audioPlayer.resume();
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(data: position.toString()),
                  TextWidget(data: (duration - position).toString()),
                ],
              ),
              CircleAvatar(
                radius: 35,
                child: IconButton(
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                  iconSize: 50,
                  onPressed: () async {
                    if (isPlaying) {
                      await audioPlayer.pause();
                    } else {
                      await audioPlayer.play(audioFile.path, isLocal: true);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
