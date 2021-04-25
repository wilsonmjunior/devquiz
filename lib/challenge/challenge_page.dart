import 'package:devquiz/challenge/challenge_controller.dart';
import 'package:devquiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:devquiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:devquiz/core/core.dart';
import 'package:devquiz/result/result_page.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:devquiz/shared/widgets/next_button/next_buttom_widget.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final String title;
  final List<QuestionModel> questions;

  ChallengePage({
    Key? key,
    required this.questions,
    required this.title,
  }) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  void initState() {
    super.initState();

    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
  }

  void nextPage() {
    if (controller.currentPage < widget.questions.length) {
      pageController.nextPage(
        duration: Duration(milliseconds: 200),
        curve: Curves.bounceIn,
      );
    }
  }

  void onSelected(bool value) {
    if (value) {
      controller.countQuestionsRigth++;
    }
    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: AppColors.border,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(132),
          child: SafeArea(
            top: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  ValueListenableBuilder<int>(
                    valueListenable: controller.currentPageNotifier,
                    builder: (context, value, _) => QuestionIndicatorWidget(
                      currentPage: value,
                      length: widget.questions.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: pageController,
            children: widget.questions
                .map(
                  (e) => QuizWidget(
                    question: e,
                    onSelected: onSelected,
                  ),
                )
                .toList(),
          ),
        ),
        bottomNavigationBar: SafeArea(
          bottom: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ValueListenableBuilder<int>(
              valueListenable: controller.currentPageNotifier,
              builder: (context, value, _) => Row(
                children: [
                  if (value < widget.questions.length)
                    Expanded(
                      child: NextButtonWidget.white(
                        label: "Pular",
                        onTap: () {
                          nextPage();
                        },
                      ),
                    ),
                  if (value == widget.questions.length)
                    Expanded(
                      child: NextButtonWidget.green(
                        label: "Finalizar",
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultPage(
                                title: widget.title,
                                length: widget.questions.length,
                                result: controller.countQuestionsRigth,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
