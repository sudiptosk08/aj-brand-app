import 'dart:ui';
import 'package:ajapp/views/styles/b_style.dart';
import 'package:flutter/material.dart';

class CustomDrawerScreen extends StatefulWidget {
  final Widget child;
  const CustomDrawerScreen({Key? key, required this.child}) : super(key: key);

  @override
  _CustomDrawerScreenState createState() => _CustomDrawerScreenState();
}

class _CustomDrawerScreenState extends State<CustomDrawerScreen> {
 

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
            color: KColor.primary.withOpacity(0.4),
            width: size.width,
            height: size.height,
            child: widget.child),
      ),
    );
  }
}
