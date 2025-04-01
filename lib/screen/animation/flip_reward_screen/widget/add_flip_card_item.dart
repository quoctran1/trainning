import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trainning/utils/app_images/app_images.dart';

class AddFlipCardItem extends StatelessWidget {
  final double width, height;

  const AddFlipCardItem({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColor.autumnChild,
                AppColor.white,
              ]),
          border: Border.all(
            color: AppColor.piecesOfEight,
            width: 2,
          )),
      child: SvgPicture.asset(
        AppImages.icPlusFlipCard,
      ),
    );
  }
}
