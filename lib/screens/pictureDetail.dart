import 'package:alimentacion/models/pictureDTO.dart';
import 'package:alimentacion/services/pictureService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PictureDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fotos'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Picture(),
    );
  }
}

class Picture extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PictureState();
}

class _PictureState extends State<Picture> {
  Future<List<PictureDto>> pictures;

  _PictureState() {
    pictures = fetchPictures(0);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PictureDto>>(future: pictures, builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Text('Funciona');
      } else {
        return Text('No funciona');
      }
    },);
  }

}