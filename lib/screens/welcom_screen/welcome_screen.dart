import 'package:flutter/material.dart';
import 'package:my_food_app/screens/explore_restaurant_screen/explore_restaurant_screen.dart';
import 'package:my_food_app/screens/onboarding1_screen/onboarding1_screen.dart';
import 'package:my_food_app/screens/onboarding2_screen/onboarding2_screen.dart';
import 'package:my_food_app/screens/onboarding_screen/onboarding_screen.dart';

enum BodyUsage { Tab, Bottom }

var usage = BodyUsage.Tab;

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  List<Widget> screens = [
    OnboardingScreen(),
    Onboarding1Screen(),
    Onboarding2Screen()
  ];
  int selectedIndex = 0;
  TabController? tabBarController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(
            child: Text('Facebook'),
          ),
          bottom: TabBar(
              onTap: (index) {
                usage = BodyUsage.Tab;
                setState(() {});
              },
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.home),
                  text: "home",
                ),
                Tab(
                  icon: Icon(Icons.notifications),
                  text: "notification",
                ),
                Tab(
                  icon: Icon(Icons.child_friendly_sharp),
                  text: 'frndrequest',
                ),
              ]),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.black54,
          iconSize: 39,
          elevation: 10,
          unselectedItemColor: Colors.white,
          onTap: (index) {
            usage = BodyUsage.Bottom;
            selectedIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              label: 'photos',
              icon: Icon(Icons.photo_album),
            ),
            BottomNavigationBarItem(
              label: 'video',
              icon: Icon(Icons.video_file),
            ),
            BottomNavigationBarItem(
              label: 'files',
              icon: Icon(Icons.file_present),
            )
          ],
        ),
        body: usage == BodyUsage.Tab
            ? TabBarView(
                children: <Widget>[
                  ExploreRestaurantScreen(),
                  // Notifications(),
                  // FriendsRequest(),
                ],
              )
            : screens[selectedIndex],
      ),
    );
  }
}
