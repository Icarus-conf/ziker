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
          decoration: BoxDecoration(
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
                  padding: EdgeInsets.all(
                    25,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "أذكار الصباح والمساء",
                        style: GoogleFonts.amiri(
                          fontSize: 40,
                          color: Colors.white,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
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
                          Text(
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
                SizedBox(
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
                            builder: (context) => NightPage(),
                          ),
                        );
                      },
                      color: Color(0xFF062726),
                      width: 150,
                      borderRad: BorderRadius.circular(10),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    MyButton(
                      text: "أذكار الصباح",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SabahPage(),
                          ),
                        );
                      },
                      color: Color(0xFF062726),
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
