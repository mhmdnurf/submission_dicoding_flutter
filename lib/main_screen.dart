import 'package:flutter/material.dart';
import 'package:submission_dicoding_flutter/detail_screen.dart';
import 'package:submission_dicoding_flutter/model/travel_place.dart';
import 'package:submission_dicoding_flutter/profile_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return const MainScreenWebPage();
          } else {
            return const MainScreenMobilePage();
          }
        },
      ),
    );
  }
}

class MainScreenMobilePage extends StatelessWidget {
  const MainScreenMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: InkWell(
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/user.jpg',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                          cacheWidth: 100,
                          cacheHeight: 100,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const ProfileScreen();
                        }));
                      },
                    ),
                  ),
                  const Text(
                    'Halo, Tarisya Marufi 👋🏻',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Nunito',
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                'Where would you like to visit?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Let's find out!",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 400,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: travelPlaceList.length,
                  itemBuilder: (context, index) {
                    final place = travelPlaceList[index];
                    return Container(
                      width: 250,
                      margin: const EdgeInsets.only(right: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      DetailScreen(place: place),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                const begin = 0.0;
                                const end = 1.0;
                                const curve = Curves.ease;

                                var tween = Tween(begin: begin, end: end)
                                    .chain(CurveTween(curve: curve));
                                var fadeAnimation = animation.drive(tween);

                                return FadeTransition(
                                  opacity: fadeAnimation,
                                  child: child,
                                );
                              },
                            ),
                          );
                        },
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                place.imageAsset,
                                width: double.infinity,
                                height: 400,
                                fit: BoxFit.cover,
                                cacheWidth: 500,
                                cacheHeight: 400,
                              ),
                            ),
                            Positioned(
                              bottom: 7,
                              left: 7,
                              right: 7,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(14),
                                child: Container(
                                  color: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        place.name,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      Text(
                                        place.location,
                                        style: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
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

class MainScreenWebPage extends StatelessWidget {
  const MainScreenWebPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: InkWell(
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/user.jpg',
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                          cacheWidth: 140,
                          cacheHeight: 140,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const ProfileScreen();
                        }));
                      },
                    ),
                  ),
                  const Text(
                    'Halo, Tarisya Marufi 👋🏻',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Nunito',
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Text(
                'Where would you like to visit?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 48,
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                "Let's find out!",
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 3 / 2,
                  ),
                  itemCount: travelPlaceList.length,
                  itemBuilder: (context, index) {
                    final place = travelPlaceList[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    DetailScreen(place: place),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              const begin = 0.0;
                              const end = 1.0;
                              const curve = Curves.ease;

                              var tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));
                              var fadeAnimation = animation.drive(tween);

                              return FadeTransition(
                                opacity: fadeAnimation,
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              place.imageAsset,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                              cacheWidth: 500,
                              cacheHeight: 400,
                            ),
                          ),
                          Positioned(
                            bottom: 7,
                            left: 7,
                            right: 7,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Container(
                                color: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      place.name,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    Text(
                                      place.location,
                                      style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
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
