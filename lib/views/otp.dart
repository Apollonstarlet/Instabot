import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import 'dashboard.dart';

class OTPScreen extends StatefulWidget {
  final String phone;
  const OTPScreen(this.phone, {super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {

  final TextEditingController _pinPutController = TextEditingController();

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Center(
              child: Text(
                'Verify +1-${widget.phone}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Pinput(
              length: 6,
              defaultPinTheme: defaultPinTheme,

              controller: _pinPutController,

              pinAnimationType: PinAnimationType.fade,
              onSubmitted: (pin) async {
                try {
                  print("start");
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
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
          )
        ],
      ),
    );
  }
}
