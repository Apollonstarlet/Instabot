import 'package:flutter/material.dart';
import 'package:instabot/views/contact.dart';
import 'package:instabot/views/setup.dart';
import 'package:instabot/views/video.dart';

import '../app_theme.dart';
import 'login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 70,),
                const Text("Welcome to Instabot", style: AppTheme.display1,),
                Image.asset("assets/images/logo.png", height: 250, width: double.infinity,),
                const SizedBox(height: 20,),
                MaterialButton(
                  color: Theme.of(context).primaryColor,
                  height: 20,
                  minWidth: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Theme.of(context).primaryColor)),
                  child: const Text("Login", style: TextStyle(color: Colors.white, fontSize: 20),),
                  onPressed: () async {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                ),
                const SizedBox(height: 10,),
                MaterialButton(
                  color: Theme.of(context).primaryColor,
                  height: 20,
                  minWidth: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Theme.of(context).primaryColor)),
                  child: const Text("Setup Guide", style: TextStyle(color: Colors.white, fontSize: 20),),
                  onPressed: () async {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SetupScreen()));
                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                ),
                const SizedBox(height: 10,),
                MaterialButton(
                  color: Theme.of(context).primaryColor,
                  height: 20,
                  minWidth: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Theme.of(context).primaryColor)),
                  child: const Text("Contact", style: TextStyle(color: Colors.white, fontSize: 20),),
                  onPressed: () async {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContactScreen()));
                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SetupScreen()));
                  },
                ),
                const SizedBox(height: 10,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
