import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziker/components/colors.dart';
import 'package:ziker/components/text_format.dart';
import 'package:ziker/data/night_prays_data.dart';

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
      backgroundColor: const Color(0xFF252525),
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
          itemCount: nightPrays.length,
          itemBuilder: (context, index) {
            counters.add(0);
            var nightData = nightPrays[index];
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
                          text: nightData.text!,
                          fontS: 25,
                          textDirection: TextDirection.rtl,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AmiriText(
                          text: nightData.subText!,
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
                                backgroundColor: resetBtnColor,
                                foregroundColor: resetForegroundColor,
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
                                  if (counters[index] > 0 ||
                                      counters[index] ==
                                          nightData.numberOfCount!) {
                                    counters[index] = 0;
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
                                backgroundColor: tasbehBtnColor,
                                foregroundColor: tasbehForegroundColor,
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
                                  if (counters[index] <
                                      nightData.numberOfCount!) {
                                    counters[index]++;
                                  }
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
                                nightData.numberOfCount.toString(),
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
