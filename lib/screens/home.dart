import 'package:flutter/material.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:quizzler_review/components/story-button.dart';
import 'package:quizzler_review/models/data.dart';
import 'package:quizzler_review/screens/result.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ScrollController controller;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  int trueAnswer = 0;
  int wrongAnswer = 0;
  late String pope;

  List<Quiz> questions = [
    Quiz('کشور اتیوپی در آسیا قرار دارد.', true),
    Quiz('ماه به دور خورشید می‌گردد.', false),
    Quiz('هر مثلث قائم الزاویه یک زاویه قائم دارد.', true),
    Quiz('پایتخت عمان مسقط است.', true),
    Quiz('هر یک ثانیه به ۱۰۰ میلی ثانیه تقسیم می‌شود.', false),
  ];

  List<Icon> iconList = [];

  void addIconAnswer(bool labelButton) async{
    setState(() {
      if (questions[index].answer == labelButton) {
        trueAnswer++;
        iconList.add(
          const Icon(
            Icons.check,
            size: 20.0,
            color: Colors.green,
          ),
        );
      } else {
        wrongAnswer++;
        iconList.add(
          const Icon(
            Icons.clear,
            size: 20.0,
            color: Colors.red,
          ),
        );
      }
    });

    if (index >= questions.length - 1) {
      final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ResultScreen(right: trueAnswer, wrong: wrongAnswer),
        ),
      );

      if (result) {
        setState(() {
          iconList.clear();
        });
        trueAnswer = 0;
        wrongAnswer = 0;
        index = 0;
      }
    } else {
      index++;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 12,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Center(
                  child: FadingEdgeScrollView.fromSingleChildScrollView(
                    child: SingleChildScrollView(
                      controller: widget.controller,
                      child: Text(
                        questions[index].question,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontFamily: 'IranYekan'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: StoryButton(
                text: 'درست',
                colour: Colors.green,
                callBackData: () {
                  addIconAnswer(true);
                },
              ),
            ),
            Expanded(
              flex: 3,
              child: StoryButton(
                text: 'غلط',
                colour: Colors.red,
                callBackData: () {
                  addIconAnswer(false);
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: iconList,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
