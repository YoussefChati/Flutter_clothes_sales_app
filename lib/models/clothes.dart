import 'package:cloud_firestore/cloud_firestore.dart';

class Clothes {
  String title;
  String subtitle;
  String price;
  String imageUrl;
  List<String> detailUrl;

  Clothes(
    this.title,
    this.subtitle,
    this.price,
    this.imageUrl,
    this.detailUrl,
  );

  bool operator ==(o) =>
      o is Clothes &&
      o.title == title &&
      o.subtitle == subtitle &&
      o.price == price;

  int get hashCode => title.hashCode ^ subtitle.hashCode ^ price.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'price': price,
      'imageUrl': imageUrl,
      'detailUrl': detailUrl,
    };
  }

  static Future<void> saveClothesToFirestore() async {
    CollectionReference clothesCollection =
        FirebaseFirestore.instance.collection('clothes');

    List<Clothes> clothesList = generateClothes();

    for (Clothes clothes in clothesList) {
      await clothesCollection.add(clothes.toMap());
    }
  }

  static List<Clothes> generateClothes() {
    return [
      Clothes(
        'Jordan Flight MVP',
        'Jacket',
        '\$ 80',
        'assets/images/image1.png',
        ['assets/images/image1.png', 'assets/images/image1detail.png'],
      ),
      Clothes(
        'Jordan Flight MVP',
        'Crew-Neck Sweatshirt',
        '\$ 82.50',
        'assets/images/image2.png',
        ['assets/images/image2.png', 'assets/images/images2detail.png'],
      ),
      Clothes(
        'Nike Sportswear Club Fleece',
        'Crew',
        '\$ 55',
        'assets/images/bestsell.png',
        ['assets/images/bestsell.png', 'assets/images/image3.png'],
      ),
    ];
  }
}
