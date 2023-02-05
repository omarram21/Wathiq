// import 'dart:html';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart' as pre;
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:flutter/material.dart';

import 'package:flutter_sound/flutter_sound.dart';
import 'package:wathiq/constans.dart';
import 'package:wathiq/controllers/required-details-controller.dart';
import 'package:wathiq/views/navbar/wathiq/required/required-details.dart';
import 'package:wathiq/widgets/button.dart';
import 'package:wathiq/widgets/text.dart';

class VoiceRecord extends StatefulWidget {
  VoiceRecord({super.key});

  @override
  State<VoiceRecord> createState() => _VoiceRecordState();
}

class _VoiceRecordState extends State<VoiceRecord> {
  FlutterSoundRecorder recorder = FlutterSoundRecorder();
  bool isRecorderReady = false;
  File? audioFile;

  final audioPlayer = pre.AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  RequiredDetailsController requiredDetailsController =
      Get.find<RequiredDetailsController>();

  @override
  initState() {
    super.initState();
    initRecorder();

    audioPlayer.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying = event == pre.PlayerState.PLAYING;
      });
    });
    audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        duration = event;
        requiredDetailsController.audioDuration.value = formatTime(duration);
      });
    });
    audioPlayer.onAudioPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });
  }

  @override
  void dispose() {
    recorder.closeRecorder();
    super.dispose();
  }

  Future initRecorder() async {
    final status = await Permission.microphone.request();

    if (status != PermissionStatus.granted) {
      throw "mic premetion not granted";
    }
    await recorder.openRecorder();
    isRecorderReady = true;
    recorder.setSubscriptionDuration(
      const Duration(milliseconds: 1),
    );
  }

  Future record() async {
    if (!isRecorderReady) return;
    await recorder.startRecorder(toFile: 'audio');
  }

  Future stop() async {
    if (!isRecorderReady) return;

    String? path = await recorder.stopRecorder();

    print("ok");
    audioFile = File(path!);
    requiredDetailsController.audio = File(path!);
    requiredDetailsController.audioDuration.value = formatTime(duration);
    print("ok2");
    requiredDetailsController.okay = true;
    // print(okay);
    print(audioFile);
    print(requiredDetailsController.audio);
    print(requiredDetailsController.audioDuration.value);
    print('Recorded audio: $audioFile');

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(data: "Record", bold: true),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextWidget(
                data: 'Record how the accident Happen in details',
                bold: true,
                size: 20,
              ),
              !requiredDetailsController.okay
                  ? Column(
                      children: [
                        SizedBox(height: 50),
                        StreamBuilder<RecordingDisposition>(
                          stream: recorder.onProgress,
                          builder: (context, snapshot) {
                            final duration1 = snapshot.hasData
                                ? snapshot.data!.duration
                                : Duration.zero;
                            // return TextWidget(data: "${duration1.inSeconds} s");
                            String twoDigits(int n) =>
                                n.toString().padLeft(2, '0');
                            final twoDigitsMinutes =
                                twoDigits(duration1.inMinutes.remainder(60));
                            final twoDigitsSecond =
                                twoDigits(duration1.inSeconds.remainder(60));
                            return TextWidget(
                              data: '$twoDigitsMinutes:$twoDigitsSecond',
                              bold: true,
                              size: 50,
                            );
                            ;
                          },
                        ),
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            color: AppColors.BLUE,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(
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
                        ),
                      ],
                    )
                  : Column(
                      children: [
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
                          activeColor: AppColors.BLUE,
                          inactiveColor: AppColors.GRAY,
                          thumbColor: AppColors.BLUE,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(data: formatTime(position)),
                            TextWidget(data: formatTime(duration)),
                          ],
                        ),
                        CircleAvatar(
                          radius: 35,
                          child: IconButton(
                            icon: Icon(
                                isPlaying ? Icons.pause : Icons.play_arrow),
                            iconSize: 50,
                            onPressed: () async {
                              if (isPlaying) {
                                await audioPlayer.pause();
                              } else {
                                await audioPlayer.play(
                                    requiredDetailsController.audio!.path);
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 30),
                        Row(
                          children: [
                            Expanded(
                              child: ButtonWidget(
                                text: "Reset",
                                color: AppColors.BLUE,
                                onPressed: () {
                                  requiredDetailsController
                                      .audioDuration.value = '';
                                  audioFile = null;
                                  requiredDetailsController.audio = null;
                                  requiredDetailsController.okay = false;
                                  duration = Duration.zero;
                                  position = Duration.zero;
                                  // print(okay);
                                  print(audioFile);
                                  print(requiredDetailsController.audio);
                                  print(requiredDetailsController
                                      .audioDuration.value);
                                  setState(() {});
                                },
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: ButtonWidget(
                                text: "Confirm",
                                color: Colors.green,
                                onPressed: () {
                                  // print(okay);
                                  print(audioFile);
                                  print(requiredDetailsController.audio);
                                  print(requiredDetailsController
                                      .audioDuration.value);
                                  if (!requiredDetailsController.okay) {
                                    Get.snackbar('Error',
                                        'pleas recorded your voice to Continue');
                                  } else {
                                    dispose();
                                    Get.back();
                                  }
                                },
                              ),
                            )
                          ],
                        )
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final mins = twoDigits(duration.inMinutes.remainder(60));
    final sec = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      mins,
      sec,
    ].join(':');
  }
}
