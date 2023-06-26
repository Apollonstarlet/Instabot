import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../app_theme.dart';

class FriendScreen extends StatefulWidget {
  const FriendScreen(this.user, {super.key});
  final User user;

  @override
  State<FriendScreen> createState() => _FriendScreenState();
}

class _FriendScreenState extends State<FriendScreen> {
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
                const Text("Invite Your Friends", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35), ),
                const SizedBox(height: 20,),
                const Text("Your referral link(click to copy)", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                const SizedBox(height: 10,),
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: FloatingActionButton.extended(
                      onPressed: () async {
                        await Clipboard.setData(ClipboardData(text: "www.avalon.rip?ref=HQ-KH-50"));
                        // if (!mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Copied to clipboard'),
                        ));
                      },
                      heroTag: 'follow',
                      elevation: 0,
                      label: const Text("www.avalon.rip?ref=HQ-KH-50"),
                      icon: const Icon(Icons.copy),
                    ),
                ),
                const SizedBox(height: 20,),
                const Text("Share this link with friends", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                const SizedBox(height: 10,),
                const Text("1. Creates an account using your link", style: TextStyle( fontSize: 20),),
                const Text("2. Accepts a batch using BactchFinder", style: TextStyle( fontSize: 20),),
                const SizedBox(height: 10,),
                const Text("You get a free 7-day license!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                const SizedBox(height: 30,),
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
                        Text("No Referrals Yet", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                        SizedBox(height: 10,),
                        Text("Make your first one today!", style: TextStyle(fontSize: 20),),
                        SizedBox( height: 20,),
                      ],
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class _TopPortion extends StatelessWidget {
  const _TopPortion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 50),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 150,
            height: 150,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: AppTheme.grey.withOpacity(0.6),
                          offset: const Offset(2.0, 4.0),
                          blurRadius: 8),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius:
                    const BorderRadius.all(Radius.circular(75.0)),
                    child: Image.asset('assets/images/userImage.png'),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
