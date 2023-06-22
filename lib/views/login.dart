import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instabot/views/navigation_home.dart';
import 'package:pinput/pinput.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController phoneNumber = TextEditingController();
  TextEditingController otp = TextEditingController();
  PhoneNumber number = PhoneNumber(isoCode: 'US');
  bool visible = false;
  String? mobile;
  bool is_phone = false;
  bool is_valid = true;
  bool isLoading = false;

  // @override
  // void dispose() {
  //   phoneNumber.dispose();
  //   otp.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Phone Verification'),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 70,),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InternationalPhoneNumberInput(
                          onInputChanged: (PhoneNumber number) {
                            mobile = number.phoneNumber;
                          },
                          onInputValidated: (bool value) {
                            is_phone = value;
                          },
                          selectorConfig: const SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          ),
                          maxLength: 12,
                          ignoreBlank: false,
                          autoValidateMode: AutovalidateMode.disabled,
                          selectorTextStyle: const TextStyle(color: Colors.black),
                          initialValue: number,
                          textFieldController: phoneNumber,
                          formatInput: true,
                          keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
                          inputBorder: const OutlineInputBorder(),
                        ),
                      ],
                    ),
                  ),
                ),
                is_valid ? const SizedBox(height: 12,) : const Text(
                  "Invalid phone number",
                  style: TextStyle(fontSize: 12, color: Colors.redAccent),),
                const Text(
                  "By entering your phone number, you opt into receiveing a one-time SMS message containing a verification code.",
                  style: TextStyle(fontSize: 15),),
                const SizedBox(height: 20,),
                visible ? Container(
                  height: 100,
                  padding: const EdgeInsets.all(30.0),
                  child: Pinput(
                    length: 6,
                    defaultPinTheme: defaultPinTheme,
                    controller: otp,
                    pinAnimationType: PinAnimationType.fade,
                  ),
                ) : const SizedBox(),
                !visible ? SendOTPButton("Login & Create Account") : SubmitOTPButton("Verify"),
                const SizedBox(height: 20,),
                isLoading ? Center(child: CircularProgressIndicator()) : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget SendOTPButton(String text) => ElevatedButton(
    onPressed: () async {
      if(is_phone == true){
        setState(() {
          visible = !visible;
          is_valid = true;
        });
      } else{
        setState(() {
          is_valid = false;
        });
      }
    },
    child: Text(text, style: TextStyle(color: Colors.white, fontSize: 20),),
  );

  Widget SubmitOTPButton(String text) => ElevatedButton(
    onPressed: () async {
      setState(() {
        isLoading = !isLoading;
      });
      FirebaseAuth auth = FirebaseAuth.instance;
      await auth.verifyPhoneNumber(
        phoneNumber: mobile,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential).then((authResult) {
            print(authResult.user);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavigationHome()));
          });
        },
        verificationFailed: (FirebaseAuthException e) async {
          if (e.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
          }
        },
        codeSent: (String verificationId, int? resendToken) async {
          String smsCode = otp.text.trim();
          // Create a PhoneAuthCredential with the code
          PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
          // Sign the user in (or link) with the credential
          await auth.signInWithCredential(credential).then((authResult) {
            print(authResult.user);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavigationHome()));
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    },
    child: Text(text, style: TextStyle(color: Colors.white, fontSize: 20),),
  );
}
