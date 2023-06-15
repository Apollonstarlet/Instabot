import 'package:flutter/material.dart';

import '../app_theme.dart';
import '../helper/authenticate.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {

  String categoryTypeData = "Real";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              Expanded(child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("BatchFinder App", style: AppTheme.headline,),
                    const SizedBox(height: 10,),
                    Text("Available Batches: 1", style: AppTheme.title,),
                    const SizedBox(height: 10,),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, top: 8, bottom: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("\$35.35", textAlign: TextAlign.left,style: AppTheme.headline),
                                    Text("2 Customers", style: AppTheme.title,),
                                    const SizedBox(height: 5,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Icon(Icons.car_crash_sharp,),
                                        const SizedBox(width: 4,),
                                        Text("32.8 mi", style: AppTheme.subtitle,),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 16, top: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text('\$10.17 Tip', textAlign: TextAlign.right, style: AppTheme.title),
                                const SizedBox(height: 35,),
                                Text('50 Items (64 Units)', textAlign: TextAlign.right, style: AppTheme.subtitle),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),),
              const Divider(
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, bottom: 16, top: 8),
                child: Container(
                  height: 35,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        blurRadius: 8,
                        offset: const Offset(4, 4),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                      highlightColor: Colors.transparent,
                      onTap: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          content: Container(
                            height: 300,
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 20,),
                                Text("Location Options", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                                SizedBox(height: 20,),
                                getLocationUI(),
                                SizedBox(height: 10,),
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
                                      children: [
                                        SizedBox(height: 10,),
                                        Text("Status: BatchFinder will use your current location to find available batches", style: TextStyle(fontSize: 18),),
                                        SizedBox(height: 10,),
                                        MaterialButton(
                                          color: Colors.green,
                                          height: 20,
                                          minWidth: double.infinity,
                                          padding: const EdgeInsets.symmetric(vertical: 8),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                              side: BorderSide(color: Theme.of(context).primaryColor)),
                                          child: Text(
                                            "VIEW IN GOOGLE MAPS",
                                            style: TextStyle(color: Colors.white, fontSize: 15),
                                          ),
                                          onPressed: () async {
                                            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
                                          },
                                        ),
                                      ],
                                    )
                                ),
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
                      child: Center(
                        child: Text(
                          'Set Location',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ),
      ),
    );
  }

  Widget getLocationUI() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: <Widget>[
          getButtonUI("Real", categoryTypeData == "Real"),
          const SizedBox(
            width: 32,
          ),
          getButtonUI("Fake", categoryTypeData == "Fake"),
        ],
      ),
    );
  }

  Widget getButtonUI(categoryTypeData, bool isSelected) {
    String txt = '';
    if ("Real" == categoryTypeData) {
      txt = 'Real';
    } else if ("Fake" == categoryTypeData) {
      txt = 'Fake';
    }
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).primaryColor
                : AppTheme.nearlyWhite,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            border: Border.all(color: Theme.of(context).primaryColor)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white24,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            onTap: () {
              setState(() {
                categoryTypeData = categoryTypeData;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, bottom: 12, left: 18, right: 18),
              child: Center(
                child: Text(
                  txt,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    letterSpacing: 0.27,
                    color: isSelected
                        ? AppTheme.nearlyWhite
                        : Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
