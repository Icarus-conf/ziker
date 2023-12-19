import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziker/text_format.dart';

class SabahPage extends StatefulWidget {
  const SabahPage({super.key});

  @override
  State<SabahPage> createState() => _SabahPageState();
}

class _SabahPageState extends State<SabahPage> {
  int quantityCount = 0;
  Color? _colorCard;

  void decrmentQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "أذكار الصباح",
          textDirection: TextDirection.rtl,
          style: GoogleFonts.arefRuqaa(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(25.0),
          child: ListView(
            children: [
              GestureDetector(
                onTap: () {
                  incrementQuantity();
                  setState(() {
                    _colorCard = Colors.lightGreen.shade100;
                  });
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    //set border radius more than 50% of height and width to make circle
                  ),
                  color: _colorCard,
                  child: Column(
                    children: <Widget>[
                      const ListTile(
                        title: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: AmiriText(
                            text:
                                'أَعُوذُ بِاللهِ مِنْ الشَّيْطَانِ الرَّجِيمِ',
                            fontS: 25,
                            textDirection: TextDirection.rtl,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 25,
                          ),
                          child: AmiriText(
                            text:
                                "اللّهُ لاَ إِلَـهَ إِلاَّ هُوَ الْحَيُّ الْقَيُّومُ لاَ تَأْخُذُهُ سِنَةٌ وَلاَ نَوْمٌ لَّهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الأَرْضِ مَن ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلاَّ بِإِذْنِهِ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ وَلاَ يُحِيطُونَ بِشَيْءٍ مِّنْ عِلْمِهِ إِلاَّ بِمَا شَاء وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالأَرْضَ وَلاَ يَؤُودُهُ حِفْظُهُمَا وَهُوَ الْعَلِيُّ الْعَظِيمُ.",
                            fontS: 25,
                            textDirection: TextDirection.rtl,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF086788),
                              onPrimary: Color(0xFF9CAFB7),
                              shadowColor: Colors.grey[400],
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  10.0,
                                ),
                              ),
                              minimumSize: Size(100, 40),
                            ),
                            child: AmiriText(
                              text: "إعادة",
                              fontS: 18,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              decrmentQuantity();
                              if (quantityCount == 0) {
                                setState(() {
                                  _colorCard = Colors.white;
                                });
                              }
                            },
                          ),
                          Text(
                            quantityCount.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF062726),
                              onPrimary: Color(0xFF66A182),
                              shadowColor: Colors.grey[400],
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  10.0,
                                ),
                              ),
                              minimumSize: Size(100, 40),
                            ),
                            child: AmiriText(
                              text: "تسبيح",
                              fontS: 18,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              incrementQuantity();
                              setState(() {
                                _colorCard = Colors.lightGreen.shade100;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
