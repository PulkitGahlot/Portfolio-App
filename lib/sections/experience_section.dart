import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  final List<Map<String, String>> experience = const [
    {
      'duration': 'August_2023 - January_2024',
      'title': 'Android_App_Developer_ Intern',
      'company': 'Drifko_Tech_LLP',
      'description':
          'As an Android App Developer Intern at Drifko Tech LLP, I built 10+ responsive UI screens for the Playpulse app using Flutter & Dart, serving both turf owners and players. I improved app performance by 30% through scalable UI and API integration, and contributed to development cycles.'
    },
    {
      'duration': 'Frebruary_2024 - July_2024',
      'title': 'HR_Assistant_Intern',
      'company': 'Drifko_Tech_LLP',
      'description':
          'As an HR Assistant Intern at Drifko Tech LLP, I enhanced onboarding efficiency by 40%, conducted 20+ interviews, streamlined documentation, and supported the successful closure of 10+ technical and operational roles.'
    },
    {
      'duration': 'September_2024 - Present',
      'title': 'Python_Scriptin_&_ AI_Trainee',
      'company': 'Global InfoVentures',
      'description':
          'As an AI & Python Scripting Trainee at Global Infoventures, I worked hands-on with Python automation, LLM fine-tuning, and AI model deployment using NVIDIA DGX A100 infrastructure. Recreated real-world projects like face recognition–based attendance and Doc-Fusion.'
    },
    {
      'duration': 'February_2025 - April_2025',
      'title': 'CCNA_Trainee',
      'company': 'Cisco_Networking_Academy',
      'description':
          'As a CCNA Trainee under Cisco Networking Academy, I completed 3 certification modules covering IP addressing, routing, wireless networking, and network security. Gained hands-on experience via 25+ practical simulations focused on real-world network configurations, threat mitigation, and secure communication..'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 700;
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '📈 Professional-Journey/~\$:',
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
                  'My career path & significant milestones in engineering, tech, & research.',
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Stack(
                children: [
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 2,
                        color: Colors.orangeAccent.withOpacity(0.6),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      ...List.generate(experience.length, (index) {
                        final data = experience[index];
                        final isLeft = index % 2 == 0;
                        return _buildTimelineCard(
                          context: context,
                          isLeft: isMobile ? false : isLeft,
                          isMobile: isMobile,
                          duration: data['duration']!,
                          title: data['title']!,
                          company: data['company']!,
                          description: data['description']!,
                        );
                      },),
                      const SizedBox(height: 32),
                      OutlinedButton.icon(
                        onPressed: () {
                          final uri = Uri.parse("https://drive.google.com/drive/u/0/folders/1pf7qKTNygTTzoyMFn8xWw3rezp2FAd2A");
                          // use url_launcher
                          launchUrl(uri, mode: LaunchMode.externalApplication);
                        },
                        icon: const Icon(Icons.folder_open_rounded, color: Colors.orangeAccent),
                        label: Text(
                          "See_My_Certificates()",
                          style: GoogleFonts.courierPrime(
                            fontSize: 16,fontWeight: FontWeight.bold,
                            color: Colors.orangeAccent,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.black.withOpacity(0.7),
                          foregroundColor: Colors.orangeAccent,
                          textStyle: GoogleFonts.courierPrime(
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                        ),
                      ),
                    ]
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTimelineCard({
    required BuildContext context,
    required bool isLeft,
    required bool isMobile,
    required String duration,
    required String title,
    required String company,
    required String description,
  }) {
    
    final borderRadius = BorderRadius.circular(15);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: isMobile ? MainAxisAlignment.center: isLeft? MainAxisAlignment.start: MainAxisAlignment.end,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: isMobile ? 317 : MediaQuery.of(context).size.width * 0.6,
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: borderRadius,
                border: Border.all(color: Colors.green),
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange.withOpacity(0.1),
                    blurRadius: 8,
                    spreadRadius: 1,
                    offset: const Offset(0, 3),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    duration,
                    style: GoogleFonts.courierPrime(
                      color: Colors.orangeAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    title,
                    style: GoogleFonts.courierPrime(
                      color: Colors.greenAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '📍 $company',
                    style: GoogleFonts.courierPrime(color: Colors.orangeAccent),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: GoogleFonts.courierPrime(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}