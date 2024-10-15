import 'package:flutter/material.dart';
import 'package:submission_dicoding_flutter/login_screen.dart';

class StartedScreen extends StatefulWidget {
  const StartedScreen({super.key});

  @override
  _StartedScreenState createState() => _StartedScreenState();
}

class _StartedScreenState extends State<StartedScreen> {
  double _titleOpacity = 0.0;
  double _descriptionOpacity = 0.0;
  double _buttonOpacity = 0.0;
  double _overlayOpacity = 0.4;
  double _buttonPadding = 20.0;

  @override
  void initState() {
    super.initState();
    _animateTitle();
    _animateOverlay();
  }

  void _animateTitle() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      _titleOpacity = 1.0;
    });
  }

  void _animateOverlay() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      _overlayOpacity = 0.6;
    });
    _animateDescriptionAndButton();
  }

  void _animateDescriptionAndButton() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      _descriptionOpacity = 1.0;
    });
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _buttonOpacity = 1.0;
      _buttonPadding = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bool isWeb = constraints.maxWidth > 600;
          return isWeb
              ? StartedScreenWebPage(
                  titleOpacity: _titleOpacity,
                  descriptionOpacity: _descriptionOpacity,
                  buttonOpacity: _buttonOpacity,
                  overlayOpacity: _overlayOpacity,
                  buttonPadding: _buttonPadding,
                )
              : StartedScreenMobilePage(
                  titleOpacity: _titleOpacity,
                  descriptionOpacity: _descriptionOpacity,
                  buttonOpacity: _buttonOpacity,
                  overlayOpacity: _overlayOpacity,
                  buttonPadding: _buttonPadding,
                );
        },
      ),
    );
  }
}

class StartedScreenMobilePage extends StatelessWidget {
  final double titleOpacity;
  final double descriptionOpacity;
  final double buttonOpacity;
  final double overlayOpacity;
  final double buttonPadding;

  const StartedScreenMobilePage({
    super.key,
    required this.titleOpacity,
    required this.descriptionOpacity,
    required this.buttonOpacity,
    required this.overlayOpacity,
    required this.buttonPadding,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Image.asset(
            'assets/images/splash.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: AnimatedOpacity(
            opacity: overlayOpacity,
            duration: const Duration(seconds: 1),
            child: Container(
              color: Colors.black.withOpacity(overlayOpacity),
            ),
          ),
        ),
        SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.1),
                child: AnimatedOpacity(
                  opacity: titleOpacity,
                  duration: const Duration(seconds: 1),
                  child: AppBar(
                    title: const Text('Travel Tour App'),
                    titleTextStyle: const TextStyle(
                      fontSize: 36,
                      color: Colors.white54,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                ),
              ),
              const Spacer(),
              AnimatedOpacity(
                opacity: descriptionOpacity,
                duration: const Duration(seconds: 1),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Explore the world with us. Discover new places and adventures.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontFamily: 'Nunito',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              AnimatedPadding(
                padding: EdgeInsets.only(bottom: buttonPadding),
                duration: const Duration(seconds: 1),
                child: AnimatedOpacity(
                  opacity: buttonOpacity,
                  duration: const Duration(seconds: 1),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const LoginScreen();
                      }));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amberAccent,
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.3, vertical: 15),
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ],
    );
  }
}

class StartedScreenWebPage extends StatelessWidget {
  final double titleOpacity;
  final double descriptionOpacity;
  final double buttonOpacity;
  final double overlayOpacity;
  final double buttonPadding;

  const StartedScreenWebPage({
    super.key,
    required this.titleOpacity,
    required this.descriptionOpacity,
    required this.buttonOpacity,
    required this.overlayOpacity,
    required this.buttonPadding,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/splash.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned.fill(
          child: AnimatedOpacity(
            opacity: overlayOpacity,
            duration: const Duration(seconds: 1),
            child: Container(
              color: Colors.black.withOpacity(overlayOpacity),
            ),
          ),
        ),
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.1),
                  child: AnimatedOpacity(
                    opacity: titleOpacity,
                    duration: const Duration(seconds: 1),
                    child: AppBar(
                      title: const Text(
                        'Travel Tour App',
                      ),
                      titleTextStyle: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        color: Colors.white54,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(top: 100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AnimatedOpacity(
                        opacity: descriptionOpacity,
                        duration: const Duration(seconds: 1),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            'Explore the world with us. Discover new places and adventures. '
                            'Join our community of travelers and share your experiences. '
                            'Find the best travel deals and tips to make your journey unforgettable.',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.03,
                                color: Colors.white,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      AnimatedOpacity(
                        opacity: descriptionOpacity,
                        duration: const Duration(seconds: 1),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            'Our app offers a wide range of features to enhance your travel experience. '
                            'From personalized recommendations to real-time updates, we have everything you need to make your trip memorable. '
                            'Join millions of satisfied travelers who trust our app for their adventures.',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.0150,
                              color: Colors.white,
                              fontFamily: 'Nunito',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 20),
                        child: AnimatedPadding(
                          padding: EdgeInsets.only(bottom: buttonPadding),
                          duration: const Duration(seconds: 1),
                          child: AnimatedOpacity(
                            opacity: buttonOpacity,
                            duration: const Duration(seconds: 1),
                            child: IntrinsicWidth(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return const LoginScreen();
                                  }));
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: Colors.amberAccent,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              0.02),
                                  textStyle: const TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                child: const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Get Started',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
