import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/matrix_background.dart';
import 'sections/about_section.dart';
import 'sections/skills_section.dart';
import 'sections/projects_section.dart';
import 'sections/contact_section.dart';
import 'widgets/responsive_app_bar.dart';
import 'sections/experience_section.dart';


ScrollController scrollController = ScrollController();

final GlobalKey aboutKey = GlobalKey();
final GlobalKey skillsKey = GlobalKey();
final GlobalKey projectsKey = GlobalKey();
final GlobalKey contactKey = GlobalKey();
final GlobalKey experienceKey = GlobalKey();


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

   @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.black),
              child: Text('/\$: ls -a', style: GoogleFonts.courierPrime(color: Colors.greenAccent, fontSize: 20)),
              ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              minVerticalPadding: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.orangeAccent),
              ),
              title: Text('/\$:cd ~/About', style: GoogleFonts.courierPrime(color: Colors.greenAccent)),
              onTap: () {
                // Explicitly assign focus to an empty node
                FocusScope.of(context).requestFocus(FocusNode());
                FocusScope.of(context).unfocus(); // Dismiss keyboard and remove focus
                scrollToSection(aboutKey);
                Navigator.of(context).pop();},
            ),
            const SizedBox(height: 10,),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.orangeAccent),
              ),
              title: Text('/\$:cd ~/Professional-Journey', style: GoogleFonts.courierPrime(color: Colors.greenAccent)),
              onTap: () {
                // Explicitly assign focus to an empty node
                FocusScope.of(context).requestFocus(FocusNode());
                FocusScope.of(context).unfocus(); // Dismiss keyboard and remove focus
                scrollToSection(experienceKey);
                Navigator.of(context).pop();},
            ),
            const SizedBox(height: 10,),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.orangeAccent),
              ),
              title: Text('/\$:cd ~/Technical-Expertise', style: GoogleFonts.courierPrime(color: Colors.greenAccent)),
              onTap: () {
                // Explicitly assign focus to an empty node
                FocusScope.of(context).requestFocus(FocusNode());
                FocusScope.of(context).unfocus(); // Dismiss keyboard and remove focus
                scrollToSection(skillsKey);
                Navigator.of(context).pop();},
            ),
            const SizedBox(height: 10,),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              minVerticalPadding: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.orangeAccent),
              ),
              title: Text('/\$:cd ~/Projects', style: GoogleFonts.courierPrime(color: Colors.greenAccent)),
              onTap: () {
                // Explicitly assign focus to an empty node
                FocusScope.of(context).requestFocus(FocusNode());
                FocusScope.of(context).unfocus(); // Dismiss keyboard and remove focus
                scrollToSection(projectsKey);
                Navigator.of(context).pop();},
            ),
            const SizedBox(height: 10,),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              minVerticalPadding: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.orangeAccent),
                ),
              title: Text('/\$:cd ~/Get-in-Touch', style: GoogleFonts.courierPrime(color: Colors.greenAccent)),
              onTap: ()  {
                // Explicitly assign focus to an empty node
                FocusScope.of(context).requestFocus(FocusNode());
                FocusScope.of(context).unfocus(); // Dismiss keyboard and remove focus
                scrollToSection(contactKey);
                Navigator.of(context).pop();},
            ),
          ],
        ),
      ),
      appBar: ResponsiveAppBar(
        scrollController: scrollController,
        onNavItemTapped: scrollToSection,
      ),
      body: Stack(
        children: [
          const MatrixBackground(),
          SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(), // Dismiss keyboard and remove focus
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                controller: scrollController,
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    KeyedSubtree(key: aboutKey ,child: AboutSection()),
                    KeyedSubtree(key: experienceKey, child: ExperienceSection()),
                    KeyedSubtree(key: skillsKey, child: SkillsSection()),
                    KeyedSubtree(key: projectsKey, child: ProjectsSection()),
                    KeyedSubtree(key: contactKey, child: ContactSection()),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}