class Perfume {
  String? perfumeId;
  String? name;
  String? brand;
  String? scent;
  String? gender;
  double? price;
  int? stockQuantity;
  String? description;
  String? imageUrl;
  int? viewCount;
  String? origin;
  int? releaseYear;
  int? volume;
  int? discount;
  String? topNote;
  String? middleNote;
  String? baseNote;
  String? dateAdded;
  List<Null>? activityLogs;
  List<Null>? carts;
  List<Null>? feedbacks;
  List<Null>? orderItems;
  List<Null>? perfumeCharacteristics;
  List<Null>? productCategories;

  Perfume(
      {this.perfumeId,
      this.name,
      this.brand,
      this.scent,
      this.gender,
      this.price,
      this.stockQuantity,
      this.description,
      this.imageUrl,
      this.viewCount,
      this.origin,
      this.releaseYear,
      this.volume,
      this.discount,
      this.topNote,
      this.middleNote,
      this.baseNote,
      this.dateAdded,
      this.activityLogs,
      this.carts,
      this.feedbacks,
      this.orderItems,
      this.perfumeCharacteristics,
      this.productCategories});

  Perfume.fromJson(Map<String, dynamic> json) {
    perfumeId = json['perfumeId'];
    name = json['name'];
    brand = json['brand'];
    scent = json['scent'];
    gender = json['gender'];
    price = json['price'];
    stockQuantity = json['stockQuantity'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    viewCount = json['viewCount'];
    origin = json['origin'];
    releaseYear = json['releaseYear'];
    volume = json['volume'];
    discount = json['discount'];
    topNote = json['topNote'];
    middleNote = json['middleNote'];
    baseNote = json['baseNote'];
    dateAdded = json['dateAdded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['perfumeId'] = perfumeId;
    data['name'] = name;
    data['brand'] = brand;
    data['scent'] = scent;
    data['gender'] = gender;
    data['price'] = price;
    data['stockQuantity'] = stockQuantity;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    data['viewCount'] = viewCount;
    data['origin'] = origin;
    data['releaseYear'] = releaseYear;
    data['volume'] = volume;
    data['discount'] = discount;
    data['topNote'] = topNote;
    data['middleNote'] = middleNote;
    data['baseNote'] = baseNote;
    data['dateAdded'] = dateAdded;

    return data;
  }
}
