// ignore: file_names
import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';
import 'package:flutter_audio_recorder2/flutter_audio_recorder2.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_audio_recorder3/flutter_audio_recorder3.dart';

class Recorder extends StatefulWidget {
  final Function onSaved;
  const Recorder({Key? key, required this.onSaved}) : super(key: key);

  @override
  State<Recorder> createState() => _RecorderState();
}

enum RecordingState {
  // ignore: constant_identifier_names
  UnSet,
  // ignore: constant_identifier_names
  Set,
  // ignore: constant_identifier_names
  Recording,
  // ignore: constant_identifier_names
  Stopped,
}

class _RecorderState extends State<Recorder> {
  IconData _recordIcon = Icons.circle;
  RecordingState _recordingState = RecordingState.UnSet;
  double x = 90; // width
  double y = 50; // height
  // Recorder properties
  late FlutterAudioRecorder2 audioRecorder;
  //late FlutterAudioRecorder3 audioRecorder;

  @override
  void initState() {
    super.initState();

   // FlutterAudioRecorder3.hasPermissions.then((hasPermision){
   FlutterAudioRecorder2.hasPermissions.then((hasPermision) {
      //  FlutterSound.hasPermissions.then((hasPermision) {
      if (hasPermision!) {
        _recordingState = RecordingState.Set;
        _recordIcon = Icons.circle;
      }
    });
  }

  @override
  void dispose() {
    if (_recordingState == RecordingState.Recording){
         _stopRecording();
        _recordingState = RecordingState.Stopped;
        _recordIcon = Icons.circle;
    }

    _recordingState = RecordingState.UnSet;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    x = MediaQuery.of(context).size.width * 0.23;
    y = MediaQuery.of(context).size.height * 0.08;
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
      child: GestureDetector(
        onTap: () async {
          await _onRecordButtonPressed();
          setState(() {});
        },
        child: Container(
          width: x,
          height: y,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            image: DecorationImage(
                image: AssetImage("assets/background/button.png"), fit: BoxFit.fill),
          ),
          child: Center(
            child: Icon(
              _recordIcon,
              color: Colors.red,
              size: 27,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onRecordButtonPressed() async {
    switch (_recordingState) {
      case RecordingState.Set:
        await _recordVoice();
        break;

      case RecordingState.Recording:
        await _stopRecording();
        _recordingState = RecordingState.Stopped;
        _recordIcon = Icons.circle;
        break;

      case RecordingState.Stopped:
        await _recordVoice();
        break;

      case RecordingState.UnSet:
        ScaffoldMessenger.of(context).hideCurrentSnackBar();

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Please allow recording from settings.'),
        ));
        break;
    }
  }

  _initRecorder() async {
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String filePath = '${appDirectory.path}/${DateTime.now().millisecondsSinceEpoch}.aac';

    audioRecorder =
     // FlutterAudioRecorder3(filePath, audioFormat: AudioFormat.AAC);
    FlutterAudioRecorder2(filePath, audioFormat: AudioFormat.AAC);
    await audioRecorder.initialized;
  }

  _startRecording() async {
    await audioRecorder.start();
    // await audioRecorder.current(channel: 0);
  }

  _stopRecording() async {
    await audioRecorder.stop();

    widget.onSaved();
  }

  Future<void> _recordVoice() async {
    final hasPermission = await FlutterAudioRecorder2.hasPermissions;
 //   final hasPermission = await FlutterAudioRecorder2.hasPermissions;
    if (hasPermission ?? false) {
      await _initRecorder();

      await _startRecording();
      _recordingState = RecordingState.Recording;
      _recordIcon = Icons.stop;
    } else {

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please allow recording from settings.'),

      ));
    }
  }
}
