import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startquiz,{super.key});
  final void Function() startquiz;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(opacity: 0.7,
          child: Image.asset('assets/quiz-logo.png',width: 300),),
          const SizedBox(height: 50),
         Text(
            'ready for the quiz ? ...',
            style: GoogleFonts.lato(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 40),
          OutlinedButton.icon(
              onPressed: startquiz,
              label: const Text('start quiz'),
            style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                elevation: 10,
                side: const BorderSide(width: 1,color: Colors.white12),
            ), icon: const Icon(Icons.navigate_next_sharp),
          )

        ],
      ),
    );
  }
}
