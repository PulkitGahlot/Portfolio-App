import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final skills = [
      {
        'icon': Icons.security,
        'title': 'Cyber_Security',
        'desc': 'Conducted 10+ vulnerability assessments, identifying and mitigating OWASP Top 10 threats in lab environments.',
        'tags': ['NMAP', 'WireShark', 'Kali Linux', 'Splunk', 'Cowrie', 'OWASP Top 10', 'Burp Suite', 'Git'],
      },
      {
        'icon': Icons.network_check,
        'title': 'Networking',
        'desc': 'Built and analyzed 6+ network topologies and attack simulations using tools like Wireshark and Nmap to strengthen system defenses.',
        'tags': ['TCP/IP', 'Cisco Packet Tracer', 'Wireshark', 'Nmap', 'Firewalls'],
      },
      {
        'icon': Icons.code,
        'title': 'Python_Programming_ &_Scripting',
        'desc': 'Navigated the cyber realm & fine-tune LLMs, automating tasks with Python, and building stealthy tools like facial-recognition attendance and Doc-Fusion on NVIDIA’s DGX A100 infra—weaponizing code for the next-gen digital battlefield.',
        'tags': ['Python', 'FastAPI', 'pynput', 'Open-cv', 'Transformers'],
      },
      {
        'icon': Icons.android,
        'title': 'Flutter_App_ Development',
        'desc': 'Delivered 5+ cross-platform apps with smooth UI/UX and 95%+ codebase reuse for Android, and web using Flutter and Dart.',
        'tags': ['Flutter', 'Dart', 'Riverpod', 'Android Studio', 'MediaQuary', 'XML'],
      },
      {
        'icon': Icons.flutter_dash,
        'title': 'Project_Deployment',
        'desc': 'Deployed 3+ apps using platforms like NVIDIA Servers, GitHub, and Render ensuring 99.9% uptime.',
        'tags': ['Cloud', 'Console', 'NVIDIA', 'REST APIs', 'Render'],
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '🎭 Techinal-Expertise/~\$:',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.orangeAccent,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                border: Border.all(
                  color: Colors.green,
                  width: 1
                ),
                borderRadius: BorderRadius.circular(15)
              ),
              child: Text(
                'A comprehensive set of skills that got me all the way to the top of the tech industry.',
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: skills.map((skill) => _buildSkillCard(skill, isDark)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCard(Map<String, dynamic> skill, bool isDark) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? Colors.black.withOpacity(0.7) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.green),
        boxShadow: [
          BoxShadow(
            color: Colors.greenAccent.withOpacity(0.1),
            blurRadius: 12,
            spreadRadius: 2,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(skill['icon'], size: 30, color: Colors.orangeAccent),
          const SizedBox(height: 8),
          Text(
            skill['title'],
            style: GoogleFonts.courierPrime(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.greenAccent,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            skill['desc'],
            textAlign: TextAlign.justify,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: (skill['tags'] as List<String>).map((tag) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.orange.withOpacity(0.2),
                  border: Border.all(color: Colors.orangeAccent),
                ),
                child: Text(
                  tag,
                  style: GoogleFonts.courierPrime(color: Colors.orangeAccent, fontSize: 13),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}







































// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class SkillsSection extends StatelessWidget {
//   const SkillsSection({super.key});

//   final List<String> skills = const [
//     'Flutter',
//     'Dart',
//     'Python',
//     'FastAPI',
//     'Cybersecurity',
//     'Red Teaming',
//     'JavaScript',
//     'Linux',
//     'Git & GitHub',
//     'Firebase',
//     'REST APIs',
//     'OWASP Top 10',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final isDark = Theme.of(context).brightness == Brightness.dark;
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             '💻 Skills & Tools',
//             style: Theme.of(context).textTheme.headlineMedium?.copyWith(
//                   color: isDark? Colors.greenAccent: Colors.black,
//                   fontWeight: FontWeight.bold,
//                 ),
//           ),
//           const SizedBox(height: 16),
//           Wrap(
//             spacing: 12,
//             runSpacing: 12,
//             children: skills
//                 .map((skill) => Chip(
//                       backgroundColor:
//                           isDark ? Colors.black87 : Colors.grey[200],
//                       side: const BorderSide(color: Colors.greenAccent),
//                       label: Text(
//                         skill,
//                         style: GoogleFonts.courierPrime(color: Colors.white),
//                       ),
//                     ))
//                 .toList(),
//           ),
//         ],
//       ),
//     );
//   }
// }
