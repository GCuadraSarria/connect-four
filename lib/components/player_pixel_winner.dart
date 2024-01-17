import 'package:flutter/material.dart';

class PlayerPixelWinner extends StatelessWidget {
  final bool isBluePiece;
  const PlayerPixelWinner({super.key, required this.isBluePiece});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          color: isBluePiece ? Colors.lightBlue[900] : Colors.red[900],
        ),
      ),
    );
  }
}
