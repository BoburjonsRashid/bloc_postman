import 'package:flutter/material.dart';

class InformPage extends StatefulWidget {
  static const String id='inform_page';
  final String name;
  const InformPage({super.key,required this.name});

  @override
  State<InformPage> createState() => _InformPageState();
}

class _InformPageState extends State<InformPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text(widget.name)
      ),
    );
  }
}
