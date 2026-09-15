import 'package:flutter/material.dart';

void main()
{
  runApp(GalleryApp());
}

class Artwork
{
  final String artist;
  final int year;
  final String imageAsset;
  final String title;

  const Artwork(this.artist, this.year, this.imageAsset, this.title);
}

final List<Artwork> _art_pieces =
[
  Artwork('Smunga', 2001, 'assets/fence_rat.jpg', 'SmoogTitle'),
  Artwork('Gubby', 2020, 'assets/RatGamer.jpg', 'GoobTitle'),
];

class GalleryApp extends StatelessWidget
{
  const GalleryApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
    (
      title: 'B + C Gallery',
      home: GalleryScreen(),
    );
  }
}

class GalleryScreen extends StatefulWidget
{
  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen>
{
  // put variables here
  int _currentAsset = 0;    // for keeping track of which image should show

  // put functions here
  void _incrementGallery()
  {
    if (_currentAsset == _art_pieces.length - 1)
    {
      setState(() {_currentAsset = 0;});
    }
    else
    {
      setState(() {_currentAsset++;});
    }
  }

  void _decrementGallery()
  {
    if (_currentAsset == 0)
    {
      setState(() {_currentAsset = _art_pieces.length - 1;});
    }
    else
    {
      setState(() {_currentAsset--;});
    }
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
          title: const Text('B+C Gallery'),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
      ),

      body: Expanded
      (
        child: Column
        (
          children:
          [
            Padding
            (
              padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
            ),

            Expanded
            (
              child: Column
              (
                children:
                [
                  // image,
                  Image.asset(_art_pieces[_currentAsset].imageAsset, width: 300),

                  Padding
                  (
                    padding: EdgeInsets.symmetric(vertical: 8)
                  ),

                  // text box,
                  Column
                    (
                      children:
                      [
                        Text(_art_pieces[_currentAsset].title),
                        Text("${_art_pieces[_currentAsset].artist} (${_art_pieces[_currentAsset].year})"),
                      ]
                  ),
                ]
              )
            ),

            // buttons,
            Row
            (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
              [
                ElevatedButton
                (
                  onPressed: _decrementGallery,
                  child: const Text('<- Previous'),
                  style: ElevatedButton.styleFrom
                  (
                      minimumSize: Size(125, 40),
                      backgroundColor: Colors.blueGrey,
                      foregroundColor: Colors.white,
                  ),
                ),
                ElevatedButton
                (
                  onPressed: _incrementGallery,
                  child: const Text('Next ->'),
                  style: ElevatedButton.styleFrom
                  (
                      minimumSize: Size(125, 40),
                      backgroundColor: Colors.blueGrey,
                      foregroundColor: Colors.white,
                  ),
                ),
              ]
            ),

            Padding
            (
              padding: EdgeInsets.only(bottom: 80)
            ),
          ],
        ),
      ),
    );
  }
}
