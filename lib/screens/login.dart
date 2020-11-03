import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void udpateSharedPerenferences() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.setString("username", "username");
    _preferences.setString("password", "password");
  }

  Future<bool> _askAndCloseTheApp(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), //this right here
          child: Container(
            height: 180,
            child: Padding(
              padding: const EdgeInsets.only(left: 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.notification_important,
                              size: 45, color: Color(0xFF23233C)),
                          Text(
                            "Exit Notification",
                            style: TextStyle(
                              color: Color(0xFF23233C),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Text("Do you wan't to exit the app now?"),
                  ),
                  SizedBox(height: 24),
                  Center(
                    child: SizedBox(
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          RaisedButton(
                            onPressed: () {
                              Navigator.pop(context, true);
                              //return true;
                            },
                            child: Text(
                              "Yes",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: const Color(0xFF61D27C),
                          ),
                          RaisedButton(
                            onPressed: () {
                              Navigator.pop(context, false);
                              //return false;
                            },
                            child: Text(
                              "No",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: const Color(0xFF23233C),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    debugPrint("Screen Resolution $height x $width");
    return Scaffold(
      backgroundColor: Color(0xFFF4F5FA),
      body: WillPopScope(
        onWillPop: () => _askAndCloseTheApp(context),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _myImageBackground(
                asset: "assets/images/loginhead.png",
                height: height * .25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Container(
                  width: width,
                  height: height * .50,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Welcome",
                        style: TextStyle(
                          color: Color(0xFF23233C),
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 10.0),
                        child: Material(
                          elevation: 5.0,
                          shadowColor: Color(0xFF23233C),
                          child: TextFormField(
                            autofocus: false,
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.check_circle,
                                color: Colors.green,
                                size: 16,
                              ),
                              hintText: 'mauricio@divelement.io',
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
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 20.0),
                        child: Material(
                          elevation: 5.0,
                          shadowColor: Color(0xFF23233C),
                          child: TextFormField(
                            obscureText: true,
                            autofocus: false,
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.remove_red_eye,
                                color: Colors.grey[400],
                                size: 16,
                              ),
                              hintText: '**********',
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
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Forgot your password?",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 15.0, left: 18.0, right: 18.0),
                        child: GestureDetector(
                          onTap: () {
                            // udpateSharedPerenferences();
                            Navigator.pushNamed(context, '/home');
                          },
                          child: Container(
                            height: 50,
                            width: width,
                            decoration: BoxDecoration(
                              color: Color(0xFF23233C),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Text(
                          "Don't have an account? Sign Up",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(15),
                            width: 80,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                            ),
                            child: Image(
                              image: AssetImage("assets/images/facebook.png"),
                            ),
                          ),
                          SizedBox(width: 20),
                          Container(
                            padding: EdgeInsets.all(15),
                            width: 80,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                            ),
                            child: Image(
                              image: AssetImage("assets/images/google.png"),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              _myImageBackground(
                asset: "assets/images/loginfooter.png",
                height: height * .25,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _myImageBackground({String asset, double height}) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(asset),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
