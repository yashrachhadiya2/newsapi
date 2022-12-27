import 'package:flutter/material.dart';

class Science extends StatefulWidget {
  const Science({Key? key}) : super(key: key);

  @override
  State<Science> createState() => _ScienceState();
}

class _ScienceState extends State<Science> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Text("Scincse"),
    ));
  }
}
