import 'package:digiagro/Sercives/services.dart';
import 'package:digiagro/ktichenwaste.dart';
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

  Stream? getMedStream;
  Stream? getUsageStream;
  getMedsMethord() {
    Database().getManureExpiredMedicine().then((val) {
      getMedStream = val;
      print(val);
      setState(() {});
    });
    Database().getManureExpiredMedicineUsage().then((val) {
      getUsageStream = val;
      print(val);
      setState(() {});
    });
  }

  Widget getMedsWidget() {
    return StreamBuilder(
        stream: getMedStream,
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

  Widget getMedsUsageWidget() {
    return StreamBuilder(
        stream: getUsageStream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return MedUsage(
                        meth1: snapshot.data.docs[index]
                            ["Expired Medicines in Compost"],
                        meth2: snapshot.data.docs[index]
                            ["Feed Plants with Expired MultiVitamins"],
                        meth3: snapshot.data.docs[index]
                            ["Water your Plants with Expired Vitamins"]);
                  })
              : const Center(
                  child: CircularProgressIndicator(),
                );
        });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          elevation: 0,
          title: const TabBar(
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Text(
                  "Expired Medicine",
                ),
                Text("Kitchen Waste"),
              ]),
        ),
        body: TabBarView(
          children: [getMedsWidget(), getMedsUsageWidget()],
        ),
      ),
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

class MedUsage extends StatelessWidget {
  final String meth1, meth2, meth3;
  const MedUsage(
      {Key? key, required this.meth1, required this.meth2, required this.meth3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text(
            'Expired Medicines in Compost',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(meth1),
        ),
        ListTile(
          title: const Text(
            'Feed Plants with Expired MultiVitamins',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(meth2),
        ),
        ListTile(
          title: const Text(
            'Water your Plants with Expired Vitamins',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(meth3),
        ),
      ],
    );
  }
}
