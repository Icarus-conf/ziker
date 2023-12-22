import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziker/components/colors.dart';
import 'package:ziker/models/morning_model.dart';
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
      backgroundColor: const Color(0xFFe9edf0),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xFF012a4a),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "أذكار الصباح",
          textDirection: TextDirection.rtl,
          style: GoogleFonts.arefRuqaa(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.black,
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
          itemCount: morningTexts.length,
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
                  color: secondaryColor,
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
                          text: morningTexts[index],
                          fontS: 25,
                          textDirection: TextDirection.rtl,
                          color: Colors.white,
                        ),
                        AmiriText(
                          text: morningSubTexts[index],
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
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              child: Text(
                                morningCountNumbers[index].toString(),
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
