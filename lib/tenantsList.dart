import 'package:flutter/material.dart';

class tenantsList extends StatefulWidget {
  const tenantsList({super.key});

  @override
  State<tenantsList> createState() => _tenantsListState();
}

var houseVariable = "house1";
int selectedIndex = 2;
List<Map> tenantslist = [
  {
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
    ],
  }
];

class _tenantsListState extends State<tenantsList> {
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
              color: Theme.of(context).colorScheme.onInverseSurface,
              height: height,
              width: width,
              child: Column(
                children: [
                  Container(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    height: height * 0.045,
                    width: width,
                    child: ListView.builder(
                      itemCount: tenantslist[0].length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.only(left: 3, top: 0, bottom: 6),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: selectedIndex == index
                                      ? Colors.white
                                      : Color.fromARGB(153, 255, 255, 255)),
                              onPressed: () {
                                setState(() {
                                  selectedIndex = index;
                                  print(selectedIndex);
                                  houseVariable = tenantslist[0]
                                      .keys
                                      .elementAt(index)
                                      .toString();
                                });
                              },
                              child: Text(
                                  "${tenantslist[0].keys.elementAt(index).toString()}")),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemCount: tenantslist[0][houseVariable].length,
                        itemBuilder: (context, index) {
                          return Container(
                              color: houseVariable == "house1"
                                  ? Theme.of(context)
                                      .colorScheme
                                      .onInverseSurface
                                  : houseVariable == "house2"
                                      ? Theme.of(context)
                                          .colorScheme
                                          .onInverseSurface
                                      : Theme.of(context)
                                          .colorScheme
                                          .onInverseSurface,
                              child: ListTile(
                                leading: CircleAvatar(
                                    child: Text(
                                        '${tenantslist[0][houseVariable][index]["room no"]}')),
                                title: Text(
                                    "Name: ${tenantslist[0][houseVariable][index]["name"]}"),
                                subtitle: Text(
                                    'Amount: ${tenantslist[0][houseVariable][index]["rentAmount"]} Bill Date: ${tenantslist[0][houseVariable][index]["rentMonth"]}${tenantslist[0][houseVariable][index]["rentYear"]}'),
                                trailing: Text(
                                    "payment status: \n${tenantslist[0][houseVariable][index]["paymentStatus"]}"),
                              ));
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            height: 0.1,
                          );
                        }),
                  ),
                ],
              ))),
    );
  }
}
