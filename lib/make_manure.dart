import 'package:digiagro/Sercives/services.dart';
import 'package:flutter/material.dart';

class MakeManure extends StatefulWidget {
  const MakeManure({Key? key}) : super(key: key);

  @override
  _MakeManureState createState() => _MakeManureState();
}

class _MakeManureState extends State<MakeManure> {
  @override
  void initState() {
    getMedsMethord();
    super.initState();
  }

  Stream? getCropsStream;
  getMedsMethord() {
    Database().getManureExpiredMedicine().then((val) {
      getCropsStream = val;
      print(val);
      setState(() {});
    });
  }

  Widget getMedsWidget() {
    return StreamBuilder(
        stream: getCropsStream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return MedsTile(
                        vitaminB1: snapshot.data.docs[index]["Vitamin B1"],
                        calcium: snapshot.data.docs[index]["Calcium"],
                        vitaminB12: snapshot.data.docs[index]["Vitamin B12"],
                        zincSulphateMonohydrate: snapshot.data.docs[index]
                            ["Zinc Sulphate Monohydrate"],
                        vitaminC: snapshot.data.docs[index]["Vitamin C"],
                        folicAcid: snapshot.data.docs[index]["Folic Acid"],
                        vitaminB2: snapshot.data.docs[index]["Vitamin B2"],
                        nicotinamide: snapshot.data.docs[index]["Nicotinamide"],
                        vitaminD3: snapshot.data.docs[index]["Vitamin D3"]);
                  })
              : const Center(
                  child: CircularProgressIndicator(),
                );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          title: const Text(
            'Home-Made Manure',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          )),
      body: getMedsWidget(),
    );
  }
}

class MedsTile extends StatelessWidget {
  final String vitaminB1,
      calcium,
      vitaminB12,
      zincSulphateMonohydrate,
      vitaminC,
      folicAcid,
      vitaminB2,
      nicotinamide,
      vitaminD3;
  const MedsTile(
      {Key? key,
      required this.vitaminB1,
      required this.calcium,
      required this.vitaminB12,
      required this.zincSulphateMonohydrate,
      required this.vitaminC,
      required this.folicAcid,
      required this.vitaminB2,
      required this.nicotinamide,
      required this.vitaminD3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text(
            'Vitamin B1',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(vitaminB1),
        ),
        ListTile(
          title: const Text(
            'Calcium',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(calcium),
        ),
        ListTile(
          title: const Text(
            'Vitamin B12',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(vitaminB12),
        ),
        ListTile(
          title: const Text(
            'Zinc Sulphate Monohydrate',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(zincSulphateMonohydrate),
        ),
        ListTile(
          title: const Text(
            'Vitamin C',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(vitaminC),
        ),
        ListTile(
          title: const Text(
            'Folic Acid',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(folicAcid),
        ),
        ListTile(
          title: const Text(
            'Vitamin B2',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(vitaminB2),
        ),
        ListTile(
          title: const Text(
            'Nicotinamide',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(nicotinamide),
        ),
        ListTile(
          title: const Text(
            'Vitamin D3',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(vitaminD3),
        ),
      ],
    );
  }
}
