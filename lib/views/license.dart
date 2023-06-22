import 'package:flutter/material.dart';

import '../app_theme.dart';

class LicenseScreen extends StatefulWidget {
  const LicenseScreen({super.key});

  @override
  State<LicenseScreen> createState() => _LicenseScreenState();
}

class _LicenseScreenState extends State<LicenseScreen> {
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
                const SizedBox(height: 50,),
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                        ),
                        color: AppTheme.notWhite,
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(height: 20,),
                        Text("BatchGrabber License", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.deepOrange),),
                        SizedBox(height: 20,),
                        Text("Features", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                        SizedBox( height: 20,),
                        Text("Fastest bot available", style: TextStyle(fontSize: 18),),
                        SizedBox( height: 10,),
                        Text("Instantly accept batches", style: TextStyle(fontSize: 18),),
                        SizedBox(height: 10,),
                        Text("Customizable filters", style: TextStyle(fontSize: 18),),
                        SizedBox(height: 10,),
                        Text("No jailbreak required", style: TextStyle(fontSize: 18),),
                        SizedBox(height: 10,),
                      ],
                    )
                ),
                const SizedBox(height: 30,),
                MaterialButton(
                  color: Theme.of(context).primaryColor,
                  height: 20,
                  minWidth: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Theme.of(context).primaryColor)),
                  child: const Text("Free 3 Day Trial", style: TextStyle(color: Colors.white, fontSize: 20),),
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      content: Container(
                        height: 400,
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            SizedBox(height: 20,),
                            Text("Trial License Activated!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                            SizedBox(height: 20,),
                            Text("Your trial license has been successfully activated. If this is your first time using BatchFinder, I recommended reading through the Setup Guide on the main BatchFinder Page.",
                              style: TextStyle(fontSize: 18),),
                            SizedBox(height: 20,),
                            Text("Question? Contact @BatchFinderDev on Telegram", style: TextStyle(fontSize: 18),),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Close'),
                          child: const Text('Close', style: TextStyle(fontSize: 18),),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                MaterialButton(
                  color: Theme.of(context).primaryColor,
                  height: 20,
                  minWidth: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Theme.of(context).primaryColor)),
                  child: const Text("1 Day", style: TextStyle(color: Colors.white, fontSize: 20),),
                  onPressed: () async {
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContactScreen()));
                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SetupScreen()));
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
                  child: const Text("7 Day", style: TextStyle(color: Colors.white, fontSize: 20),),
                  onPressed: () async {
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContactScreen()));
                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SetupScreen()));
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
                  child: const Text("30 Day", style: TextStyle(color: Colors.white, fontSize: 20),),
                  onPressed: () async {
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContactScreen()));
                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SetupScreen()));
                  },
                ),
                const SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
