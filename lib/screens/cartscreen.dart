import 'package:flutter/material.dart';

class Cartscreen extends StatefulWidget {
  const Cartscreen({super.key});

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Favourite'))),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return Card();
          },
        ),
      ),
    );
  }
}
