import 'package:flutter/material.dart';
import 'package:ne_ekiyo/utils/constants.dart';
import 'package:ne_ekiyo/view/screens/info_screen.dart';
import 'package:ne_ekiyo/view/screens/plant_list_screen.dart';
import 'package:ne_ekiyo/view/widgets/plant_card_widget.dart';
import 'package:ne_ekiyo/view/widgets/search_bar_widget.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const MySearcBar(),
      ),
      bottomNavigationBar: GNav(
          selectedIndex: selectedIndex,
          onTabChange: (value) {
            setState(() {
              selectedIndex = value;
            });
            pageController.animateToPage(selectedIndex,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOutQuad);
          },
          curve: Curves.slowMiddle,
          duration: const Duration(milliseconds: 200),
          gap: 8,
          color: Colors.grey[700],
          activeColor: Colors.green,
          iconSize: 32,
          tabBackgroundColor: Colors.green.withOpacity(0.1),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.search,
              text: 'Search',
            ),
            GButton(
              icon: Icons.list,
              text: 'List',
            ),
          ]),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: <Widget>[
          const MainScreen(),
          Container(child: const Center(child: Text("Search Screen"))),
          const PlantListScreen(),
        ],
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InfoScreen(
                    index: index,
                  ),
                ),
              );
            },
            child: PlantCard(
              index: index,
            ),
          );
        },
      ),
    );
  }
}
