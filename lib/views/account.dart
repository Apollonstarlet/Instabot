import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../app_theme.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(flex: 2, child: _TopPortion()),
          SizedBox(height: 30,),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton.extended(
                        onPressed: () {},
                        heroTag: 'follow',
                        elevation: 0,
                        label: const Text("+1 856-434-8867"),
                        icon: const Icon(Icons.phone),
                      ),
                      SizedBox(height: 10,),
                      FloatingActionButton.extended(
                        onPressed: () async {
                          await Clipboard.setData(ClipboardData(text: "HQ-KH-50"));
                          // if (!mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text('Copied to clipboard'),
                          ));
                        },
                        heroTag: 'follow',
                        elevation: 0,
                        label: const Text("HQ-KH-50"),
                        icon: const Icon(Icons.copy),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
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