import 'package:devquiz_flutter/core/app_gradients.dart';
import 'package:devquiz_flutter/core/app_text_styles.dart';
import 'package:devquiz_flutter/home/widgets/score_card/score_card_widget.dart';
import 'package:devquiz_flutter/shared/models/user_model.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;
  
  AppBarWidget({
    super.key,
    required this.user,
  }) : super(
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
                              text: user.name,
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
                            image: AssetImage("assets/images/avatar.jpg"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: const Alignment(0.0, 1.25),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: ScoreCardWidget(
                      score: user.score,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
}
