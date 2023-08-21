import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 50,
        height: 50,
        margin: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: const CircularProgressIndicator(),
      ),
    );
  }
}