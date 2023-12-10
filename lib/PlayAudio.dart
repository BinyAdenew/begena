// ignore: file_names
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

final audioPlayer = AudioPlayer();
bool isPlaying = false;
Duration duration = Duration.zero;
Duration position = Duration.zero;
IconData playpause = Icons.play_arrow;
double currentvalue = 0.7;

Widget slider() {
  return Slider.adaptive(
      activeColor: Colors.grey[600],
      inactiveColor: Colors.brown,
      max: duration.inSeconds.toDouble(),
      min: 0,
      value: position.inSeconds.toDouble(),
      onChanged: (value) async {
        final position = Duration(seconds: value.toInt());
        await audioPlayer.seek(position);

        await audioPlayer.resume();
      });
}

Future setAudio() async {
  final file = File('');
  audioPlayer.setSourceUrl(file.path);
  audioPlayer.setSourceUrl(file.path);
 // audioPlayer.setUrl(file.path, isLocal: true);
}

@override
void dispose() {
  if (isPlaying) {
    audioPlayer.stop();
  }
  audioPlayer.dispose();
}

String formatTime(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final hours = twoDigits(duration.inHours);
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));
  return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
}

String _getDateFromFilePatah({required String filePath}) {
  String fromEpoch = filePath.substring(
      filePath.lastIndexOf('/') + 1, filePath.lastIndexOf('.'));

  DateTime recordedDate =
      DateTime.fromMillisecondsSinceEpoch(int.parse(fromEpoch));
  int year = recordedDate.year;
  int month = recordedDate.month;
  int day = recordedDate.day;

  return ('$year-$month-$day');
}

void start() {
  audioPlayer.onPlayerStateChanged.listen((state) {
    isPlaying = state == PlayerState.playing;
  });
  audioPlayer.onDurationChanged.listen((newDuration) {
    duration = newDuration;
  });
  audioPlayer.onPositionChanged.listen((newPosition) {
    position = newPosition;
  });
}

Widget showCustomDialog(BuildContext context, int index, List<String> records) {
  return StatefulBuilder(builder: (context, StateSetter setState) {
    audioPlayer.onPositionChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
    // ignore: unnecessary_new

    return AlertDialog(
      // borderRadius: new BorderRadius.all(new Radius.circular(32.0)),
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,

      content: Builder(
        builder: (context) {
          return SizedBox(
            width: 450,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: Colors.transparent,
                  height: 180,
                  width: 450,
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    body: DecoratedBox(
                      position: DecorationPosition.background,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/background/13.png"),
                            fit: BoxFit.fitHeight),
                        borderRadius: BorderRadius.all(Radius.circular(0.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Column(
                          //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 15, 0, 0),
                              child: DefaultTextStyle(
                                  style:  TextStyle(
                                    fontSize: 23,
                                    color: Colors.brown.shade900,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Dire_Dawa',
                                  ),
                                  child: Text(
                                      'New recoding ${records.length - index}')),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
                              child: DefaultTextStyle(
                                style: TextStyle(
                                    fontSize: 14, color: Colors.brown.shade900),
                                child: Text(_getDateFromFilePatah(
                                    filePath: records.elementAt(index))),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  DefaultTextStyle(
                                      style:  TextStyle(
                                          fontSize: 14, color: Colors.brown.shade900),
                                      child: Text(formatTime(position))),
                                  DefaultTextStyle(
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.brown.shade900),
                                      child: Text(
                                          formatTime(duration - position))),
                                ],
                              ),
                            ),
                            slider(),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      icon: const Icon(
                                          Icons.rotate_90_degrees_ccw_outlined),
                                      onPressed: () {
                                        position = position -
                                            const Duration(seconds: 3);
                                      }),
                                  IconButton(
                                      icon: Icon(isPlaying
                                          ? Icons.pause
                                          : Icons.play_arrow),
                                      onPressed: () {
                                        if (isPlaying == false) {
                                          setState(() {
                                            playpause = Icons.pause;
                                            isPlaying = true;
                                          });

                                          //  widget.records.removeAt(widget.index);
                                          audioPlayer
                                              .play(records.elementAt(index) as Source);
                                        } else {
                                          playpause = Icons.play_arrow;
                                          isPlaying = false;
                                          audioPlayer.pause();
                                        }
                                      }),
                                  IconButton(
                                      icon: const Icon(
                                          Icons.rotate_90_degrees_cw),
                                      onPressed: () {
                                        position = position +
                                            const Duration(seconds: 3);
                                      }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                  child: Container(
                    height: 70,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/background/14.png"),
                          fit: BoxFit.cover),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              trackHeight: 2.0,
                              trackShape: RoundedRectSliderTrackShape(),
                              overlayShape: const RoundSliderOverlayShape(
                                  overlayRadius: 5.0),
                            ),
                            child: Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/background/button.png"),
                                    fit: BoxFit.fill),
                              ),
                              width: 200,
                              height: 30,
                              child: Center(
                                child: Row(
                                  children: [
                                    const Icon(
                                      // <-- Icon
                                      Icons.volume_down_sharp,
                                      size: 25.0,
                                    ),
                                    Slider(
                                        value: currentvalue,
                                        activeColor: const Color.fromARGB(
                                            255, 199, 54, 69),
                                        min: 0.0,
                                        max: 1.0,
                                        onChanged: (value) {
                                          setState(() {
                                            currentvalue = value;
                                            audioPlayer.setVolume(currentvalue);
                                          });
                                        }),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 1, 0),
                              child: Container(
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage("assets/background/button.png"),
                                      fit: BoxFit.fill),
                                ),
                                width: 100,
                                height: 30,
                                child: Center(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                    child: Row(
                                      children: const [
                                        Icon(
                                          // <-- Icon
                                          Icons.restore_from_trash,
                                          size: 26.0,
                                          color: Colors.red,
                                        ),
                                        DefaultTextStyle(
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.red,
                                            fontFamily: 'Dire_Dawa',
                                          ),
                                          textAlign: TextAlign.center,
                                          child: Text('Delete'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            onTap: () async {
                              Navigator.pop(context); //pop dialog
                              try {
                                final file = File(records.elementAt(index));
                                await file.delete();
                                // widget.records.length = widget.records.length - 1;
                                // ignore: use_build_context_synchronously
                                Navigator.pop(context); //pop dialog
                              } catch (e) {
                                print(e);
                              }
                            })
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  });
}
