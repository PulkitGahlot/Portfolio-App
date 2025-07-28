import 'package:flutter/material.dart';
import 'package:portfolio_app/widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  final List<Map<String, String>> projects = const [
    {
      'title': '🔐 Cryptographer_App',
      'description':
          'A multi-functional encryption tool built with Python, featuring secure image encryption/decryption using pixel manipulation, a password strength checker, and classical text encryption algorithms. Designed for intuitive use with a GUI interface to enhance data privacy and awareness.',
      'link': 'https://clikn.in/LkJsOZ4',
    },
    {
      'title': '🛡️ Ethical_Hacking_ Projects',
      'description':
          'A curated collection of ethical hacking projects covering network scanning, web app penetration testing, password cracking, honeypot deployment, Wi-Fi auditing, phishing simulation, and SQL injection. Includes detailed guides and tool-based implementations using Nmap, Burp Suite, John the Ripper, Cowrie, Aircrack-ng, and SQLMap.',
      'link': 'https://github.com/PulkitGahlot/Ethical-Hacking-Projects',
    },
    {
      'title': '🖥️ Computer_Network_ Project',
      'description':
          'Simulated a full-scale enterprise network with 8 routers, 8 switches, servers (DHCP, FTP, TFTP, Email), firewall (ASA 5506), VLANs, and wireless controller using Cisco Packet Tracer to model secure and efficient network architecture.',
      'link': 'https://github.com/PulkitGahlot/Computer-Network-Project',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '📂 Projects/~\$:',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold, 
                  color: Colors.orangeAccent,
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
              'Hacked, built, and shipped — a blend of cybersecurity stunts & Android app magic!\n(view more on Github)',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
          const SizedBox(height: 16),
          Column(
            children: projects
                .map((project) => ProjectCard(
                      title: project['title']!,
                      description: project['description']!,
                      link: project['link']!,
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
