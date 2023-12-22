import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziker/models/night.dart';
import 'package:ziker/text_format.dart';

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
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "أذكار المساء",
          textDirection: TextDirection.rtl,
          style: GoogleFonts.arefRuqaa(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.black,
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
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        AmiriText(
                          text: nightTexts[index],
                          fontS: 14,
                          textDirection: TextDirection.rtl,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        CircleAvatar(
                          child: Text(
                            nightCountNumbers[index].toString(),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF086788),
                                foregroundColor: const Color(0xFF9CAFB7),
                                shadowColor: Colors.grey[400],
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
                              backgroundColor: const Color(0xFF062726),
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
                                backgroundColor: const Color(0xFF062726),
                                foregroundColor: const Color(0xFF66A182),
                                shadowColor: Colors.grey[400],
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
