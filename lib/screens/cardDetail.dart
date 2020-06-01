import 'package:alimentacion/models/CardDTO.dart';
import 'package:alimentacion/models/diet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:alimentacion/services/authorService.dart';

import '../models/CardDTO.dart';
import '../models/CardDTO.dart';
import '../models/CardDTO.dart';

class CardDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hello"),
          backgroundColor: Colors.blueAccent,
        ),
        body: Example());
  }
}

class Example extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  Future<List<CardDTO>> prueba = fechtCards(0);
  CardDTO _card = CardDTO();
  List<CardDTO> _cards = List();

  _ExampleState() {
    prueba = fechtCards(0);
    fechtCards(0).then((value) => _cards = value);
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<CardDTO>>(
      future: prueba,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return cardContainer(snapshot.data[0]);
        } else {
          return Text("Ha ocurrido un error");
        }
      },
    );

    // return Scaffold(
    //   body: Container(
    //     child: ListView.builder(
    //       scrollDirection: Axis.vertical,
    //       shrinkWrap: true,
    //       itemCount: _cards.length,
    //       itemBuilder: (BuildContext context, int index) {
    //         cardContainer(_cards[index]);
    //       },
    //     ),
    //   ),
    // );
  }

  List<Widget> _printButtons(List<String> colors) {
    List<Widget> result = List();
    for (var color in colors) {
      result.add(Container(
        margin: EdgeInsets.only(top: 10, right: 5, left: 5),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Text(color),
      ));
    }

    return result;
  }

  Container cardContainer(CardDTO card) {
    return Container(
        color: Colors.blueGrey,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.network(_card.imageUrl),
              ],
            ),
            Flexible(
              // Wrap Text inside column
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _card.name,
                      style: TextStyle(color: Colors.white),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        _card.artist,
                      ),
                    ),

                    Wrap(
                      children: _printButtons(_card.printings),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}


class _MyListItem extends StatelessWidget {
  final int index;

  final Future<List<CardDTO>> cards;

  _MyListItem(this.index, {Key key, this.cards})
      : super(key: key); //Constructor, key parameter is ommited

  Future<List<CardDTO>> prueba = fechtCards(0);

  @override
  Widget build(BuildContext context) {
    var catalog = Provider.of<CatalogModel>(context);
    var item = catalog.getByPosition(index);

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: LimitedBox(
          maxHeight: 48,
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  color: Colors.green,
                ),
              ),
              SizedBox(width: 24),
              Expanded(
                  child:
                      Text(item.name, style: Theme.of(context).textTheme.title))
            ],
          ),
        ));
  }

  // Widget infiniteList() {
  //   return ListView.builder(
  //     controller: _scrollController.addListener(() {
  //       if (_scrollController.position.pixels == (0.9 * _scrollController.position.maxScrollExtent)) {
  //         prueba = fechtCards(count++);
  //       }
  //     }),
  //     itemCount: _list.length,
  //     itemBuilder: (context, index) => ListTile(title: Text('holi'),),
  //     );
  // }

  // ScrollController _scrollController = ScrollController();
}
