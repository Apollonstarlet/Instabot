import 'package:flutter/material.dart';

import '../app_theme.dart';
import '../custom_drawer/drawer_user_controller.dart';
import '../custom_drawer/home_drawer.dart';
import 'batch.dart';
import 'account.dart';
import 'filter.dart';
import 'friend.dart';
import 'guid.dart';
import 'license.dart';

class NavigationHome extends StatefulWidget {
  const NavigationHome({super.key});

  @override
  State<NavigationHome> createState() => _NavigationHomeState();
}

class _NavigationHomeState extends State<NavigationHome> {
  Widget? screenView;
  DrawerIndex? drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.Batch;
    screenView = BatchScreen();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.white,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            // user: widget.user,
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }
  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      switch (drawerIndex) {
        case DrawerIndex.Batch:
          setState(() {
            screenView = BatchScreen();
          });
          break;
        case DrawerIndex.Filter:
          setState(() {
            screenView = FilterScreen();
          });
          break;
        case DrawerIndex.Guid:
          setState(() {
            screenView = GuidScreen();
          });
          break;
        case DrawerIndex.License:
          setState(() {
            screenView = LicenseScreen();
          });
          break;
        case DrawerIndex.Earn:
          setState(() {
            screenView = FriendScreen();
          });
          break;
        case DrawerIndex.Account:
          setState(() {
            screenView = AccountScreen();
          });
          break;
        default:
          break;
      }
    }
  }
}
