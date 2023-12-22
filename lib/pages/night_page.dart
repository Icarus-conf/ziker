import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziker/models/night.dart';
import 'package:ziker/components/text_format.dart';

class NightPage extends StatefulWidget {
  const NightPage({super.key});

  @override
  State<NightPage> createState() => _NightPageState();
}

class _NightPageState extends State<NightPage> {
  // Create a list of texts

  List<int> counters = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1d2d44),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "أذكار المساء",
          textDirection: TextDirection.rtl,
          style: GoogleFonts.arefRuqaa(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(
          25,
        ),
        child: ListView.builder(
          itemCount: nightTexts.length,
          itemBuilder: (context, index) {
            counters.add(0);
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    counters[index]++;
                  });
                },
                child: Card(
                  color: const Color(0xFF3e5c76),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        AmiriText(
                          text: nightTexts[index],
                          fontS: 25,
                          textDirection: TextDirection.rtl,
                          color: Colors.white,
                        ),
                        AmiriText(
                          text: nightSubTexts[index],
                          fontS: 14,
                          textDirection: TextDirection.rtl,
                          color: Colors.grey[200],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF086788),
                                foregroundColor: const Color(0xFF9CAFB7),
                                shadowColor: Colors.black,
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    10.0,
                                  ),
                                ),
                                minimumSize: const Size(100, 40),
                              ),
                              child: const AmiriText(
                                text: "إعادة",
                                fontS: 18,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (counters[index] > 0) {
                                    counters[index]--;
                                  }
                                });
                              },
                            ),
                            CircleAvatar(
                              backgroundColor: const Color(0xFF012a4a),
                              radius: 25,
                              child: Text(
                                counters[index].toString(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF012a4a),
                                foregroundColor: const Color(0xFF01497c),
                                shadowColor: Colors.black,
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    10.0,
                                  ),
                                ),
                                minimumSize: const Size(100, 40),
                              ),
                              child: const AmiriText(
                                text: "تسبيح",
                                fontS: 18,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  counters[index]++;
                                });
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.black,
                              child: Text(
                                nightCountNumbers[index].toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const AmiriText(
                              text: "عدد المرات",
                              fontS: 14,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
