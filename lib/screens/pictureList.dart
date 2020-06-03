import 'package:alimentacion/models/pictureDTO.dart';
import 'package:alimentacion/services/pictureService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class PictureList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fotos'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Picture(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.access_time), title: Text('Prueba')),
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Prueba'))
        ],
        backgroundColor: Colors.blueAccent,
        selectedItemColor: Colors.white,
      ),
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
    return FutureBuilder<List<PictureDto>>(
      future: pictures,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return listView(snapshot.data);
        } else {
          return Text('No funciona');
        }
      },
    );
  }
}

Widget listView(List<PictureDto> list) {
  return ListView.builder(
    itemCount: list.length,
    itemBuilder: (context, index) {
      PictureDto picture = list[index];
      return Column(
        children: <Widget>[
          FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: picture.downloadUrl,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,),
          Text(picture.author)
        ],
      );
    },
  );
}
