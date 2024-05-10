import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{
 const AnswerButton({super.key,
    required this.answertxt,
    required this.onTap
  });
  final String answertxt;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 40),
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromRGBO(10, 10, 10, 0.5),
      ),
      child:Text(answertxt,
        textAlign: TextAlign.center,
      ),
    );
  }
}