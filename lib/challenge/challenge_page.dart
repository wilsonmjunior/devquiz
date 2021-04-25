import 'package:devquiz/challenge/widgets/answer/answer_widget.dart';
import 'package:devquiz/challenge/widgets/next_button/next_buttom_widget.dart';
import 'package:devquiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:devquiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:devquiz/core/core.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  ChallengePage({Key? key}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: AppColors.border,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: SafeArea(
            child: QuestionIndicatorWidget(),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              QuizWidget(title: 'O que o Flutter faz em sua totalidade?'),
              AnswerWidget(
                  title:
                      'Possibilita a criação de aplicativos compilados nativamente'),
              AnswerWidget(
                  title:
                      'Possibilita a criação de aplicativos compilados nativamente')
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(
          bottom: true,
          child: Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(child: NextButtonWidget.white(label: "Pular")),
                SizedBox(width: 15),
                Expanded(child: NextButtonWidget.green(label: "Confirmar")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
