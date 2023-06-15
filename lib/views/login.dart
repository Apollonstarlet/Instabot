import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'navigation_home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final TextEditingController controller = TextEditingController();
    PhoneNumber number = PhoneNumber(isoCode: 'US');

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

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Phone Verification'),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 70,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10))),
                  child: Form(
                    key: formKey,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InternationalPhoneNumberInput(
                            onInputChanged: (PhoneNumber number) {
                              print(number.phoneNumber);
                            },
                            // onInputValidated: (bool value) {
                            //   print(value);
                            // },
                            // selectorConfig: SelectorConfig(
                            //   selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                            // ),
                            ignoreBlank: false,
                            autoValidateMode: AutovalidateMode.disabled,
                            selectorTextStyle: TextStyle(color: Colors.black),
                            initialValue: number,
                            textFieldController: controller,
                            formatInput: true,
                            keyboardType:
                            TextInputType.numberWithOptions(signed: true, decimal: true),
                            inputBorder: OutlineInputBorder(),
                            onSaved: (PhoneNumber number) {
                              print('On Saved: $number');
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "By entering your phone number, you opt into receiveing a one-time SMS message containing a verification code.",
                  style:
                  TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  color: Theme.of(context).primaryColor,
                  height: 20,
                  minWidth: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Theme.of(context).primaryColor)),
                  child: Text(
                    "Login or Create Account",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
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
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavigationHome()));
                          },
                          child: const Text('Verify'),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
