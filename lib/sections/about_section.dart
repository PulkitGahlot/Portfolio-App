import 'package:flutter/material.dart';
import 'package:portfolio_app/widgets/download_resume_button.dart';
import 'package:portfolio_app/widgets/matrix_terminal_box.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<StatefulWidget> createState() => _AboutSectionState();
}


class _AboutSectionState extends State<AboutSection> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(85),
              child: Image.asset('assets/images/croppedPro.png',width: 180,height: 180,fit: BoxFit.cover,),
            ),
          ),
          const SizedBox(height: 12,),
          MatrixTerminalBox(),
          const SizedBox(height: 12,),
          Text(
            'About-Me/~\$:',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: isDark ? Colors.orangeAccent : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 12),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 12),
            color: Colors.black.withOpacity(0.7),
            shape: RoundedRectangleBorder(side: BorderSide(color: Colors.green) , borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "I'm Pulkit Gahlot, a passionate Cyber Security & Flutter Developer with a knack for creating secure, scalable mobile applications. Currently pursuing my B.Tech in CSE-AI, I’ve completed multiple projects in both Android Application Development and Cyber Security, merging the best of both worlds."
                    "\n\nSkilled in Python, FastAPI, and building mobile tools. My latest creation is a 3-in-1 Encryption tool that combines texts, images, and password protection, built with Flutter and FastAPI. I’m always eager to learn and explore new technologies.",
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: isDark ? Colors.white : Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),          
          const SizedBox(height: 12,),
          DownloadResumeButton(),
        ],
      ),
    );
  }
}
