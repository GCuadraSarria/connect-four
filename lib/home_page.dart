import 'package:flutter/material.dart';
import 'components/components.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Blue wins
  int blueVictories = 0;

  // Red wins
  int redVictories = 0;

  // List of blue pieces placed
  List<int> bluePlacedPieces = [];

  // List of red pieces placed
  List<int> redPlacedPieces = [];

  // Blue / Red turn
  bool isBlueTurn = true;

  // Blue winner combination
  List<int> blueWinComb = [];

  // Red winner combination
  List<int> redWinComb = [];

  // Draw variable
  bool draw = false;

  // Check if a player has 4 in line
  void checkWinner() {
    // check if it's a draw (full board)
    if (redPlacedPieces.length + bluePlacedPieces.length == 42) {
      draw = true;
      return;
    }

    // Sort lists
    redPlacedPieces.sort();
    bluePlacedPieces.sort();

    // Check if blue wins
    for (int i = 0; i < bluePlacedPieces.length - 3; i++) {
      // Check a sequence of four consecutive columns (avoiding walls)
      if ((bluePlacedPieces[i] == bluePlacedPieces[i + 1] - 1 &&
          bluePlacedPieces[i] == bluePlacedPieces[i + 2] - 2 &&
          bluePlacedPieces[i] == bluePlacedPieces[i + 3] - 3)) {
        if ((bluePlacedPieces[i] % 7 == 3) ||
            (bluePlacedPieces[i + 1] % 7 == 3) ||
            (bluePlacedPieces[i + 2] % 7 == 3) ||
            (bluePlacedPieces[i + 3] % 7 == 3)) {
          blueWinComb.add(bluePlacedPieces[i]);
          blueWinComb.add(bluePlacedPieces[i + 1]);
          blueWinComb.add(bluePlacedPieces[i + 2]);
          blueWinComb.add(bluePlacedPieces[i + 3]);
          blueVictories++;
          return;
        }
      }
      // Check a sequence of four consecutive rows
      if (bluePlacedPieces.contains(bluePlacedPieces[i] + 7) &&
          bluePlacedPieces.contains(bluePlacedPieces[i] + 14) &&
          bluePlacedPieces.contains(bluePlacedPieces[i] + 21)) {
        blueWinComb.add(bluePlacedPieces[i]);
        blueWinComb.add(bluePlacedPieces[i] + 7);
        blueWinComb.add(bluePlacedPieces[i] + 14);
        blueWinComb.add(bluePlacedPieces[i] + 21);
        blueVictories++;
        return;
      }
      // Check a sequence of four consecutive left diagonal (avoiding walls)
      if (bluePlacedPieces.contains(bluePlacedPieces[i] + 6) &&
          bluePlacedPieces.contains(bluePlacedPieces[i] + 12) &&
          bluePlacedPieces.contains(bluePlacedPieces[i] + 18)) {
        if ((bluePlacedPieces[i] % 7 == 3) ||
            ((bluePlacedPieces[i] + 6) % 7 == 3) ||
            ((bluePlacedPieces[i] + 12) % 7 == 3) ||
            ((bluePlacedPieces[i] + 18) % 7 == 3)) {
          blueWinComb.add(bluePlacedPieces[i]);
          blueWinComb.add(bluePlacedPieces[i] + 6);
          blueWinComb.add(bluePlacedPieces[i] + 12);
          blueWinComb.add(bluePlacedPieces[i] + 18);
          blueVictories++;
          return;
        }
      }
      // Check a sequence of four consecutive right diagonal (avoiding walls)
      if (bluePlacedPieces.contains(bluePlacedPieces[i] + 8) &&
          bluePlacedPieces.contains(bluePlacedPieces[i] + 16) &&
          bluePlacedPieces.contains(bluePlacedPieces[i] + 24)) {
        if ((bluePlacedPieces[i] % 7 == 3) ||
            ((bluePlacedPieces[i] + 8) % 7 == 3) ||
            ((bluePlacedPieces[i] + 16) % 7 == 3) ||
            ((bluePlacedPieces[i] + 24) % 7 == 3)) {

          blueWinComb.add(bluePlacedPieces[i]);
          blueWinComb.add(bluePlacedPieces[i] + 8);
          blueWinComb.add(bluePlacedPieces[i] + 16);
          blueWinComb.add(bluePlacedPieces[i] + 24);
          blueVictories++;
          return;
        }
      }
    }

    // Check if red wins
    for (int i = 0; i < redPlacedPieces.length - 3; i++) {
      // Check a sequence of four consecutive columns (avoiding walls)
      if ((redPlacedPieces[i] == redPlacedPieces[i + 1] - 1 &&
          redPlacedPieces[i] == redPlacedPieces[i + 2] - 2 &&
          redPlacedPieces[i] == redPlacedPieces[i + 3] - 3)) {
        if ((redPlacedPieces[i] % 7 == 3) ||
            (redPlacedPieces[i + 1] % 7 == 3) ||
            (redPlacedPieces[i + 2] % 7 == 3) ||
            (redPlacedPieces[i + 3] % 7 == 3)) {
          redWinComb.add(redPlacedPieces[i]);
          redWinComb.add(redPlacedPieces[i + 1]);
          redWinComb.add(redPlacedPieces[i + 2]);
          redWinComb.add(redPlacedPieces[i + 3]);
          redVictories++;
          return;
        }
      }
      // Check a sequence of four consecutive rows
      if (redPlacedPieces.contains(redPlacedPieces[i] + 7) &&
          redPlacedPieces.contains(redPlacedPieces[i] + 14) &&
          redPlacedPieces.contains(redPlacedPieces[i] + 21)) {
        redWinComb.add(redPlacedPieces[i]);
        redWinComb.add(redPlacedPieces[i] + 7);
        redWinComb.add(redPlacedPieces[i] + 14);
        redWinComb.add(redPlacedPieces[i] + 21);
        redVictories++;
        return;
      }
      // Check a sequence of four consecutive left diagonal (avoiding walls)
      if (redPlacedPieces.contains(redPlacedPieces[i] + 6) &&
          redPlacedPieces.contains(redPlacedPieces[i] + 12) &&
          redPlacedPieces.contains(redPlacedPieces[i] + 18)) {
        if ((redPlacedPieces[i] % 7 == 3) ||
            ((redPlacedPieces[i] + 6) % 7 == 3) ||
            ((redPlacedPieces[i] + 12) % 7 == 3) ||
            ((redPlacedPieces[i] + 18) % 7 == 3)) {
          redWinComb.add(redPlacedPieces[i]);
          redWinComb.add(redPlacedPieces[i] + 6);
          redWinComb.add(redPlacedPieces[i] + 12);
          redWinComb.add(redPlacedPieces[i] + 18);
          redVictories++;
          return;
        }
      }
      // Check a sequence of four consecutive right diagonal (avoiding walls)
      if (redPlacedPieces.contains(redPlacedPieces[i] + 8) &&
          redPlacedPieces.contains(redPlacedPieces[i] + 16) &&
          redPlacedPieces.contains(redPlacedPieces[i] + 24)) {
        if ((redPlacedPieces[i] % 7 == 3) ||
            ((redPlacedPieces[i] + 8) % 7 == 3) ||
            ((redPlacedPieces[i] + 16) % 7 == 3) ||
            ((redPlacedPieces[i] + 24) % 7 == 3)) {

          redWinComb.add(redPlacedPieces[i]);
          redWinComb.add(redPlacedPieces[i] + 8);
          redWinComb.add(redPlacedPieces[i] + 16);
          redWinComb.add(redPlacedPieces[i] + 24);
          redVictories++;
          return;
        }
      }
    }
  }

  // Place a piece in the column selected
  void placePiece(int index) {
    int lastRow = index;
    setState(() {
      // Add the last element in the column where tapped
      while (lastRow + 7 < 42) {
        // If the last row is occuppied, we add the previous
        if (redPlacedPieces.contains(lastRow + 7) ||
            bluePlacedPieces.contains(lastRow + 7)) break;
        lastRow += 7;
      }

      // Add the index to the player's list
      isBlueTurn ? bluePlacedPieces.add(lastRow) : redPlacedPieces.add(lastRow);

      // Check if somebody wins after the piece placed
      if (bluePlacedPieces.length >= 4 || redPlacedPieces.length >= 4) {
        checkWinner();
      }

      // Switch turns
      isBlueTurn = !isBlueTurn;
    });
  }

  // Restart game
  void restartGame() {
    setState(() {
      blueVictories = 0;
      redVictories = 0;
      bluePlacedPieces = [];
      redPlacedPieces = [];
      blueWinComb = [];
      redWinComb = [];
      isBlueTurn = true;
      draw = false;
    });
  }

  // Play next game
  void playNextGame() {
    setState(() {
      bluePlacedPieces = [];
      redPlacedPieces = [];
      blueWinComb = [];
      redWinComb = [];
      isBlueTurn = true;
      draw = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          // Points and restart game display
          SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'B L U E',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                        height: 5.0,
                        width: 50.0,
                        color: isBlueTurn ? Colors.blue : Colors.transparent),
                    Text(
                      '$blueVictories',
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () => restartGame(),
                  icon: const Icon(Icons.restart_alt),
                  iconSize: 32.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'R E D',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                        height: 5.0,
                        width: 50.0,
                        color: !isBlueTurn ? Colors.red : Colors.transparent),
                    Text(
                      '$redVictories',
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          // Grid game display
          Expanded(
            flex: 3,
            child: GridView.builder(
              itemCount: 42,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7),
              itemBuilder: (BuildContext context, int index) {
                if (blueWinComb.contains(index)) {
                  return const PlayerPixelWinner(
                    isBluePiece: true,
                  );
                } else if (redWinComb.contains(index)) {
                  return const PlayerPixelWinner(
                    isBluePiece: false,
                  );
                } else if (bluePlacedPieces.contains(index)) {
                  return const PlayerPixel(
                    isBluePiece: true,
                  );
                } else if (redPlacedPieces.contains(index)) {
                  return const PlayerPixel(
                    isBluePiece: false,
                  );
                } else {
                  return MyPixel(
                    ontap: () => blueWinComb.isEmpty && redWinComb.isEmpty
                        ? placePiece(index)
                        : null,
                  );
                }
              },
            ),
          ),
          const SizedBox(height: 20.0),
          // Game winner display
          blueWinComb.isNotEmpty || redWinComb.isNotEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      blueWinComb.isNotEmpty
                          ? 'B L U E  W I N S'
                          : 'R E D  W I N S',
                      style: const TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.grey[800]),
                      ),
                      onPressed: () => playNextGame(),
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Play again',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              : draw
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'T I E',
                          style: TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.grey[800]),
                          ),
                          onPressed: () => playNextGame(),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              'Play again',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  : const SizedBox(),
          const SizedBox(height: 150),
        ],
      ),
    );
  }
}
