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
        elevation: 1.5,
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
            // const Divider(
            //   thickness: 0.1,
            // ),
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
          Flexible(
            flex: 4,
            child: Container(
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
                childAspectRatio: 1.0,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ...List.generate(
                    CardMenuModel.list.length,
                    (index) => Container(
                      color: colorScheme.primary,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              CardMenuModel.list[index].icon,
                              color: colorScheme.secondary,
                              size: 32,
                            ),
                            SizedBox(height: 16),
                            Text(
                              CardMenuModel.list[index].title,
                              style: TextStyle(
                                color: colorScheme.secondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: colorScheme.error,
        child: Icon(
          PhosphorIcons.regular.qrCode,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          // elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.primary,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          selectedFontSize: 12,
          // showSelectedLabels: false,
          // showUnselectedLabels: false,
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
      /* bottomNavigationBar: BottomAppBar(
        color: colorScheme.primary,
        shape: CircularNotchedRectangle(),
        notchMargin: 6,
        child: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 0;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(PhosphorIcons.regular.house,
                        color: currentIndex == 0
                            ? colorScheme.secondary
                            : colorScheme.secondary.withOpacity(0.65)),
                    const SizedBox(height: 4),
                    Text(
                      'Home',
                      style: TextStyle(color: colorScheme.secondary),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 1;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      PhosphorIcons.regular.creditCard,
                      color: currentIndex == 1
                          ? colorScheme.secondary
                          : colorScheme.secondary.withOpacity(0.65),
                    ),
                    const SizedBox(height: 4),
                    Text('Cards'),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              const SizedBox(width: 24),
              GestureDetector(
                onTap: () {},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(PhosphorIcons.regular.mapPin),
                    const SizedBox(height: 4),
                    Text('Location'),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(PhosphorIcons.regular.user),
                    const SizedBox(height: 4),
                    Text('Account'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),*/
    );
  }
}
