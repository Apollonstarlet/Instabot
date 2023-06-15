import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  "How do I start?",
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "1. Go to Instabot application on your phone",
                  style:
                  TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "2. Click 'Login' and create an account with your Shopper account phone number",
                  style:
                  TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "3. Click 'License Access' and activate your trial license",
                  style:
                  TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "4. Go back to the home page. Click 'BatchFinder' and then 'Filters'",
                  style:
                  TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "5. Click 'Create New Filter Profile'",
                  style:
                  TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "6. Modify the criteria of the filter. Remember: a batch must fit all of the criteria of a filter to be accepted by BatchFinder",
                  style:
                  TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "7. Click 'Save & Close', then click Back",
                  style:
                  TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "8. Click 'Setup' and follow the setup instructions",
                  style:
                  TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "9. Click 'App' and BatchFinder will start running",
                  style:
                  TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "When BatchFinder Accepts a Batch",
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "1. Drive to the store address displayed on BatchFinder",
                  style:
                  TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "2. Click Start Shopping on BatchFinder",
                  style:
                  TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "3. Log back into the Shopper app",
                  style:
                  TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
