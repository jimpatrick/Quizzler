import 'package:flutter/material.dart';

class StoryButton extends StatelessWidget {
  const StoryButton({
    Key? key,
    required this.colour,
    required this.text,
    this.callBackData,
  }) : super(key: key);

  final Color colour;
  final String text;
  final VoidCallback? callBackData;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: callBackData,
      child: Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        padding: const EdgeInsets.only(
            left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white, fontSize: 18.0, fontFamily: 'IranYekan'),
        ),
      ),
    );
  }
}
