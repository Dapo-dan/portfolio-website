import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:porfolio/constants/const.dart';
import 'package:porfolio/constants/styles.dart';
import 'package:porfolio/widgets/gradient_text.dart';

class HeaderTextWidget extends StatelessWidget {
  final Size size;
  const HeaderTextWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: width() * 0.07,
      ),
      child: Column(
        crossAxisAlignment: width() > 950
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: width() > 950
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              Text(
                "WELCOME TO MY PORTFOLIO!",
                style: TextStyles.style16regular,
              ),
              horizontalSpaceSmall(),
              SvgPicture.asset(
                "assets/icons/wave.svg",
                height: 20,
                width: 20,
              ),
            ],
          ),
          verticalSpaceMedium(),
          Text(
            "Oladapo",
            style: TextStyles.style20regular.copyWith(
              fontSize: 30,
            ),
          ),
          Text(
            "Olatubosun",
            style: TextStyles.style20extrabold.copyWith(
              fontSize: 40,
            ),
          ),
          GradientTextWidget(
            size: size,
            alignment: TextAlign.center,
            text1: "Flutter Developer",
          ),
          SizedBox(
            width: width() > 950 ? width() * 0.5 : width() * 0.85,
            child: Text(
              "I specialize in building beautiful and functional mobile applications using Flutter, creating seamless user experiences for millions of users.",
              style: TextStyles.style16regular,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}