import 'package:dietfast/model/activity_result_model.dart';
import 'package:dietfast/model/food.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  int _currentTabIndex = 0;
  List<Result> resultData = []
    ..add(Result(title: "Results of the week", level: 8, lost: -4, weight: 520))
    ..add(Result(title: "Your information", level: 8, lost: -4, weight: 520));
  List<String> tabHeadings = []
    ..add("Breakfast")
    ..add("Foods")
    ..add("Dinner")
    ..add("Lunch");
  int _tabIndex = 0;

  List<Food> foods = []
    ..add(new Food(image: "assets/images/food1.jpg", title: "Fruits Salad Mix"))
    ..add(
        new Food(image: "assets/images/food2.jpg", title: "Yogurt with Fruits"))
    ..add(new Food(
        image: "assets/images/food3.jpg", title: "Yogurt with Fruits"));
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color(0xFFF4F5FA),
        body: Column(
          children: <Widget>[
            Container(
              width: width,
              height: height * 0.12,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/homeheader.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 8.0, left: 24.0, right: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Activity",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 32,
                      ),
                    ],
                  ),
                  Text(
                    "Today, 2 October 2020",
                    style: TextStyle(
                      fontSize: 9.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            productsCard(width),
            SizedBox(height: 20),
            tabsHeadingsView(),
            Expanded(child: bigFoodSample()),
          ],
        ),
        bottomNavigationBar: bottomNavigation());
  }

  Widget bigFoodSample() {
    return Container(
      child: PageView.builder(
        itemCount: foods.length,
        controller: PageController(viewportFraction: 0.6),
        onPageChanged: (int index) => setState(() => _index = index),
        itemBuilder: (_, i) {
          return Transform.scale(
            scale: i == _index ? 1 : 0.9,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFDEE2EC),
                    offset: Offset(0.1, 0.1),
                    blurRadius: 35,
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/details');
                },
                child: Hero(
                  tag: "hero$i",
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: ClipRRect(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(foods[i].image),
                                fit: BoxFit.fill,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFA2B8A6),
                                  offset: Offset(0.1, 0.1),
                                  blurRadius: 8,
                                )
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18)),
                            ),
                            child: Stack(
                              children: <Widget>[
                                //Image.asset(foods[i].image),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0xFFA2B8A6),
                                              offset: Offset(0.1, 0.1),
                                              blurRadius: 8,
                                            ),
                                          ]),
                                      child: Icon(
                                        Icons.arrow_forward,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(18),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        foods[i].title,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget tabsHeadingsView() {
    return Container(
      height: 50,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 16, right: 16),
        scrollDirection: Axis.horizontal,
        itemCount: tabHeadings.length,
        itemBuilder: (BuildContext context, int i) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                _tabIndex = i;
              });
            },
            child: Container(
              height: 40,
              width: 110,
              decoration: BoxDecoration(
                  color: (_tabIndex == i) ? Colors.green : Colors.transparent),
              child: Center(
                child: Text(
                  tabHeadings[i],
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight:
                        (_tabIndex == i) ? FontWeight.w600 : FontWeight.w400,
                    color: (_tabIndex == i) ? Colors.white : Color(0xFF23233C),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget productsCard(double width) {
    return Container(
      height: 200.0,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 16, right: 16),
        scrollDirection: Axis.horizontal,
        itemCount: resultData.length,
        itemBuilder: (BuildContext context, int i) => Container(
          width: width * .79,
          child: Stack(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(left: 5.0, bottom: 5.0, right: 8),
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          resultData[i].title,
                          style: TextStyle(
                            color: Color(0xFF23233C),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          height: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'you have lost',
                                    style: TextStyle(
                                      fontSize: 9,
                                      color: Color(0xFF23233C),
                                    ),
                                  ),
                                  Text(
                                    '-4kg',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF61D27C),
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'you level up',
                                    style: TextStyle(
                                      fontSize: 9,
                                      color: Color(0xFF23233C),
                                    ),
                                  ),
                                  Text(
                                    'Level 8',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF61D27C),
                                    ),
                                  ),
                                ],
                              ),
                              CircularPercentIndicator(
                                radius: 60.0,
                                lineWidth: 5.0,
                                percent: 0.38,
                                center: new Text(
                                  "520\nKCal",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF23233C)),
                                ),
                                progressColor: Colors.green,
                              )
                            ],
                          ),
                        ),
                        Center(
                          child: RichText(
                            text: TextSpan(
                              text: "Never give up, ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'know more',
                                  style: TextStyle(
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFA2B8A6),
                            offset: Offset(0.1, 0.1),
                            blurRadius: 8,
                          ),
                        ]),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomNavigation() {
    return Container(
      height: 56,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  _currentTabIndex = 0;
                });
              },
              child: Container(
                padding: EdgeInsets.all(8),
                width: (_currentTabIndex == 0) ? 106 : 48,
                decoration: BoxDecoration(
                  color: (_currentTabIndex == 0)
                      ? Colors.green
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.home,
                        color: (_currentTabIndex == 0)
                            ? Colors.white
                            : Colors.grey),
                    SizedBox(width: 8),
                    (_currentTabIndex == 0)
                        ? Text(
                            "Home",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        : Text(''),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _currentTabIndex = 1;
                });
              },
              child: Container(
                padding: EdgeInsets.all(8),
                width: (_currentTabIndex == 1) ? 106 : 48,
                decoration: BoxDecoration(
                  color: (_currentTabIndex == 1)
                      ? Colors.green
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.supervised_user_circle,
                        color: (_currentTabIndex == 1)
                            ? Colors.white
                            : Colors.grey),
                    SizedBox(width: 8),
                    (_currentTabIndex == 1)
                        ? Text(
                            "Profile",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        : Text(''),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _currentTabIndex = 2;
                });
              },
              child: Container(
                padding: EdgeInsets.all(8),
                width: (_currentTabIndex == 2) ? 106 : 48,
                decoration: BoxDecoration(
                  color: (_currentTabIndex == 2)
                      ? Colors.green
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.card_giftcard,
                        color: (_currentTabIndex == 2)
                            ? Colors.white
                            : Colors.grey),
                    SizedBox(width: 8),
                    (_currentTabIndex == 2)
                        ? Text(
                            "Levels",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        : Text(''),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _currentTabIndex = 3;
                });
              },
              child: Container(
                padding: EdgeInsets.all(8),
                width: (_currentTabIndex == 3) ? 106 : 48,
                decoration: BoxDecoration(
                  color: (_currentTabIndex == 3)
                      ? Colors.green
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.settings,
                        color: (_currentTabIndex == 3)
                            ? Colors.white
                            : Colors.grey),
                    SizedBox(width: 8),
                    (_currentTabIndex == 3)
                        ? Text(
                            "Settings",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        : Text(''),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
