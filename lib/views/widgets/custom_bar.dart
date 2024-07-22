import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_searchIcon.dart';

class CustomNotesBar extends StatelessWidget {
  const CustomNotesBar({super.key, required this.iconData, required this.text, this.onPressed});
  final IconData iconData;
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 26,
          ),
        ),
        const Spacer(),
        CustomIcon(
          onPressed: onPressed,
          icon: iconData,
        ),
      ],
    );
  }
}
