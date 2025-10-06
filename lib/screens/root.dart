import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manhwarecaptop/utils/rgb.dart';
import 'sub/rootdrawer.dart';


class Root extends StatelessWidget {
  final Color darkBg = Color(0xFF0A0A1F);
  final Color purpleAccent = Color(0xFF8A2BE2); // Adjusted for your glow
  final Color lightPurple = Color(0xFFBC7CFF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBg,

      drawer: Rootdrawer(),

      appBar: AppBar(
        title: Text("GrandpaAcademy.org", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30)),
        backgroundColor: darkBg,
        elevation: 0,
      ),

      body: Stack(
        children: [
          // Background Stars / Gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [darkBg, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // Hero Content
          SingleChildScrollView(
            child: Column(
              children: [

                SizedBox(height: 100),

                // Main Title
                Column(
                  children: [
                    Text(
                      "Learn & Build",
                      style: GoogleFonts.poppins(
                        fontSize: 48,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          colors: [Colors.white, lightPurple],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds);
                      },
                      child: RgbText(
                        "Your FUTURE!",
                        Duration(seconds: 5),
                        style: GoogleFonts.poppins(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Learn from the best instructors and get certified in top tech skills.\nBuild your future today.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.grey[400],
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        shape: StadiumBorder(),
                      ),
                      child: RgbText("Enroll Now",Duration(seconds: 5), style:  GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                    ),
                    SizedBox(height: 60),

                    // Icon(
                    //   Icons.keyboard_arrow_down_rounded,
                    //   size: 40,
                    //   color: Colors.white,
                    // ),
                  ],
                ),

                SizedBox(height: 80),

                // Bottom Cards
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment
                          .stretch,
                      children: [
                        Expanded(
                          child: FeatureCard(
                            icon: Icons.rocket_launch_outlined,
                            title: "Give You 100% Security",
                            subtitle:
                                "Give You 100% Security. \nWe will not share your data with anyone.",
                            highlight: "100%",
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: FeatureCard(
                            icon: Icons.school_outlined,
                            title: "Learn from Industry Experts",
                            subtitle:
                                "Learn from Industry Experts. \nLearn from Industry Experts.",
                            highlight: "???",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 80),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Reusable Navigation Text Button
Widget NavItem(String label) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0),
    child: Text(
      label,
      style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
    ),
  );
}

// Feature Card Widget
class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String? highlight;

  const FeatureCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.highlight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color cardColor = Color(0xFF1B1B35);

    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, size: 50, color: Colors.blueAccent),
          if (highlight != null) ...[
            SizedBox(height: 10),
            Text(
              highlight!,
              style: TextStyle(
                fontSize: 40,
                color: Colors.purpleAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
          SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
