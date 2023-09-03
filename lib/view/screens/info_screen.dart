import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ne_ekiyo/utils/constants.dart';
import 'package:ne_ekiyo/view/widgets/info_properties_widget.dart';
import 'package:ne_ekiyo/view/widgets/plant_card_small_widget.dart';
import 'package:ne_ekiyo/view/widgets/search_bar_widget.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.grey),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const MySearcBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.network(
                  height: 230,
                  width: 230,
                  data["$index"]["images"][0].toString(),
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    data["$index"]["name"],
                    style: GoogleFonts.montserrat(
                        fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                  IconButton(
                    onPressed: () {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.success,
                        animType: AnimType.BOTTOMSLIDE,
                        title: 'Başarıyla kaydedildi',
                        btnOkOnPress: () {},
                      ).show();
                    },
                    icon: const Icon(
                      Icons.bookmark_add_outlined,
                      size: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 160,
                child: Divider(
                  height: 0,
                  thickness: 1,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "${data["$index"]["name"]} İçin Gerekli Bilgiler",
                style: GoogleFonts.montserrat(fontSize: 20),
              ),
              const SizedBox(
                height: 12,
              ),
              infoProperties(
                index,
                Icons.terrain_rounded,
                Colors.brown,
                "dirt",
              ),
              infoProperties(
                index,
                Icons.water_drop_rounded,
                Colors.blue,
                "water",
              ),
              infoProperties(
                index,
                Icons.timer,
                Colors.black,
                "time",
              ),
              infoProperties(
                index,
                Icons.shopping_bag,
                Colors.brown,
                "fertilizer",
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Saksı Bitkileri",
                style: GoogleFonts.montserrat(
                    fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                width: 160,
                child: Divider(
                  height: 0,
                  thickness: 1,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 400,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                  ),
                  itemCount: 6,
                  itemBuilder: (BuildContext ctx, index) {
                    return smallPlantCard();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
