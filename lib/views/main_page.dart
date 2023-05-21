import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../models/card_menu_model.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(PhosphorIcons.regular.list),
          splashRadius: 24,
        ),
        title: Text('ABA Bank'),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(PhosphorIcons.regular.bell),
            splashRadius: 24,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(PhosphorIcons.regular.phoneCall),
            splashRadius: 24,
          ),
        ],
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
    );
  }
}
