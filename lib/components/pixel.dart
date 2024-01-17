import 'package:flutter/material.dart';

class MyPixel extends StatelessWidget {
  final void Function()? ontap;
  const MyPixel({super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Container(
            color: Colors.grey[700],
          ),
        ),
      ),
    );
  }
}
