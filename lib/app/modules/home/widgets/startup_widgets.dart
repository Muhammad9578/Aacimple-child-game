import 'package:aacimple/app/Utils/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class StartupButton extends StatelessWidget {
  const StartupButton(
      {super.key,
      this.buttonIcon,
      required this.buttontText,
      this.svgPath,
      this.onTap,
      required this.isSvg});

  final IconData? buttonIcon;
  final bool isSvg;
  final String? svgPath;
  final String buttontText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ??
          () {
            print(buttontText);
          },
      child: Container(
        margin: const EdgeInsets.all(6),
        height: Get.height * .4,
        width: Get.height * .45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: ColorHelper.primaryColor,
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isSvg
                ? SvgPicture.asset(
                    svgPath!,
                    color: Colors.white,
                    width: 40,
                    height: 40,
                  )
                : Icon(
                    buttonIcon!,
                    color: Colors.white,
                    size: 40,
                  ),
            const SizedBox(
              height: 15,
            ),
            Text(
              buttontText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
