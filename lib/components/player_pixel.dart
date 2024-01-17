import 'package:flutter/material.dart';

class PlayerPixel extends StatelessWidget {
  final bool isBluePiece;
  const PlayerPixel({super.key, required this.isBluePiece});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          color: isBluePiece ? Colors.lightBlue[400] : Colors.red[400],
        ),
      ),
    );
  }
}
