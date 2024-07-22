import 'package:flutter/material.dart';
import 'package:notes_app/constant/constant.dart';
class TextContentField extends StatelessWidget {
  const TextContentField({super.key, this.onSaved});
 final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved:onSaved ,
      validator: (value) {
        if (value == null){
          return 'this field is required';
        }
      },
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 64, horizontal: 16),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: kPrimaryColor,
            ),
          ),
          hintText: 'Content',
          hintStyle: const TextStyle(
            color: kPrimaryColor,
          )),
    );
  }
}
