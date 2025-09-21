import 'package:flutter/material.dart';


class ButtonsT extends StatelessWidget {
  final Color buttonColor;
  final String buttonText;
  final Widget buttonIcon;
  const ButtonsT({super.key, required this.buttonColor, required this.buttonText, required this.buttonIcon});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 48,
      decoration: BoxDecoration(
          color: buttonColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: buttonColor==Colors.transparent?Colors.white:buttonColor
        )
      ),
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buttonIcon,
          SizedBox(width: 8),
          Text(buttonText,style: Theme.of(context).textTheme.bodyMedium,),
        ],
      ),
    );
  }
}
