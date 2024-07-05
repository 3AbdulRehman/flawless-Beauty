import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flutter/material.dart';

class UploadProductButton extends StatelessWidget {
  const UploadProductButton(
      {super.key,
      required this.text,
      required this.leftIcon,
      required this.rightIcon,
      this.onPressed});

  final String text;
  final IconData leftIcon;
  final IconData rightIcon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: TColors.primary),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(leftIcon, color: TColors.white),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    text,
                    style: const TextStyle(color: TColors.white),
                  ),
                ],
              ),
              Icon(
                rightIcon,
                color: TColors.white,
                size: 25,
              ),
            ],
          ),
        ));
  }
}
