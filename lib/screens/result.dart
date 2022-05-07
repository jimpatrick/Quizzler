import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key, this.right, this.wrong}) : super(key: key);
  final int? right, wrong;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'پاسخ صحیح: $right',
              style: const TextStyle(fontFamily: 'IranYekan', fontSize: 25.0),
            ),
            Text(
              'پاسخ غلط: $wrong',
              style: const TextStyle(fontFamily: 'IranYekan', fontSize: 25.0),
            ),
            const SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: const Text(
                    'شروع مجدد',
                    style: TextStyle(fontSize: 25.0, fontFamily: 'IranSans'),
                    textAlign: TextAlign.center,
                  )),
            ),
          ],
        ),
      )),
    );
  }
}