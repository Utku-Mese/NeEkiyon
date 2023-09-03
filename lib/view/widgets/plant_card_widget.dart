import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ne_ekiyo/utils/constants.dart';
import 'package:ne_ekiyo/view/widgets/properties_row_widget.dart';
import 'package:ne_ekiyo/view/widgets/scrollable_image_widget.dart';

// ignore: must_be_immutable
class PlantCard extends StatelessWidget {
  int index;

  PlantCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 9.0),
      child: Container(
        width: size.width * 0.9,
        height: 222,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(33),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 10.0),
              child: ScrollableImage(
                children: [
                  Image.network(
                    height: 110,
                    width: 110,
                    data["$index"]["images"][0].toString(),
                    fit: BoxFit.contain,
                  ),
                  Image.network(
                    height: 110,
                    width: 110,
                    data["$index"]["images"][1].toString(),
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data["$index"]["name"],
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    //"${data["$index"]["name"]} hakkında daha fazla\nbilgi için tıklayınız...",
                    "Ayrıntılı bilgi için tıkla...",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          propertiesRow(
                            data["$index"]["dirt"] + "\tKg",
                            Icons.terrain_rounded,
                            Colors.brown,
                          ),
                          propertiesRow(
                            data["$index"]["water"] + "\tLt",
                            Icons.water_drop_rounded,
                            Colors.blue,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          propertiesRow(
                            data["$index"]["time"] + "\tGün",
                            Icons.timer,
                            Colors.black,
                          ),
                          propertiesRow(
                            data["$index"]["fertilizer"] + "\tKg",
                            Icons.shopping_bag,
                            Colors.brown,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 150.0),
                    child: IconButton(
                      onPressed: () {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.success,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'Başarıyla kaydedildi',
                          btnOkOnPress: () {},
                        ).show();
                      },
                      icon: const Icon(Icons.bookmark_add_outlined),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
