import 'package:flawless_beauty/common/styles/widget_login_signuo/Custom_shap/Conatiners/circular_container.dart';
import 'package:flawless_beauty/utils/helper/help_function.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/constant.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = THelpFunction.getColor(text) != null;
    return  Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label:  isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle:  TextStyle(color: selected ? TColors.white : null),
        avatar: isColor ? TCircularContainer(width: 50,height: 50,backgroundColors: THelpFunction.getColor(text)!) : null,
        labelPadding: isColor ? const EdgeInsets.all(0): null, /// Make Icon in Center
        padding: isColor ? const EdgeInsets.all(0) : null,
        shape:  isColor ? const CircleBorder() : null,
         selectedColor: THelpFunction.getColor(text) != null ? Colors.green : null,
        backgroundColor: isColor ? THelpFunction.getColor(text)! : null,
      ),
    );
  }
}
