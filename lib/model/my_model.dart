// To parse this JSON data, do
//
//     final myClass = myClassFromJson(jsonString);

class MyClass {
  String? status;
  int? totalResults;
  List<Article>? articles;

  MyClass({
    this.status,
    this.totalResults,
    this.articles,
  });

  factory MyClass.fromJson(Map<String, dynamic> json) => MyClass(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: json["articles"] == null
            ? []
            : List<Article>.from(
                json["articles"]!.map((x) => Article.fromJson(x))),
      );
}

class Article {
  Source? source; //site name
  String? author; //autor name
  String? title; //title of the news
  String? description; //descriptiom
  String? url; //news url
  String? urlToImage; //image url
  DateTime? publishedAt; //ublish date
  String? content; //news content

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: json["source"] == null ? null : Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );
}

class Source {
  dynamic id;
  String? name;

  Source({
    this.id,
    this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );
}
