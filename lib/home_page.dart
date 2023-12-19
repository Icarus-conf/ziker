import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziker/button.dart';
import 'package:ziker/morning_page.dart';
import 'package:ziker/night_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF062726),
                Color(0xFF2C514C),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Column(
                    children: [
                      Text(
                        "أذكار الصباح والمساء",
                        style: GoogleFonts.amiri(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            "{",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "وذكر فإن الذكرى تنفع المؤمنين",
                            style: GoogleFonts.amiri(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                          const Text(
                            "}",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MyButton(
                      text: "أذكار المساء",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NightPage(),
                          ),
                        );
                      },
                      color: const Color(0xFF062726),
                      width: 150,
                      borderRad: BorderRadius.circular(10),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    MyButton(
                      text: "أذكار الصباح",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SabahPage(),
                          ),
                        );
                      },
                      color: const Color(0xFF062726),
                      width: 150,
                      borderRad: BorderRadius.circular(10),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
