import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResponsiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ScrollController scrollController;
  final void Function(GlobalKey) onNavItemTapped;

  const ResponsiveAppBar({super.key, required this.scrollController, required this.onNavItemTapped});

  // void _scrollToSection(String sectionKey) {
  //   final offset = sectionOffsets[sectionKey];
  //   if (offset != null) {
  //     scrollController.animateTo(
  //       offset,
  //       duration: Duration(milliseconds: 700),
  //       curve: Curves.decelerate,
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 1000;

    return AppBar(
      title: Text("/~\$: pwd\n/~\$: /Portfolio", style: GoogleFonts.courierPrime(fontSize: 20)),
      backgroundColor: Colors.black,
      elevation: 4,
      actions: isWide
          ? [
              _buildNavButton("/\$cd ~/About", "aboutkey"),
              _buildNavButton("/\$cd ~/Professional_Journey", "experiencekey"),
              _buildNavButton("/\$cd ~/Techinical_Expertise", "skillskey"),
              _buildNavButton("/\$cd ~/Projects", "projectskey"),
              _buildNavButton("/\$cd ~/Get_in_Touch", "contactkey"),
            ]
          : null,
      iconTheme: IconThemeData(color: Colors.greenAccent),
    );
  }

  Widget _buildNavButton(String label, String sectionKey) {
    return TextButton(
      onPressed: () => onNavItemTapped(sectionKey as GlobalKey),
      child: Text(label, style: GoogleFonts.courierPrime(color: Colors.greenAccent)),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
