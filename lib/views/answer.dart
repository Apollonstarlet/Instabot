import 'package:flutter/material.dart';

class AnswerScreen extends StatefulWidget {
  const AnswerScreen({super.key});

  @override
  State<AnswerScreen> createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30,),
                Text("What is BatchFinder?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35), ),
                SizedBox(height: 20,),
                Text("BatchFinder is an Instacart Shopper bot", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                SizedBox(height: 10,),
                Text("It will accept high paying and convenient batches", style: TextStyle(fontSize: 15),),
                SizedBox(height: 30,),
                Text("Features", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                SizedBox(height: 20,),
                Text("Automatic:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                Text("BatchFinder accepts high quality batches for you before other users seem them", style: TextStyle(fontSize: 15),),
                SizedBox(height: 20,),
                Text("Customizable:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                Text("Choose what batches you want to accept using filters like Minimum Earnings and Max Distance and more", style: TextStyle(fontSize: 15),),
                SizedBox(height: 20,),
                Text("Convenient:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                Text("Choose a location where you want BatchFinder to search for batches so you can stay home while looking for a batch",
                  style: TextStyle(fontSize: 15),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
