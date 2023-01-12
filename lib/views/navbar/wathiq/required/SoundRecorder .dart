import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:permission_handler/permission_handler.dart';

class SoundRecorder {
  // Declare FlutterSoundRecorder
  FlutterSoundRecorder? audioRecorder;
  // Set recorder initislised is false
  bool _isRecorderInitialised = false;
  // isRecording => get status of recorder (whether is recording)
  bool get isRecording => audioRecorder!.isRecording;

  // initialize recorder
  Future init() async {
    // Get FlutterSoundRecorder
    audioRecorder = FlutterSoundRecorder();
    // Get the permission status of microphone
    final status = await Permission.microphone.request();
    // If permission is deny => throw exception
    if (status != PermissionStatus.granted) {
      throw RecordingPermissionException('Micorphone permission denied');
    }
    // Open audiosession
    await audioRecorder!.openRecorder();
    // set recorder initislised is true
    _isRecorderInitialised = true;
  }

  // release recorder
  void dispose() {
    // if Recorder isn't initialised => return
    if (!_isRecorderInitialised) return;
    // close audiosession
    audioRecorder!.closeRecorder();
    // set audiorecorder is null
    audioRecorder = null;
    // set recorder initislised is true
    _isRecorderInitialised = false;
  }

  // start recorder
  Future _record(path) async {
    // if Recorder isn't initialised
    if (!_isRecorderInitialised) return;
    print('********* record outputpath : $path');
    // start recorder
    await audioRecorder!.startRecorder(toFile: path);
  }

  // stop recorder
  Future _stop() async {
    // if Recorder isn't initialised => return
    if (!_isRecorderInitialised) return;
    // stop recorder
    await audioRecorder!.stopRecorder();
  }

  // Control the start or end of the recorder
  // require parameter path and language of recognition
  Future toggleRecording(path) async {
    // if recorder is stop
    if (audioRecorder!.isStopped) {
      // start recorder
      await _record(path);
    } else {
      // else stop recorder
      await _stop();
    }
  }
}
