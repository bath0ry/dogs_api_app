import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network(
          'https://images.dog.ceo/breeds/rottweiler/n02106550_148.jpg'),
    );
  }
}
