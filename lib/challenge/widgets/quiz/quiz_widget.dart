import 'package:devquiz/challenge/widgets/answer/answer_widget.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;

  QuizWidget({
    Key? key,
    required this.question,
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  answer(int index) => widget.question.answers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  widget.question.title,
                  style: AppTextStyles.heading,
                ),
                SizedBox(height: 24),
                for (var i = 0; i < widget.question.answers.length; i++)
                  AnswerWidget(
                    answer: answer(i),
                    isSelected: indexSelected == i,
                    onTap: () {
                      indexSelected = i;
                      setState(() {});
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
