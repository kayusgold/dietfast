import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPage extends StatefulWidget {
  OnboardingPage({Key key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  SharedPreferences _preferences;

  void updateFirstRunInSharedPreferences() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.setBool('isNotFirstRun', true);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    debugPrint("Screen Resolution $height x $width");
    return Scaffold(
        body: PageView(
      physics: ClampingScrollPhysics(),
      controller: _pageController,
      onPageChanged: (int page) {
        setState(() {
          _currentPage = page;
        });
      },
      children: <Widget>[
        EachPage(
          title: "best tip for your diet",
          image: "assets/images/unsplash.png",
          numPages: 3,
          currentPage: 0,
          controller: _pageController,
          callback: () {},
        ),
        EachPage(
          title: "exercise every morning",
          image: "assets/images/fruits.jpg",
          numPages: 3,
          currentPage: 1,
          controller: _pageController,
          callback: () {},
        ),
        EachPage(
          title: "have enough sleep",
          image: "assets/images/salad.jpg",
          numPages: 3,
          currentPage: 2,
          controller: _pageController,
          callback: updateFirstRunInSharedPreferences,
        ),
      ],
    ));
  }
}

class EachPage extends StatelessWidget {
  final String title;
  final String image;
  final int numPages;
  final int currentPage;
  final PageController controller;
  final Function callback;

  const EachPage(
      {Key key,
      this.title,
      this.image,
      this.numPages,
      this.currentPage,
      this.controller,
      this.callback})
      : super(key: key);

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: isActive ? 12.0 : 8.0,
      width: isActive ? 12.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? Color(0xFF61D27C) : Color(0xFFA2B8A6),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  List<Widget> _pageIndicators() {
    List<Widget> list = [];
    for (int i = 0; i < numPages; i++) {
      list.add(i == currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Container(
          width: width,
          height: height * .675,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: height * 0.69,
            child: Stack(
              children: <Widget>[
                Container(
                  constraints: BoxConstraints.expand(),
                  child: Image(
                    image: AssetImage("assets/images/path_1.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Container(
                    constraints: BoxConstraints.expand(),
                    child: Image(
                      image: AssetImage("assets/images/path_2.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: height * 0.37,
                    width: width,
                    // decoration: BoxDecoration(
                    //   border: Border.all(color: Colors.red, width: 4),
                    // ),
                    child: Padding(
                      padding: height < 600
                          ? const EdgeInsets.only(left: 10.0)
                          : const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: _pageIndicators(),
                          ),
                          Padding(
                            padding: height < 600
                                ? const EdgeInsets.only(
                                    left: 8.0,
                                    right: 8.0,
                                    top: 10.0,
                                    bottom: 2.0)
                                : const EdgeInsets.only(
                                    left: 8.0,
                                    right: 8.0,
                                    top: 40.0,
                                    bottom: 20.0),
                            child: Text(
                              title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                              ),
                            ),
                          ),
                          Padding(
                            padding: height < 600
                                ? EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 0.0)
                                : EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0),
                            child: new Text(
                              "in my implementation I put this inside a row and surrounded it with sized boxes on each side so that I have some space between my elements, why using expanded you may ask, well it's used to take as much space as possible so the text would look good in portrait or landscape mode. in my implementation I put this inside a row and surrounded it with sized boxes on each side so that I have some space between my elements, why using expanded you may ask, well it's used to take as much space as possible so the text would look good in portrait or landscape mode.",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: new TextStyle(
                                  fontSize: 14.0, color: Colors.grey),
                              maxLines: 4,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Skip step",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF61D27C),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: height < 600
                                        ? const EdgeInsets.symmetric(
                                            horizontal: 32.0, vertical: 5.0)
                                        : const EdgeInsets.symmetric(
                                            horizontal: 32.0, vertical: 15.0),
                                    child: currentPage != numPages - 1
                                        ? GestureDetector(
                                            onTap: () {
                                              controller.nextPage(
                                                duration:
                                                    Duration(milliseconds: 500),
                                                curve: Curves.ease,
                                              );
                                            },
                                            child: Text(
                                              "Next",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        : GestureDetector(
                                            onTap: () {
                                              callback();
                                              Navigator.pushReplacementNamed(
                                                  context, '/');
                                            },
                                            child: Text(
                                              "Get Started",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
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
