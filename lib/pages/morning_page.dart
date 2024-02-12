import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziker/components/colors.dart';
import 'package:ziker/data/morning_prays_data.dart';

import 'package:ziker/components/text_format.dart';

class SabahPage extends StatefulWidget {
  const SabahPage({super.key});

  @override
  State<SabahPage> createState() => _SabahPageState();
}

class _SabahPageState extends State<SabahPage> {
  // Create a list of texts

  List<int> counters = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: morningPageBgColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "أذكار الصباح",
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
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
        ),
        child: ListView.builder(
          itemCount: morningPrays.length,
          itemBuilder: (context, index) {
            counters.add(0);
            var morningData = morningPrays[index];
            counterIncreament() {
              setState(() {
                if (counters[index] < morningData.numberOfCount!) {
                  counters[index]++;
                }
              });
            }

            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: GestureDetector(
                onTap: counterIncreament,
                child: Card(
                  color: morningPageCardColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(
                      25.0,
                    ),
                    child: Column(
                      children: [
                        AmiriText(
                          text: morningData.text!,
                          fontS: 25,
                          textDirection: TextDirection.rtl,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AmiriText(
                          text: morningData.subText!,
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
                                  if (counters[index] > 0 ||
                                      counters[index] ==
                                          morningData.numberOfCount!) {
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
                                shadowColor: Colors.grey[400],
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    10.0,
                                  ),
                                ),
                                minimumSize: const Size(100, 40),
                              ),
                              onPressed: counterIncreament,
                              child: const AmiriText(
                                text: "تسبيح",
                                fontS: 18,
                                color: Colors.white,
                              ),
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
                              backgroundColor: Colors.white,
                              child: Text(
                                morningData.numberOfCount.toString(),
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
