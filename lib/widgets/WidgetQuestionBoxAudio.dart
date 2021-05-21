import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:edutainment/utils/theme_constants.dart';

class WidgetQuestionBoxAudio extends StatelessWidget {
  final String audioPath; //local audio

  WidgetQuestionBoxAudio({@required this.audioPath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  final player = AudioCache();
                  player.play(audioPath);
                },
                child: Icon(Icons.play_circle_outline, size: 50.0,color: kYellowColor, ),
              ),
              Text(
                "Quel est cet animal?",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
