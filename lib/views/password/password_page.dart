import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';

class ModalDialog extends StatelessWidget {
  const ModalDialog({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Add the blurred image as the background
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.005),
            ),
          ),
        ),
        // Add the modal dialog on top of the blurred image
        Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: child,
          ),
        ),
        // Add the close button at the top right corner by using align widget
        Material(
          color: Colors.transparent,
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(
                top: Platform.isAndroid ? 42 : 52,
                left: 16,
                bottom: 16,
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PasswordInputGrid extends StatefulWidget {
  const PasswordInputGrid({super.key});

  @override
  _PasswordInputGridState createState() => _PasswordInputGridState();
}

class _PasswordInputGridState extends State<PasswordInputGrid> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        childAspectRatio: 1.2,
      ),
      itemCount: 12,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(
        top: 16,
        left: 32,
        right: 32,
        bottom: 32,
      ),
      itemBuilder: (context, index) {
        if (index == 9) {
          // Add the "0" button
          return Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: TextButton(
                onPressed: () {
                  _controller.text += (index + 1).toString();
                },
                child: Text(
                  "C",
                  style: TextStyle(
                    color: Colors.cyanAccent,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        } else if (index == 11) {
          // Add the "X" button to clear the input
          return Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: TextButton(
                onPressed: () {
                  _controller.text = _controller.text.substring(
                    0,
                    _controller.text.length - 1,
                  );
                },
                child: Icon(
                  Icons.backspace_rounded,
                  color: Colors.cyanAccent,
                  size: 24,
                ),
              ),
            ),
          );
        } else if (index == 10) {
          // Add the "." button
          return Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: OutlinedButton(
                onPressed: () {
                  _controller.text += (index + 1).toString();
                },
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.all(24),
                  side: BorderSide(
                    color: Colors.white,
                    width: 1,
                  ),
                  shape: CircleBorder(),
                ),
                child: Text(
                  (index + 1).toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                  ),
                ),
              ),
            ),
          );
        } else {
          // Add the digit buttons
          return Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: OutlinedButton(
                onPressed: () {
                  _controller.text += (index + 1).toString();
                },
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.all(30),
                  side: BorderSide(
                    color: Colors.white,
                    width: 1,
                  ),
                  shape: CircleBorder(),
                ),
                child: Text(
                  (index + 1).toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
