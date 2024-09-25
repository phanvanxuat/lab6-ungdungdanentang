import 'package:flutter/material.dart';
import 'package:lab6/screens/login_screen.dart';
import 'package:lab6/screens/registration_screen.dart';
import 'package:flutter_animate/flutter_animate.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),

      vsync: this,
    );
    // animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation = ColorTween(begin: Colors.red, end: Colors.blue).animate(controller);


    controller.forward();
    controller.addListener((){
      setState(() {

      });
      print(controller.value);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                Text(
                  'Flash Class',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ).animate()
                    .fadeIn(duration: 600.ms)
                    .then(delay: 200.ms) // baseline=800ms
                    .slide()

                ,
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            new RoundButton(colour: Colors.lightBlueAccent, title: 'Log In', onPressed: (){
              Navigator.pushNamed(context, LoginScreen.id);
            }),
            new RoundButton(colour: Colors.lightBlueAccent, title: 'Register', onPressed: (){
              Navigator.pushNamed(context, RegistrationScreen.id);
            }),
          ],
        ),
      ),
    );
  }
}
