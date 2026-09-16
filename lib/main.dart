/// Authors: Christos Georgakopoulos, Britney Ferguson

import 'package:flutter/material.dart';

void main() {
  runApp(GalleryApp());
}

// Artwork class to easily represent the data we want to display
class Artwork {
  final String artist;
  final int year;
  final String imageAsset;
  final String title;

  const Artwork(this.artist, this.year, this.imageAsset, this.title);
}

// Storing artwork objects in a list to iterate through with buttons
final List<Artwork> _art_pieces = [
  Artwork('Unknown', 2021, 'assets/fence_rat.jpg', 'Rat Upon a Fence'),
  Artwork('Unknown', 2023, 'assets/RatGamer.jpg', 'Gamer Rat'),
  Artwork('Unknown', 2020, 'assets/him.jpg', 'Rat Upon a Couch'),
  Artwork(
    'Christos',
    2026,
    'assets/Smunga_Staring_at_Camera.jpeg',
    'Mr. Smunga Eyeing You',
  ),
  Artwork('Christos', 2021, 'assets/Bella.jpg', 'Bella Looking Cute'),
  Artwork('Britney', 2026, 'assets/Gub_in_box.jpeg', 'Mr. Gubbins in his box'),
  Artwork(
    'Unknown',
    2019,
    'assets/MJK.png',
    "Maynard James Keenan Messily Eating a Donut",
  ),
];

// Our primary class, stateless
class GalleryApp extends StatelessWidget {
  const GalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'B + C Gallery', home: GalleryScreen());
  }
}

// Stateful widget representing the image and description
class GalleryScreen extends StatefulWidget {
  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

// State implementation
class _GalleryScreenState extends State<GalleryScreen> {
  int _currentAsset = 0; // for keeping track of which image should show

  /// HELPER FUNCTIONS
  void _incrementGallery() {
    if (_currentAsset == _art_pieces.length - 1) {
      setState(() {
        _currentAsset = 0;
      });
    } else {
      setState(() {
        _currentAsset++;
      });
    }
  }

  void _decrementGallery() {
    if (_currentAsset == 0) {
      setState(() {
        _currentAsset = _art_pieces.length - 1;
      });
    } else {
      setState(() {
        _currentAsset--;
      });
    }
  }

  // GUI design and implementation
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Britney and Christos\' Photo Gallery'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      // Root of our scaffold, Centered Column
      body: Center(
        child: Column(
          children: [
            // Begin by padding all sides
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),

            // Next, display and expand the image
            Expanded(
              child: Card(
                elevation: 14,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Image.asset(
                    _art_pieces[_currentAsset].imageAsset,
                    width: 300,
                  ),
                ),
              ),
            ),

            // Padding between Image and Card
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),

            // Card for our image descriptions
            Card.filled(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: SizedBox(
                  // Finding width of screen to properly size title card
                  width: MediaQuery.sizeOf(context).width - 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${_art_pieces[_currentAsset].title}",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "\n${_art_pieces[_currentAsset].artist} (${_art_pieces[_currentAsset].year})",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Padding between card and buttons
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),

            // Buttons, allow us to change the state of the above widgets
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _decrementGallery,
                  child: const Text('<- Previous'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(125, 40),
                    backgroundColor: Colors.blueGrey,
                    foregroundColor: Colors.white,
                  ),
                ),
                ElevatedButton(
                  onPressed: _incrementGallery,
                  child: const Text('Next ->'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(125, 40),
                    backgroundColor: Colors.blueGrey,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),

            // Bottom padding to keep us away from the home bar / gesture region
            Padding(padding: EdgeInsets.only(bottom: 80)),
          ],
        ),
      ),
    );
  }
}
