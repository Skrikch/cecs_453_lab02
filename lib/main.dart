import 'package:flutter/material.dart';

void main()
{
  runApp(GalleryApp());
}

final List<String> _image_assets = const
[
  'assets/...',
  'assets/...',
  'assets/...',
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

  // put functions here

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar(title: const Text('B+C Gallery')),
      body:
    )
  }
}


/*

class GalleryWidget extends StatefulWidget
{
  const GalleryWidget({Key? key}) : super(key: key);

  @override
  State<GalleryWidget> createState() => _GalleryState();
}



class _GalleryState extends State<GalleryWidget>
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
      (
      home: Scaffold
        (

      ),
    );
  }
}


class FirstScreen extends StatelessWidget
{
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
    (
      home: Scaffold
      (
        appBar: AppBar
        (
          backgroundColor: Colors.deepPurple,
          title: const Text('C + B Gallery'),
        ),
        body: Container
        (
          child: Row
          (
            children:
            [
              ElevatedButton
              (
                onPressed: () => Navigator.of(context).push()
              ),

            ]
          )
        ),
      ),
    );
  }
}

*/

