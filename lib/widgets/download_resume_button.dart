import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

class DownloadResumeButton extends StatelessWidget {
  const DownloadResumeButton({super.key});

  Future<void> _downloadResume(BuildContext context) async {
    try {
      // Ask for storage permission
      final status = await Permission.manageExternalStorage.request();
      if (!status.isGranted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Storage permission is required.')),
        );
        return;
      }

      // Load asset file
      final byteData = await rootBundle.load('assets/resume/Pulkit_Gahlot_Resume.pdf');

      // Get directory
      final directory = '/storage/emulated/0/Download'; // await getExternalStorageDirectory();
      final filePath = '$directory/Pulkit_Gahlot_Resume.pdf';

      // Write file
      final file = File(filePath);
      await file.writeAsBytes(byteData.buffer.asUint8List());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Resume downloaded to: $filePath')),
      );
    } catch (e) {
      // print("Download Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to download resume.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () => _downloadResume(context),
      icon: Icon(Icons.download),
      label: Text("Download_My_Resume()"),
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.black.withOpacity(0.7),
        foregroundColor: Colors.orangeAccent,
        textStyle: GoogleFonts.courierPrime(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
