class CardDTOList {
  List<CardDTO> cards;

  CardDTOList({
    this.cards
  });

  factory CardDTOList.fromJson(List<dynamic> json) {
    List<CardDTO> cards = new List<CardDTO>();
    cards = json.map((e) => CardDTO.fromJson(e)).toList();

    return new CardDTOList(cards: cards);
  }
}

class CardDTO {
  String name;
  String manaCost;
  double cmc;
  List<String> colors;
  List<String> colorIdentity;
  String type;
  List<dynamic> supertypes;
  List<String> types;
  List<dynamic> subtypes;
  String rarity;
  String cardSet;
  String setName;
  String text;
  String artist;
  String number;
  String layout;
  int multiverseid;
  String imageUrl;
  List<Ruling> rulings;
  List<ForeignName> foreignNames;
  List<String> printings;
  String originalText;
  String originalType;
  List<Legality> legalities;
  String id;

  CardDTO({
    this.name,
    this.manaCost,
    this.cmc,
    this.colors,
    this.colorIdentity,
    this.type,
    this.supertypes,
    this.types,
    this.subtypes,
    this.rarity,
    this.cardSet,
    this.setName,
    this.text,
    this.artist,
    this.number,
    this.layout,
    this.multiverseid,
    this.imageUrl,
    this.rulings,
    this.foreignNames,
    this.printings,
    this.originalText,
    this.originalType,
    this.legalities,
    this.id,
  });

  factory CardDTO.fromJson(Map<String, dynamic> json) {
    return CardDTO(
      artist: json['artist'],
      name: json['name'],
      manaCost: json['manaCost'],
      cmc: json['cmc'],
      colors: json['colors'].cast<String>(),
      colorIdentity: json['colorIdentity'].cast<String>(),
      type: json['type'],
      supertypes: json['supertypes'],
      types: json['types'].cast<String>(),
      subtypes: json['subtypes'],
      rarity: json['rarity'],
      cardSet: json['cardSet'],
      setName: json['setName'],
      text: json['text'],
      foreignNames: json['foreignNames'].cast<ForeignName>(),
      id: json['id'],
      imageUrl: json['imageUrl'],
      layout: json['layout'],
      legalities: json['legalities'].cast<Legality>(),
      multiverseid: json['multiverseid'],
      number: json['number'],
      originalText: json['originalText'],
      originalType: json['originalType'],
      printings: json['printings'].cast<String>(),
      rulings: json['rulings'].cast<Ruling>(),
    );
  }
}

class ForeignName {
  String name;
  String text;
  dynamic flavor;
  String imageUrl;
  String language;
  int multiverseid;

  ForeignName({
    this.name,
    this.text,
    this.flavor,
    this.imageUrl,
    this.language,
    this.multiverseid,
  });

  factory ForeignName.fromJson(Map<String, dynamic> json) {
    return ForeignName(
      flavor: json['flavor'],
      imageUrl: json['imageUrl'],
      language: json['language'],
      multiverseid: json['multiverseid'],
      name: json['name'],
      text: json['text']
    );
  }
}

class Legality {
  String format;
  String legality;

  Legality({
    this.format,
    this.legality,
  });

  factory Legality.fromJson(Map<String, dynamic> json) {
    return Legality(
      format: json['format'],
      legality: json['legality']
    );
  }
}

class Ruling {
  String date;
  String text;

  Ruling({
    this.date,
    this.text,
  });

  factory Ruling.fromJson(Map<String, dynamic> json) {
    return Ruling(
      date: json['date'],
      text: json['text']
    );
  }
}
