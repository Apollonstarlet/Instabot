import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import 'app.dart';

class BatchScreen extends StatefulWidget {
  const BatchScreen({super.key});

  @override
  State<BatchScreen> createState() => _BatchScreenState();
}

class _BatchScreenState extends State<BatchScreen> {

  final TextEditingController _pinPutController = TextEditingController();

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50,),
                const Text("BatchGrabber Setup", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                const SizedBox(height: 10,),
                const Text("Please log out of the Shopper app before linking your account here", style: TextStyle(fontSize: 18),),
                const SizedBox(height: 10,),
                Container(
                  width: MediaQuery.of(context).size.width*0.5,
                  child: MaterialButton(
                    color: Theme.of(context).primaryColor,
                    height: 20,
                    minWidth: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Theme.of(context).primaryColor)),
                    child: const Text("LINK ACCOUNT", style: TextStyle(color: Colors.white, fontSize: 18),),
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Please enter code'),
                        content: Container(
                          height: 90,
                          padding: const EdgeInsets.all(30.0),
                          child: Pinput(
                            length: 6,
                            defaultPinTheme: defaultPinTheme,
                            controller: _pinPutController,
                            pinAnimationType: PinAnimationType.fade,
                            onSubmitted: (pin) async {
                              try {
                                print("start");
                                // await FirebaseAuth.instance
                                //     .signInWithCredential(PhoneAuthProvider.credential(
                                //     verificationId: _verificationCode!, smsCode: pin))
                                //     .then((value) async {
                                //   if (value.user != null) {
                                //     Navigator.pushAndRemoveUntil(
                                //         context,
                                //         MaterialPageRoute(builder: (context) => Home()),
                                //             (route) => false);
                                //   }
                                // });
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                              }
                            },
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () async {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => AppScreen()));
                            },
                            child: const Text('Verify'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                const Text("My promiss as a developer:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                const SizedBox(height: 10,),
                const Text("BatchGrabber can only view and accept batches", style: TextStyle(fontSize: 18),),
                const Text("BatchGrabber will never access anything else", style: TextStyle(fontSize: 18),),
                const Text("Account data is deleted immediately after use", style: TextStyle(fontSize: 18),),
                const Text("All BatchGrabber features are extensively tested", style: TextStyle(fontSize: 18),),
                const Text("BatchGrabber has been undetectable for 2+ years", style: TextStyle(fontSize: 18),),
                const Text("BatchGrabber has been working for 2+ years", style: TextStyle(fontSize: 18),),
                const SizedBox(height: 10,),
                const Text("Your account's secuity is my priority as a developer and I have worked constantly to upload this for past 2 years", style: TextStyle(fontSize: 18),),
                const SizedBox(height: 10,),
                const Text("If you have any questions or concerns, please contact me on Telegram @BatchGrabberDev", style: TextStyle(fontSize: 18),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
