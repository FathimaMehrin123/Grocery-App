import 'package:flutter/material.dart';
import 'package:grocery_app/constants/appcolor.dart';
import 'package:grocery_app/constants/apptext.dart';
import 'package:grocery_app/screens/loginscreen.dart';
import 'package:grocery_app/screens/mainscreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 100, backgroundColor: Colors.green.shade100,
            backgroundImage: AssetImage('assets/images/splashimage.jpeg')),
            SizedBox(height: 30),
            Column(
              children: [
                const AppText(
                  text: 'Shape your',
                  size: 26,
                  color: AppColors.splashText,
                  weight: FontWeight.bold,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   AppText(
                      text: 'daily ',
                      size: 26,
                      color: AppColors.splashText,
                      weight: FontWeight.bold,
                    ),
                    AppText(
                      text: 'needs',
                      size: 26,
                      color: AppColors.primary,
                      weight: FontWeight.bold,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                       Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => Loginscreen()),
);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: Text('Get Started',style: TextStyle(color:  Colors.white),),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
