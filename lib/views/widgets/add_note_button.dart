import 'package:flutter/material.dart';
import 'package:notes_app/constant/constant.dart';
class AddNoteButton extends StatelessWidget {
  const AddNoteButton({super.key, this.onTap,  this.isLoading=false});
  final void Function()? onTap;
 final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          height: 45,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: kPrimaryColor,
          ),
          child: Center(
            child:isLoading? const SizedBox(
              height: 25,
              width: 25,
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ): const Text(
              'Add',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
