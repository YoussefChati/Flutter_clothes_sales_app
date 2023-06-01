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

  Future<void> saveClothesToFirestore() async {
    CollectionReference clothesCollection =
        FirebaseFirestore.instance.collection('clothes');

    await clothesCollection.add(toMap());
  }

  static Future<List<Clothes>> getClothesFromFirestore() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('clothes').get();

    List<Clothes> clothesList = [];

    for (var doc in snapshot.docs) {
      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;

      Clothes clothes = Clothes(
        data!['title'],
        data['subtitle'],
        data['price'],
        data['imageUrl'],
        List<String>.from(data['detailUrl']),
      );

      clothesList.add(clothes);
    }

    return clothesList;
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
