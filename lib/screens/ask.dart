import 'package:flutter/material.dart';

class AskPage extends StatefulWidget {
  AskPage({Key key}) : super(key: key);

  @override
  _AskPageState createState() => _AskPageState();
}

class _AskPageState extends State<AskPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFF4F5FA),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: width,
              height: height * 0.22,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/askheader.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: width * .5,
              height: height * 0.22,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/workout.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 35),
            RichText(
              text: TextSpan(
                text: "Let's do your diet ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'katy',
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 28.0),
              child: Column(
                children: <Widget>[
                  Material(
                    elevation: 5.0,
                    shadowColor: Color(0xFF23233C),
                    child: TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: 'What is your current weight?',
                        fillColor: Colors.white,
                        filled: true,
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide:
                              BorderSide(color: Colors.white, width: 3.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Material(
                    elevation: 5.0,
                    shadowColor: Color(0xFF23233C),
                    child: TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: 'What is your current height?',
                        fillColor: Colors.white,
                        filled: true,
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide:
                              BorderSide(color: Colors.white, width: 3.0),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              height: height * 0.11,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          child: Text("1/4 steps"),
                          width: width * 0.25,
                        ),
                        SizedBox(
                          width: width * 0.25,
                          child: Container(
                            width: 55,
                            height: 55,
                            child: MaterialButton(
                              shape: CircleBorder(
                                side: BorderSide(
                                  width: 2,
                                  color: Colors.transparent,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Icon(Icons.chevron_right),
                              color: Color(0xFF23233C),
                              textColor: Colors.white,
                              onPressed: () {},
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.25,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: width * 0.25,
                        ),
                        Text("Next"),
                        SizedBox(
                          width: width * 0.25,
                        ),
                      ],
                    ),
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
