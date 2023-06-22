import 'package:flutter/material.dart';
import '../custom_drawer/slide_view.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  var profileController = TextEditingController();
  double distValue = 50.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
                        child: Text('Earnings (total)', textAlign: TextAlign.left,
                          style: TextStyle(fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      SliderView(
                        max: 100,
                        distValue: distValue,
                        unit: "\$",
                        onChangedistValue: (double value) {
                          distValue = value;
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
                        child: Text(
                          'Tip',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      SliderView(
                        max: 100,
                        distValue: distValue,
                        unit: "\$",
                        onChangedistValue: (double value) {
                          distValue = value;
                        },
                      ),
                      const SizedBox(height: 8,),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
                        child: Text('Total Dropoff Distance', textAlign: TextAlign.left,
                          style: TextStyle(fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      SliderView(
                        max: 300,
                        distValue: distValue,
                        unit: "km",
                        onChangedistValue: (double value) {
                          distValue = value;
                        },
                      ),
                      const SizedBox(height: 8,),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
                        child: Text('Items', textAlign: TextAlign.left,
                          style: TextStyle(fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      SliderView(
                        max: 200,
                        distValue: distValue,
                        unit: "",
                        onChangedistValue: (double value) {
                          distValue = value;
                        },
                      ),
                      const SizedBox(height: 8,),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
                        child: Text('Max Units', textAlign: TextAlign.left,
                          style: TextStyle(fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      SliderView(
                        max: 200,
                        distValue: distValue,
                        unit: "",
                        onChangedistValue: (double value) {
                          distValue = value;
                        },
                      ),
                      const SizedBox(height: 8,),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
                        child: Text('Max Customers', textAlign: TextAlign.left,
                          style: TextStyle(fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      SliderView(
                        max: 50,
                        distValue: distValue,
                        unit: "",
                        onChangedistValue: (double value) {
                          distValue = value;
                        },
                      ),
                      const SizedBox(height: 8,),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
                        child: Text(
                          'Max Distance To Store',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      SliderView(
                        max: 300,
                        distValue: distValue,
                        unit: "km",
                        onChangedistValue: (double value) {
                          distValue = value;
                        },
                      ),
                      const SizedBox(height: 8,),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
                        child: Text(
                          'Number of Stores',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      SliderView(
                        max: 50,
                        distValue: distValue,
                        unit: "",
                        onChangedistValue: (double value) {
                          distValue = value;
                        },
                      ),
                      const SizedBox(height: 8,),
                    ],
                  ),
                ),
              ),
              const Divider(height: 1,),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, bottom: 16, top: 8),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black12,
                          ),
                          color: Colors.grey[100],
                          borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                      child: TextField(
                        controller: profileController,
                        obscureText: false,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Profile #1',
                          contentPadding: EdgeInsets.all(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Container(
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
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Center(
                            child: Text('Save',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
