import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MatrixTerminalBox extends StatelessWidget {
  const MatrixTerminalBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.greenAccent.withOpacity(0.6),
            blurRadius: 20,
            spreadRadius: 2,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Terminal Top Bar
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Terminal',
                style: TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 12,
                  fontFamily: 'SourceCodePro',
                ),
              ),
              Spacer(),
              Icon(Icons.circle, color: Colors.green, size: 12),
              SizedBox(width: 6),
              Icon(Icons.circle, color: Colors.amber, size: 12),
              SizedBox(width: 6),
              Icon(Icons.circle, color: Colors.red, size: 12),
            ],
          ),
          SizedBox(height: 20),
          // Terminal Content
          DefaultTextStyle(
            style: GoogleFonts.courierPrime(
              color: Colors.white,
              fontSize: 18,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('(pulkit_gahlot)-[~]#',style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),),
                SizedBox(height: 4),
                AnimatedTextKit(repeatForever: true, animatedTexts: [
                  TyperAnimatedText('whoami'),
                  TyperAnimatedText('cat Pulkit_Gahlot_Resume.pdf'),
                  TyperAnimatedText('ping www.linkedin.in/in/pulkit-gahlot'),
                  TyperAnimatedText('curl -X GET https://api.github.com/users/PulkitGahlot'),
                ]),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
