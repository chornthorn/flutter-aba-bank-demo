import 'dart:ui';

import 'package:aba_bank_mobile/utilities/constants.dart';
import 'package:aba_bank_mobile/views/password/password_page.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../models/card_menu_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var currentIndex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: Icon(PhosphorIcons.regular.list),
          splashRadius: 24,
        ),
        title: Text('ABA Bank'),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                '/notification',
                arguments: {
                  "title": "Notification Page",
                  "message": "This is notification page from main page.",
                },
              );
            },
            icon: Icon(PhosphorIcons.regular.bell),
            splashRadius: 24,
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                '/phone_call',
                arguments: {
                  "title": "Notification Page adfasdf",
                  "message":
                      "This is notification page from main page. sadfasd",
                },
              );
            },
            icon: Icon(PhosphorIcons.regular.phoneCall),
            splashRadius: 24,
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  color: colorScheme.error,
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                  vertical: 4,
                ),
                child: Icon(
                  PhosphorIcons.regular.scan,
                  size: 22,
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              accountName: Text('ABA Bank'),
              accountEmail: Text('info@aba.com.kh'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  'A',
                  style: TextStyle(
                    color: colorScheme.primary,
                    fontSize: 32,
                  ),
                ),
              ),
              onDetailsPressed: () {
                _scaffoldKey.currentState?.closeDrawer();
              },
            ),
            ListTile(
              leading: Icon(PhosphorIcons.regular.house),
              trailing: Icon(PhosphorIcons.regular.caretRight),
              title: Text('Home'),
              onTap: () {},
              //dense: true,
            ),
            Container(
              height: 0.5,
              color: colorScheme.primary.withOpacity(0.5),
            ),
            ListTile(
              leading: Icon(PhosphorIcons.regular.creditCard),
              trailing: Icon(PhosphorIcons.regular.caretRight),
              title: Text('Cards'),
              onTap: () {},
            ),
            Container(
              height: 0.5,
              color: colorScheme.primary.withOpacity(0.5),
            ),
            ListTile(
              leading: Icon(PhosphorIcons.regular.money),
              trailing: Icon(PhosphorIcons.regular.caretRight),
              title: Text('Local Transfer'),
              onTap: () {},
            ),
            Container(
              height: 0.5,
              color: colorScheme.primary.withOpacity(0.5),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Version:'),
                  SizedBox(width: 8),
                  Text('1.0.0'),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
      body: Column(
        children: [
          Ink(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Colors.white,
                  colorScheme.primary,
                ],
              ),
            ),
            child: GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
              // childAspectRatio: 0.96,
              // if iphone se 3rd gen
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 2),
              physics: NeverScrollableScrollPhysics(),
              children: [
                ...List.generate(
                  CardMenuModel.list.length,
                  (index) => InkWell(
                    onTap: () async {
                      print('index: $index');
                      showDialog(
                        context: context,
                        useSafeArea: false,
                        barrierColor: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.8),
                        builder: (context) => ModalDialog(
                          child: Material(
                            color: Colors.transparent,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Spacer(flex: 5),
                                Column(
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.35),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Icon(
                                          PhosphorIcons.regular.lockSimple,
                                          size: 32,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      'Enter PIN to login',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ...List.generate(
                                          4,
                                          (index) => index == 0
                                              ? Container(
                                                  width: 24,
                                                  height: 24,
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 4,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Container(
                                                    width: 12,
                                                    height: 12,
                                                    margin:
                                                        const EdgeInsets.all(
                                                            2.5),
                                                    decoration: BoxDecoration(
                                                      color: Colors.cyan,
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                )
                                              : Container(
                                                  width: 24,
                                                  height: 24,
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 4,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                        ),
                                      ],
                                    ),
                                    PasswordInputGrid(),
                                  ],
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    splashColor: colorScheme.secondary.withOpacity(0.1),
                    highlightColor: colorScheme.secondary.withOpacity(0.1),
                    child: Ink(
                      color: colorScheme.primary,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              CardMenuModel.list[index].icon,
                              color: colorScheme.secondary,
                              size: 34,
                            ),
                            SizedBox(height: 10),
                            Text(
                              CardMenuModel.list[index].title,
                              style: TextStyle(
                                color: colorScheme.secondary,
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    color: cyanColor,
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Quick Transfer',
                              style: TextStyle(
                                color: colorScheme.secondary,
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 8),
                            // sub title
                            Text(
                              'Create your templates here to make \nyour transfer faster.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          PhosphorIcons.thin.arrowsClockwise,
                          color: colorScheme.secondary,
                          size: 46,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: colorScheme.error,
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Quick Payment',
                              style: TextStyle(
                                color: colorScheme.secondary,
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Paying your bills with templates is easy and fast.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          PhosphorIcons.thin.money,
                          color: colorScheme.secondary,
                          size: 46,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).colorScheme.primary,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          selectedFontSize: 12,
          unselectedItemColor:
              Theme.of(context).colorScheme.secondary.withOpacity(0.65),
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(PhosphorIcons.regular.house),
              ),
              activeIcon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(PhosphorIcons.fill.house),
              ),
              label: 'Home',
              tooltip: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(PhosphorIcons.regular.creditCard),
              ),
              activeIcon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(PhosphorIcons.fill.creditCard),
              ),
              label: 'Cards',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(PhosphorIcons.regular.mapPin),
              ),
              activeIcon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(PhosphorIcons.fill.mapPin),
              ),
              label: 'Location',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(PhosphorIcons.regular.user),
              ),
              activeIcon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(PhosphorIcons.fill.user),
              ),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
