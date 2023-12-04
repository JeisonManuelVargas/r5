class CoinModel {
  int rank;
  String id;
  String icon;
  String name;
  double price;
  double priceBtc;
  String symbol;
  double volume;
  double totalSupply;
  String websiteUrl;
  String twitterUrl;
  double availableSupply;

  CoinModel({
    required this.id,
    required this.icon,
    required this.rank,
    required this.name,
    required this.price,
    required this.symbol,
    required this.volume,
    required this.priceBtc,
    required this.twitterUrl,
    required this.websiteUrl,
    required this.totalSupply,
    required this.availableSupply,
  });

  CoinModel copyWith({
    int? rank,
    String? id,
    String? icon,
    String? name,
    double? price,
    double? priceBtc,
    String? symbol,
    double? volume,
    double? totalSupply,
    String? websiteUrl,
    String? twitterUrl,
    double? availableSupply,
  }) =>
      CoinModel(
        id: id ?? this.id,
        icon: icon ?? this.icon,
        name: name ?? this.name,
        rank: rank ?? this.rank,
        price: price ?? this.price,
        volume: volume ?? this.volume,
        symbol: symbol ?? this.symbol,
        priceBtc: priceBtc ?? this.priceBtc,
        twitterUrl: twitterUrl ?? this.twitterUrl,
        websiteUrl: websiteUrl ?? this.websiteUrl,
        totalSupply: totalSupply ?? this.totalSupply,
        availableSupply: availableSupply ?? this.availableSupply,
      );

  factory CoinModel.fromJson(json) => CoinModel(
        id: json["id"] ?? "",
        icon: json["icon"] ?? "",
        name: json["name"] ?? "",
        rank: json["rank"] ?? 0,
        symbol: json["symbol"] ?? "",
        websiteUrl: json["websiteUrl"] ?? "",
        twitterUrl: json["twitterUrl"] ?? "",
        price: json["price"] == null ? 0.0 : json["price"].toDouble(),
        volume: json["volume"] == null ? 0.0 : json["volume"]?.toDouble(),
        priceBtc:  json["priceBtc"] == null ? 0.0 : json["priceBtc"].toDouble(),
        totalSupply:  json["totalSupply"] == null ? 0.0 :  json["totalSupply"].toDouble(),
        availableSupply: json["availableSupply"] == null ? 0.0 :  json["availableSupply"].toDouble(),
      );

  factory CoinModel.init() => CoinModel(
        id: "",
        rank: 0,
        icon: "",
        name: "",
        symbol: "",
        price: 0.0,
        volume: 0.0,
        twitterUrl: "",
        priceBtc:  0.0,
        websiteUrl:  "",
        totalSupply:  0.0,
        availableSupply: 0.0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "icon": icon,
        "name": name,
        "rank": rank,
        "price": price,
        "symbol": symbol,
        "volume": volume,
        "priceBtc": priceBtc,
        "twitterUrl": twitterUrl,
        "websiteUrl": websiteUrl,
        "totalSupply": totalSupply,
        "availableSupply": availableSupply,
      };
}
