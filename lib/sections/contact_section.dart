import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_social_button/flutter_social_button.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) {
      // If validation fails, do not proceed
      return;
    }
    FocusScope.of(context).unfocus(); // Dismiss keyboard and remove focus


    const String formUrl = "https://formspree.io/f/mwpqokvv";

    try {
      final response = await http.post(
        Uri.parse(formUrl),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'name': _nameController.text,
          'email': _emailController.text,
          'subject': _subjectController.text,
          'message': _messageController.text,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 302) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Form successfully submitted!')),
        );
        _formKey.currentState?.reset();
      } else {
        throw Exception('Failed to submit Form');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to submit Form. Try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("📬 Get-in-Touch/~\$:",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.orangeAccent, fontWeight: FontWeight.bold),
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
              'Got Questions or Just Curious❓Slide into my inbox via the form below or stalk me (professionally, of course) on my socials! Let’s connect‼️',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                  ),
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(height: 20),

          // 🔻 FORM START
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextField(_nameController, "Name", maxLines: 1),
                _buildTextField(_emailController, "E-mail", maxLines: 1),
                _buildTextField(_subjectController, "Subject", maxLines: 2),
                _buildTextField(_messageController, "Message", maxLines: 10),
                const SizedBox(height: 20),
                OutlinedButton.icon(
                  onPressed: _submitForm,
                  icon: const Icon(Icons.send),
                  label: const Text("Submit_Form()"),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.black.withOpacity(0.7),
                    foregroundColor: Colors.orangeAccent,
                    textStyle: GoogleFonts.courierPrime(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),

          // 🔻 FOOTER SECTION
          Divider(color: Colors.greenAccent),
          const SizedBox(height: 10),
          // Logo/Title
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.terminal, color: Colors.orangeAccent, size: 20),
                const SizedBox(width: 8),
                Text(
                  "Cyber-Warrior",
                  style: GoogleFonts.courierPrime(
                    color: Colors.orangeAccent,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterSocialButton(
                onTap: () => _launchURL("https://github.com/PulkitGahlot"),
                buttonType: ButtonType.github,
                mini: true,
                // iconSize: 18,
              ),
              const SizedBox(width: 10),
              FlutterSocialButton(
                onTap: () => _launchURL("https://www.linkedin.com/in/pulkit-gahlot"),
                buttonType: ButtonType.linkedin,
                mini: true,
                // iconSize: 18,
              ),
              const SizedBox(width: 10),
              FlutterSocialButton(
                onTap: () => _launchURL("https://instagram.com/xr4cc00nx"),
                buttonType: ButtonType.instagram,
                mini: true,
                // iconSize: 18,
              ),
              const SizedBox(width: 10),
              FlutterSocialButton(
                onTap: () => _launchURL("https://www.x.com/Pulkit_Gahlot_"),
                buttonType: ButtonType.twitter,
                mini: true,
                // iconSize: 18,
              ),
              // const SizedBox(width: 6),
              // FlutterSocialButton(
              //   onTap: () => _launchURL("https://wa.me/91<number>"),
              //   buttonType: ButtonType.whatsapp,
              //   mini: true,
              //   iconSize: 18,
              // ),
            ],
          ),
          const SizedBox(height: 20),
              
              
          // Copyright & Tagline
          Center(
            child: Column(
              children: [
                Text('© 2025 All rights reserved.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.orangeAccent,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,                  
                  ),
                ),
                const SizedBox(height: 4),
                Text('Crafting secure systems Anonymously!',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.orangeAccent,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        color: Colors.black.withOpacity(0.8), 
        child: TextFormField(
          controller: controller,
          maxLines: maxLines,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(color: Colors.orangeAccent),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.greenAccent, width: 2)),
          ),
          validator: (value) => value == null || value.isEmpty ? 'Required' : null,
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }
}