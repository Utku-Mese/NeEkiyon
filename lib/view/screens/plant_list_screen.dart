import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ne_ekiyo/utils/constants.dart';
import 'package:ne_ekiyo/view/widgets/plant_card_small_widget.dart';

class PlantListScreen extends StatelessWidget {
  const PlantListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sebze & Meyve",
                style: GoogleFonts.montserrat(
                    fontSize: 25, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                width: 200,
                child: Divider(
                  height: 2,
                  thickness: 1,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 390,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                  ),
                  itemCount: 9,
                  itemBuilder: (BuildContext ctx, index) {
                    return smallPlantCard();
                  },
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Diğer bitki Çeşitleri"),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Saksı Bitkileri",
                style: GoogleFonts.montserrat(
                    fontSize: 25, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                width: 200,
                child: Divider(
                  height: 2,
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
                  itemCount: 9,
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
