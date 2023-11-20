import 'package:flutter/material.dart';

///Loads on new screen when getting data from the server,Loads untill data recived.
class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        strokeWidth: 1,
      ),
    );
  }
}
