import 'package:alimentacion/models/CardDTO.dart';
import 'package:alimentacion/models/diet.dart';
import 'package:alimentacion/services/authorService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Diet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => _MyListItem(index, cards: fechtCards(0),)))
      ],
    ));
  }
}

class _MyListItem extends StatelessWidget {
  final int index;

  final Future<List<CardDTO>> cards;

  _MyListItem(this.index, {Key key, this.cards}) : super(key: key);


  Future<List<CardDTO>> prueba = fechtCards(0);

  @override
  Widget build(BuildContext context) {
    var catalog = Provider.of<CatalogModel>(context);
    var item = catalog.getByPosition(index);

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: 
        LimitedBox(
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
          ),)
          );
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
