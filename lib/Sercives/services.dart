import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  Future<String> getData(String city) async {
    CollectionReference reference =
        FirebaseFirestore.instance.collection('soil');

    DocumentSnapshot snapshot = await reference.doc(city).get();
    var dataOfSoil = snapshot.data() as Map;
    return dataOfSoil['soil'].toString();
  }

  getCrops(String soil) async {
    print(soil);
    return FirebaseFirestore.instance
        .collection('crops')
        .where('Soil', isEqualTo: soil)
        .snapshots();
  }
}
