import 'package:devquiz_flutter/core/app_gradients.dart';
import 'package:devquiz_flutter/core/app_text_styles.dart';
import 'package:devquiz_flutter/home/widgets/score_card/score_card_widget.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget({super.key})
      : super(
          preferredSize: const Size.fromHeight(250),
          child: Container(
            height: 250,
            child: Stack(
              children: [
                Container(
                  height: 161,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    gradient: AppGradients.linear,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: "Olá, ",
                          style: AppTextStyles.title,
                          children: [
                            TextSpan(
                              text: "Felipe",
                              style: AppTextStyles.titleBold,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 58,
                        height: 58,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image: NetworkImage(
                                "https://avatars.githubusercontent.com/u/64941387?v=4"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Align(
                  alignment: Alignment(0.0, 1.25),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: ScoreCardWidget(),
                  ),
                ),
              ],
            ),
          ),
        );
}
