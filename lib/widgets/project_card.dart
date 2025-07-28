import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String link;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.link,
  });

  void _launchURL() async {
    final Uri url = Uri.parse(link);
    if (!await launchUrl(url)) {
      throw 'Could not launch $link';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12),
      color: Colors.black.withOpacity(0.7),
      shape: RoundedRectangleBorder(side: BorderSide(color: Colors.green) , borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold, 
                      fontSize: 20,
                    )),
            const SizedBox(height: 8),
            Text(description,
              style: GoogleFonts.courierPrime(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              icon: Icon(Icons.link),
              onPressed: _launchURL,
              style: OutlinedButton.styleFrom(foregroundColor: Colors.orangeAccent),
              label: Text('Project_Link()', style: GoogleFonts.courierPrime(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
