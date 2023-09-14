import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:tenants_app/constants.dart';

class tenantsList extends StatefulWidget {
  const tenantsList({super.key});

  @override
  State<tenantsList> createState() => _tenantsListState();
}

Map tenantslistFB = {};
FirebaseDatabase database = FirebaseDatabase.instance;
// DatabaseReference ref = FirebaseDatabase.instance.ref("tenantsList/");
// DatabaseReference tenantsDataRef =
//     FirebaseDatabase.instance.ref("tenantsList2/");
// DatabaseReference wingRef = FirebaseDatabase.instance.ref("wingList/");
bool isdataloaded = false;

var houseVariable = "house1";
int selectedIndex = 0;
Map tenantslist2 = {
  "house1": [
    {
      "name": "nadeem",
      "room no": "1",
      "rentAmount": "1000",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
    {
      "name": "zeeshan",
      "room no": "2",
      "rentAmount": "1250",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
    {
      "name": "fatima",
      "room no": "3",
      "rentAmount": "650",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
    {
      "name": "abdul",
      "room no": "4",
      "rentAmount": "938",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
    {
      "name": "zahida",
      "room no": "5",
      "rentAmount": "1000rs",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
    {
      "name": "tanveer",
      "room no": "6",
      "rentAmount": "683",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
    {
      "name": "priti",
      "room no": "7",
      "rentAmount": "569",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
    {
      "name": "rita",
      "room no": "8",
      "rentAmount": "1120",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
    {
      "name": "ateeq",
      "room no": "9",
      "rentAmount": "1146",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
    {
      "name": "azhar",
      "room no": "10",
      "rentAmount": "863",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
    {
      "name": "ali",
      "room no": "11",
      "rentAmount": "568",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
  ],
  "house2": [
    {
      "name": "ali",
      "room no": "1",
      "rentAmount": "1000",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
    {
      "name": "tanveer",
      "room no": "2",
      "rentAmount": "1250",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
    {
      "name": "fatima",
      "room no": "3",
      "rentAmount": "650",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
    {
      "name": "abdul",
      "room no": "4",
      "rentAmount": "938",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
    {
      "name": "zahida",
      "room no": "5",
      "rentAmount": "1000rs",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
    {
      "name": "zeeshan",
      "room no": "6",
      "rentAmount": "683",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
    {
      "name": "priti",
      "room no": "7",
      "rentAmount": "569",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
    {
      "name": "rita",
      "room no": "8",
      "rentAmount": "1120",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
    {
      "name": "ateeq",
      "room no": "9",
      "rentAmount": "1146",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
    {
      "name": "azhar",
      "room no": "10",
      "rentAmount": "863",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
    {
      "name": "nadeem",
      "room no": "11",
      "rentAmount": "568",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
  ],
  "house3": [
    {
      "name": "nadeem",
      "room no": "1",
      "rentAmount": "1000",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
    {
      "name": "zeeshan",
      "room no": "2",
      "rentAmount": "1250",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
    {
      "name": "fatima",
      "room no": "3",
      "rentAmount": "650",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
    {
      "name": "abdul",
      "room no": "4",
      "rentAmount": "938",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
    {
      "name": "zahida",
      "room no": "5",
      "rentAmount": "1000rs",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
    {
      "name": "tanveer",
      "room no": "6",
      "rentAmount": "683",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
    {
      "name": "priti",
      "room no": "7",
      "rentAmount": "569",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
    {
      "name": "rita",
      "room no": "8",
      "rentAmount": "1120",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
    {
      "name": "ateeq",
      "room no": "9",
      "rentAmount": "1146",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
    {
      "name": "azhar",
      "room no": "10",
      "rentAmount": "863",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
    {
      "name": "ali",
      "room no": "11",
      "rentAmount": "568",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
  ],
  "house4": [
    {
      "name": "ali",
      "room no": "1",
      "rentAmount": "1000",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
    {
      "name": "tanveer",
      "room no": "2",
      "rentAmount": "1250",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
    {
      "name": "fatima",
      "room no": "3",
      "rentAmount": "650",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
    {
      "name": "abdul",
      "room no": "4",
      "rentAmount": "938",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
    {
      "name": "zahida",
      "room no": "5",
      "rentAmount": "1000rs",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
    {
      "name": "zeeshan",
      "room no": "6",
      "rentAmount": "683",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
    {
      "name": "priti",
      "room no": "7",
      "rentAmount": "569",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
    {
      "name": "rita",
      "room no": "8",
      "rentAmount": "1120",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
    {
      "name": "ateeq",
      "room no": "9",
      "rentAmount": "1146",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
    {
      "name": "azhar",
      "room no": "10",
      "rentAmount": "863",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
    {
      "name": "nadeem",
      "room no": "11",
      "rentAmount": "568",
      "rentMonth": "JUNE",
      "rentYear": "2023",
      "paymentStatus": "pending"
    },
  ]
};

class _tenantsListState extends State<tenantsList> {
  @override
  void initState() {
    isdataloaded = false;
    // addWingData(wingName: "house2");

    writeDataToFB();
    readDataFromFb();
    super.initState();
  }

  writeDataToFB() async {
    await constants.ref.set(tenantslist2);
  }

  readDataFromFb() async {
    constants.ref.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value as Map;
      setState(() {
        tenantslistFB = data;
        constants.tenantslistConst = tenantslistFB;
        isdataloaded = true;
      });

      print(
          "firebase data ${data["house3"][1]["rentAmount"]} ${tenantslistFB.keys.toList()}");
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Tenants App",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
          child: Container(
              color: Colors.white,
              height: height,
              width: width,
              child: isdataloaded
                  ? Column(
                      children: [
                        Container(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          height: height * 0.045,
                          width: width,
                          child: ListView.builder(
                            itemCount: tenantslistFB.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                padding:
                                    EdgeInsets.only(left: 3, top: 0, bottom: 6),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: selectedIndex == index
                                            ? Colors.white
                                            : Color.fromARGB(
                                                153, 255, 255, 255)),
                                    onPressed: () {
                                      setState(() {
                                        // readDataFromFb();
                                        selectedIndex = index;
                                        print(selectedIndex);
                                        houseVariable =
                                            tenantslistFB.keys.toList()[index];
                                      });
                                    },
                                    child: Text(
                                        "${tenantslistFB.keys.elementAt(index).toString()}")),
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              itemCount: tenantslistFB[houseVariable].length,
                              itemBuilder: (context, index) {
                                return Container(
                                    color: Colors.white,
                                    child: ListTile(
                                      leading: CircleAvatar(
                                          child: Text(
                                              '${tenantslistFB[houseVariable][index]["room no"]}')),
                                      title: Text(
                                          "${tenantslistFB[houseVariable][index]["name"].toString().toUpperCase()}"),
                                      subtitle: Text(
                                          'Amount: ${tenantslistFB[houseVariable][index]["rentAmount"]} \nBill Date: ${tenantslistFB[houseVariable][index]["rentMonth"]}${tenantslistFB[houseVariable][index]["rentYear"]}'),
                                      trailing: Text(
                                          "payment status: \n${tenantslistFB[houseVariable][index]["paymentStatus"]}"),
                                    ));
                              },
                              separatorBuilder: (context, index) {
                                return Divider(
                                  height: 0.1,
                                );
                              }),
                        ),
                      ],
                    )
                  : Center(
                      child: Container(
                        height: 40,
                        width: 40,
                        child: const CircularProgressIndicator(
                          color: Colors.green,
                        ),
                      ),
                    ))),
    );
  }
}
