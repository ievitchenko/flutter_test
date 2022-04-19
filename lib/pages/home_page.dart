import 'package:flutter/material.dart';
import 'package:test_doc/consts/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color1,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.color1,
        title: const Text(
          'First Route',
        ),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Go to documents'),
          onPressed: () {
            Navigator.pushNamed(context, '/documents');
          },
        ),
      ),
    );
  }
}
