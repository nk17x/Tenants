import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:tenants_app/constants.dart';

class tenantsList extends StatefulWidget {
  const tenantsList({super.key});

  @override
  State<tenantsList> createState() => _tenantsListState();
}

Map tenantslistFB = {};
bool isdataloaded = false;
bool isDataempty = false;
var houseVariable = "";
int selectedIndex = 0;

class _tenantsListState extends State<tenantsList> {
  @override
  void initState() {
    isdataloaded = false;
    readDataFromFb();
    super.initState();
  }

  readDataFromFb() async {
    constants.ref.onValue.listen((DatabaseEvent event) {
      if (!event.snapshot.exists) {
        setState(() {
          isDataempty = true;
          isdataloaded = true;
        });

        return;
      }
      final data = event.snapshot.value as Map;
      if (mounted) {
        setState(() {
          isDataempty = false;
          tenantslistFB = data;
          constants.tenantslistConst = tenantslistFB;
          houseVariable = tenantslistFB.keys.toList()[0];
          selectedIndex = 0;
          isdataloaded = true;
        });
      }
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
        title: Text("Tenants",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
          child: Container(
              color: Colors.white,
              height: height,
              width: width,
              child: isdataloaded
                  ? !isDataempty
                      ? Column(
                          children: [
                            Container(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              height: height * 0.045,
                              width: width,
                              child: ListView.builder(
                                itemCount: tenantslistFB.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: EdgeInsets.only(
                                        left: 3, top: 0, bottom: 6),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                selectedIndex == index
                                                    ? Colors.white
                                                    : Color.fromARGB(
                                                        153, 255, 255, 255)),
                                        onPressed: () {
                                          setState(() {
                                            // readDataFromFb();
                                            selectedIndex = index;
                                            print(selectedIndex);
                                            houseVariable = tenantslistFB.keys
                                                .toList()[index];
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
                                  itemCount:
                                      tenantslistFB[houseVariable].length,
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
                                              'Rent Amount: ${tenantslistFB[houseVariable][index]["rentAmount"]} \nBill Date: ${tenantslistFB[houseVariable][index]["rentMonth"]} ${tenantslistFB[houseVariable][index]["rentYear"]} \nPayment Status: ${tenantslistFB[houseVariable][index]["paymentStatus"].toString().toUpperCase()}'),
                                          // trailing: Text(""),
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
                          child: Text(
                              "There are no Tenants,\nAdd Tenants to see them here!"),
                        ))
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
