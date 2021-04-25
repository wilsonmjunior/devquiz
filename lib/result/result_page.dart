import 'package:devquiz/core/core.dart';
import 'package:devquiz/shared/widgets/next_button/next_buttom_widget.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int length;
  final int result;

  const ResultPage({
    Key? key,
    required this.title,
    required this.length,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 130),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset(AppImages.trophy),
                  SizedBox(height: 40),
                  Text(
                    "Parabéns",
                    style: AppTextStyles.heading40,
                  ),
                  SizedBox(height: 16),
                  Text.rich(
                    TextSpan(
                      text: "Você concluiu",
                      children: [
                        TextSpan(
                          text: "\n$title",
                          style: AppTextStyles.bodyBold,
                        ),
                        TextSpan(text: "\ncom $result de $length acertos."),
                      ],
                      style: AppTextStyles.body,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 68),
                          child: NextButtonWidget.purple(
                            label: "Compartilhar",
                            onTap: () {
                              Share.share(
                                  'DevQuiz NLW 5 - Fluter: Resultado do Quiz $title\n Objtive ${result / length}% de aproveitamento');
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 68),
                          child: NextButtonWidget.transparent(
                            label: "Voltar ao inicio",
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
