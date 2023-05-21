import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

void main() {
  final cartItem = CardMenuModel(
    title: 'title',
    icon: Icons.home,
  );
  print(cartItem.title);

  CardMenuModel.list;
}

class CardMenuModel {
  final String title;
  final IconData icon;

  CardMenuModel({
    required this.title,
    required this.icon,
  });

  // mock data list of CardMenuModel
  static List<CardMenuModel> list = [
    CardMenuModel(
      title: 'Account',
      icon: PhosphorIcons.fill.identificationCard,
    ),
    CardMenuModel(
      title: 'Cards',
      icon: PhosphorIcons.fill.creditCard,
    ),
    CardMenuModel(
      title: 'Payments',
      icon: PhosphorIcons.fill.currencyCircleDollar,
    ),
    CardMenuModel(
      title: 'New Account',
      icon: PhosphorIcons.fill.bank,
    ),
    CardMenuModel(
      title: 'Cash to ATM',
      icon: PhosphorIcons.fill.money,
    ),
    CardMenuModel(
      title: 'Transfer',
      icon: PhosphorIcons.fill.arrowsClockwise,
    ),
    CardMenuModel(
      title: 'Scan QR',
      icon: PhosphorIcons.regular.qrCode,
    ),
    CardMenuModel(
      title: 'Loans',
      icon: PhosphorIcons.regular.calculator,
    ),
    CardMenuModel(
      title: 'Locations',
      icon: PhosphorIcons.fill.mapPin,
    ),
  ];
}
