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

  const Artwork(this.artist, this.year, this.imageAsset);
}

final List<Artwork> _art_pieces =
[
  Artwork('Smunga', 2001, 'assets/...'),
  Artwork('Gubby', 2020, 'assets/...'),
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
      appBar: AppBar(title: const Text('B+C Gallery')),
      body: Center
      (
        child: Column
        (
          children:
          [
            // image,
            Image.asset(_art_pieces[_currentAsset].imageAsset),

            // text box,


            // buttons,
            Row
            (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
              [
                FloatingActionButton
                (
                  onPressed: _decrementGallery,
                  tooltip: 'Previous',
                  child: const Text('Previous'),
                ),
                FloatingActionButton
                  (
                  onPressed: _incrementGallery,
                  tooltip: 'Next',
                  child: const Text('Next'),
                ),
              ]
            )
          ]
        )
      )
    );
  }
}
