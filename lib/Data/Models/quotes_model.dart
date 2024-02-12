class QuotesModel {
  int? id;
  String? category;
  List<Quotes>? quotes;

  QuotesModel({this.id, this.category, this.quotes});

  QuotesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    if (json['quotes'] != null) {
      quotes = <Quotes>[];
      json['quotes'].forEach((v) {
        quotes!.add(Quotes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category'] = category;
    if (quotes != null) {
      data['quotes'] = quotes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Quotes {
  String? quote;
  String? image;

  Quotes({this.quote, this.image});

  Quotes.fromJson(Map<String, dynamic> json) {
    quote = json['quote'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['quote'] = quote;
    data['image'] = image;
    return data;
  }
}
