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
      icon: PhosphorIcons.regular.wallet,
    ),
    CardMenuModel(
      title: 'Cards',
      icon: PhosphorIcons.regular.creditCard,
    ),
    CardMenuModel(
      title: 'Payments',
      icon: PhosphorIcons.regular.money,
    ),
    CardMenuModel(
      title: 'New Account',
      icon: PhosphorIcons.regular.plus,
    ),
    CardMenuModel(
      title: 'cash to ATM',
      icon: PhosphorIcons.regular.money,
    ),
    CardMenuModel(
      title: 'Transfer',
      icon: PhosphorIcons.regular.arrowsClockwise,
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
      icon: PhosphorIcons.regular.mapPin,
    ),
  ];
}
